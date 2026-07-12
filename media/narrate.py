# SPDX-License-Identifier: Apache-2.0
"""Produce narrated videos: synthesize the chapter narration with macOS `say`
(built-in TTS, no dependencies, no network) and mux it onto the matching Manim
scene, extending the clip to the narration length. Also builds a per-chapter reel.

The spoken text is extracted from `scripts/chNN.md`: each `## Segment` block names
its scene via `(scene: SceneName ...)` and the prose lines (minus headers, `[cue]`
markers, and list items) are the narration. This keeps the video's narration a
faithful re-voicing of the book prose (prompt.md section 7).

Usage (from the `media/` directory):
    uv run python narrate.py            # all chapters
    uv run python narrate.py 00 01      # specific chapters

Requires: macOS `say`, `ffmpeg`, `ffprobe`, and the Manim venv (uv). Outputs to
media/media/narrated/ (git-ignored). See DECISIONS.md ADR-0012.
"""

from __future__ import annotations

import os
import re
import subprocess
import sys
import tempfile

VOICE = "Samantha"
QUALITY = "480p15"  # matches `manim -ql`
HERE = os.path.dirname(os.path.abspath(__file__))
OUT_DIR = os.path.join(HERE, "media", "narrated")

# chapter -> (script markdown, manim source file)
CHAPTERS = {
    "00": ("scripts/ch00.md", "manim/ch00/spectral.py"),
    "01": ("scripts/ch01.md", "manim/ch01/qubit.py"),
    "02": ("scripts/ch02.md", "manim/ch02/observable.py"),
    "03": ("scripts/ch03.md", "manim/ch03/born.py"),
    "04": ("scripts/ch04.md", "manim/ch04/dynamics.py"),
    "05": ("scripts/ch05.md", "manim/ch05/entanglement.py"),
}


def parse_segments(md_path: str) -> list[tuple[str, str]]:
    """Return [(scene_name, spoken_text)] for each `## Segment` block."""
    text = open(md_path, encoding="utf-8").read()
    blocks = re.split(r"^##\s+Segment", text, flags=re.M)[1:]
    out: list[tuple[str, str]] = []
    for block in blocks:
        m = re.search(r"scene:\s*`?([A-Za-z0-9_]+)`?", block)
        if not m:
            continue
        scene = m.group(1)
        spoken: list[str] = []
        for line in block.splitlines()[1:]:  # skip the segment header line
            s = line.strip()
            if not s or s.startswith(("[cue", "#", "-", "[", "<!--", "|")):
                continue
            s = re.sub(r"`([^`]*)`", r"\1", s)  # drop code ticks
            s = re.sub(r"\[cue[^\]]*\]", "", s)  # drop inline cues
            spoken.append(s)
        blob = re.sub(r"\s+", " ", " ".join(spoken)).strip()
        if blob:
            out.append((scene, blob))
    return out


def duration(path: str) -> float:
    r = subprocess.run(
        ["ffprobe", "-v", "error", "-show_entries", "format=duration",
         "-of", "csv=p=0", path],
        capture_output=True, text=True, check=True,
    )
    return float(r.stdout.strip())


def render_scenes(py_file: str) -> None:
    """Render every scene in the file at -ql so filenames match scene names."""
    subprocess.run(
        ["uv", "run", "manim", "-ql", "--disable_caching", "-a", py_file],
        cwd=HERE, check=True,
    )


def scene_mp4(py_file: str, scene: str) -> str:
    stem = os.path.splitext(os.path.basename(py_file))[0]
    return os.path.join(HERE, "media", "videos", stem, QUALITY, f"{scene}.mp4")


def narrate_segment(video: str, text: str, out: str, tmp: str) -> None:
    txt_path = os.path.join(tmp, "narr.txt")
    aiff = os.path.join(tmp, "narr.aiff")
    open(txt_path, "w", encoding="utf-8").write(text)
    subprocess.run(["say", "-v", VOICE, "-f", txt_path, "-o", aiff], check=True)
    vdur, adur = duration(video), duration(aiff)
    target = max(vdur, adur) + 0.4  # small tail
    vpad = max(0.0, target - vdur)
    subprocess.run(
        ["ffmpeg", "-y", "-loglevel", "error", "-i", video, "-i", aiff,
         "-filter_complex",
         f"[0:v]tpad=stop_mode=clone:stop_duration={vpad:.3f}[v];[1:a]apad[a]",
         "-map", "[v]", "-map", "[a]", "-t", f"{target:.3f}",
         "-c:v", "libx264", "-pix_fmt", "yuv420p", "-c:a", "aac",
         "-movflags", "+faststart", out],
        check=True,
    )


def build_reel(parts: list[str], out: str, tmp: str) -> None:
    listf = os.path.join(tmp, "concat.txt")
    with open(listf, "w", encoding="utf-8") as f:
        for p in parts:
            f.write(f"file '{p}'\n")
    subprocess.run(
        ["ffmpeg", "-y", "-loglevel", "error", "-f", "concat", "-safe", "0",
         "-i", listf, "-c", "copy", "-movflags", "+faststart", out],
        check=True,
    )


def main(chapters: list[str]) -> None:
    os.makedirs(OUT_DIR, exist_ok=True)
    for ch in chapters:
        script, py_file = CHAPTERS[ch]
        print(f"[ch{ch}] rendering scenes from {py_file}")
        render_scenes(py_file)
        segments = parse_segments(os.path.join(HERE, script))
        parts: list[str] = []
        with tempfile.TemporaryDirectory() as tmp:
            for i, (scene, text) in enumerate(segments):
                video = scene_mp4(py_file, scene)
                if not os.path.exists(video):
                    print(f"  ! missing scene mp4 for {scene}: {video}")
                    continue
                out = os.path.join(OUT_DIR, f"ch{ch}_{i:02d}_{scene}.mp4")
                print(f"  narrating {scene} ({len(text)} chars) -> {out}")
                narrate_segment(video, text, out, tmp)
                parts.append(out)
            if parts:
                reel = os.path.join(OUT_DIR, f"ch{ch}_reel.mp4")
                build_reel(parts, reel, tmp)
                print(f"  reel -> {reel}")
    print(f"done. narrated videos in {OUT_DIR}")


if __name__ == "__main__":
    args = sys.argv[1:] or list(CHAPTERS.keys())
    unknown = [a for a in args if a not in CHAPTERS]
    if unknown:
        sys.exit(f"unknown chapters: {unknown}; known: {list(CHAPTERS)}")
    main(args)
