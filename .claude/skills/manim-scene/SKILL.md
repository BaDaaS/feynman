---
name: manim-scene
description: >-
  Add a ManimCE scene (and its narration entry) that faithfully visualizes a
  formal object from QuantumBook/, rendering from a clean environment. Use when
  adding the video layer for a concept.
---

# Add a Manim scene + narration

The animation must be faithful to the formal object: if it shows a rotation on the
Bloch sphere, that rotation IS the unitary defined in `QuantumBook/`. Compute the
geometry from the actual matrix/operator (with numpy), do not hand-fake it.

## Scene file

- One module per chapter: `media/manim/chNN/<concept>.py`. SPDX header
  `# SPDX-License-Identifier: CC-BY-SA-4.0`.
- Name scene classes after the concept (`QubitBlochScene`,
  `EntanglementTensorScene`).
- Each scene's class docstring carries a `depicts: QuantumBook.<Part>.<name>` tag
  tying it to the formal referent.
- Derive numbers from the real object, e.g.:
  `A = np.array([[2,1],[1,2]]); vals, vecs = np.linalg.eigh(A)` and animate `vals`
  / `vecs` - so the picture cannot contradict the theorem.

## Labels: plain text, not LaTeX (this environment)

The base TeX install lacks `standalone`/`dvisvgm`, so `MathTex` fails. Use `Text`
(Pango) with ASCII math labels (`A e_2 = lambda_2 . e_2`, `conj(mu) = mu`). To
upgrade to typeset math later: `sudo tlmgr install standalone dvisvgm preview
doublestroke` and switch `Text` -> `MathTex` (geometry is already numeric, so only
labels change). See DECISIONS.md ADR-0006.

## Narration

Add a segment in `media/scripts/chNN.md` (neutral register, per ADR-0004): natural
lecture prose, symbols written out as words, timing cues that reference the scene.
The script is a re-voicing of the book chapter, not a separate story. List the
formal referents at the top. SPDX `CC-BY-SA-4.0`.

## Render / verify

- From `media/`: `uv run manim -ql --disable_caching manim/chNN/<file>.py <Scene>`
  for a fast check; `-qm` for medium quality.
- Or `make videos` (renders the chapter's scenes).
- Requires `ffmpeg` (installed) and the Manim venv (`make setup-media`).
- Outputs land under `media/media/videos/...` (git-ignored).
