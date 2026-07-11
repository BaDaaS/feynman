# Decisions (ADR log)

Architecture / design decisions for the verified, illustrated QM book. Newest
last. Each entry: context, decision, rationale, consequences. Kickoff decisions
that resolve the `TODO(author)` items in `prompt.md` §13 are recorded here.

---

## ADR-0001 - Pinned toolchain: Lean / Mathlib / Verso all at v4.31.0

- **Date**: 2026-07-11
- **Context**: The book combines three dependencies that must agree on one Lean
  toolchain: Mathlib (the mathematics), Verso (the book), and leanblueprint (the
  dependency graph). Historically Verso lagged Mathlib; that is not the case now.
- **Decision**: Pin
  - `lean-toolchain` = `leanprover/lean4:v4.31.0`
  - Mathlib `require` rev = `v4.31.0`
  - Verso `require` rev = `v4.31.0`
  - leanblueprint = latest from PyPI (pure-Python plasTeX plugin; no Lean pin).
  - ManimCE = `manim` 0.20.1 (resolved by `uv`; recorded in `media/uv.lock`).
- **Rationale**: v4.31.0 is the newest *stable* Lean release for which both
  Mathlib and Verso ship a matching tag (verified by fetching each repo's
  `lean-toolchain` at that tag). v4.32.0 exists only as `-rc1`; we take stable
  for the project baseline. Matching the *tag* (not merely the toolchain string)
  keeps Verso's and Mathlib's shared transitive deps (e.g. `plausible`)
  mutually consistent, since Lake resolves each package name once ("first
  require wins").
- **Consequences**:
  - `lake exe cache get` fetches only the **Mathlib** olean cache; Verso and its
    deps (`subverso`, `MD4Lean`, `illuminate`) compile from source on first
    build (longer initial build; `MD4Lean` also builds a small C library). This
    is expected, not an error.
  - Re-verification duty (prompt §11): a scheduled pass bumps this triple, re-runs
    the full build, and migrates any newly-provable `sorry`-nodes off the
    frontier. When bumping, pick the newest Lean version for which BOTH Mathlib
    and Verso have a matching tag (read `verso/main/lean-toolchain` for the
    current Verso target).

## ADR-0002 - Book output: HTML and PDF, co-equal

- **Date**: 2026-07-11
- **Context**: `prompt.md` §13 (TODO author) - primary book output. Verso's
  strength is interactive HTML (hovers, go-to-definition, rendered proof states).
- **Decision** (author): maintain **both** HTML and PDF as co-equal outputs.
- **Rationale**: Author preference. HTML carries the interactive proof-state
  rendering that keeps the book from drifting from the proofs; PDF serves print
  / offline / archival reading.
- **Consequences**: The build command produces both. Verso's `Manual` genre
  supports an HTML site and a (LaTeX-derived) print output; the PDF path is
  exercised as a first-class target, not an afterthought.

## ADR-0003 - Blueprint: full leanblueprint from day one

- **Date**: 2026-07-11
- **Context**: `prompt.md` §13 (TODO author) - blueprint depth.
- **Decision** (author): stand up **full leanblueprint** (LaTeX + dependency
  graph + web output) as part of the vertical slice, not just `PROGRESS.md`.
- **Rationale**: Author preference; the blueprint *is* the project's map
  (prompt §4), so make it authoritative immediately. The verified/frontier line
  (§2) is exactly what the graph encodes.
- **Consequences**: leanblueprint (Python) + graphviz + a TeX install are build
  dependencies for the blueprint target. `leanblueprint checkdecls` ties graph
  nodes to real Lean declaration names, enforcing "one source of truth" (§3).

## ADR-0004 - Narration scripts: neutral (usable for self-record OR TTS)

- **Date**: 2026-07-11
- **Context**: `prompt.md` §13 (TODO author) - voice/production.
- **Decision** (author): write narration **neutral** - natural lecture prose,
  English, with timing cues, optimized for neither human voiceover nor a
  specific TTS engine.
- **Rationale**: Author preference; keeps options open. Register: lecture (the
  §13 default).
- **Consequences**: Scripts avoid engine-specific SSML but expand symbols into
  spoken words (so a TTS pass is possible) while staying readable aloud.

## ADR-0005 - Licensing: dual (Apache-2.0 code, CC-BY-SA-4.0 book/media)

- **Date**: 2026-07-11
- **Context**: `prompt.md` §13 (TODO author) - repo/CI host & license.
- **Decision** (author): public GitHub; **Apache-2.0** for the Lean code
  (`QuantumBook/`, `tools/`, build scripts), **CC-BY-SA-4.0** for the book text,
  narration, ASCII, and media (`book/`, `media/`, `blueprint/`, `references/`
  prose). See `LICENSING.md`, `LICENSE-CODE`, `LICENSE-BOOK`.
- **Rationale**: Author preference. Permissive code license maximizes reuse of
  the formalization; ShareAlike keeps the pedagogical prose open. This split is
  standard for verified-math + exposition repos.
- **Consequences**: New files carry an SPDX header naming their license. The
  exact GitHub remote is set by the author; until then the README states the
  intended host.

## ADR-0006 - Manim labels use plain text (Pango), not LaTeX (MathTex)

- **Date**: 2026-07-11
- **Context**: ManimCE renders typeset math via `MathTex`, which shells out to a
  LaTeX -> dvi -> svg toolchain needing `standalone.cls`, `dvisvgm`, `preview`,
  and `doublestroke`. The machine's TeX install (MacTeX BasicTeX 2026) lacks
  these, and `tlmgr install` requires admin rights.
- **Decision**: The Tier-0 Manim scenes use `Text` (Pango) with ASCII math
  labels (`A e_2 = lambda_2 . e_2`), so they render from a clean environment with
  no extra TeX packages. Upgrading to `MathTex` is a documented, optional step.
- **Rationale**: Invariant 4 (reproducible from clean) outweighs prettier labels
  for the vertical slice. A `sudo` system-wide TeX change should be the author's
  call, not silently required by the build.
- **Consequences**: To switch on typeset math later, run
  `sudo tlmgr install standalone dvisvgm preview doublestroke` and replace `Text`
  with `MathTex` in `media/manim/**`. The scene geometry (eigenvectors,
  eigenvalues) is already computed from the real matrix, so only labels change.
  The blueprint/LaTeX and the book's PDF path use the full LaTeX install
  separately and are unaffected.

## ADR-0007 - Blueprint decl check via `lake env lean`, not the `checkdecls` exe

- **Date**: 2026-07-11
- **Context**: `leanblueprint checkdecls` shells out to `lake exe checkdecls`,
  which requires adding the `checkdecls` Lean program as a git dependency (another
  toolchain-matched package). The prompt (§9) says to ask before adding a
  heavyweight dependency.
- **Decision**: Validate blueprint `\lean{}` names with `tools/check-blueprint-decls.sh`,
  which greps the names and `#check`s each against the already-built `QuantumBook`
  via `lake env lean`. Same guarantee (every node ties to a real declaration), no
  new Lean dependency.
- **Rationale**: Keeps the dependency set minimal and toolchain-risk-free while
  fully honoring invariant 3 (one source of truth). The blueprint PDF
  (`leanblueprint pdf` / xelatex) and web dep-graph (`leanblueprint web`) work as-is.
- **Consequences**: If the project later wants the canonical `checkdecls` exe (e.g.
  to match the upstream `leanblueprint.yml` CI action), add
  `require checkdecls from git ...` pinned to a v4.31.0-compatible rev. Also note:
  `latexmk` is absent from the base TeX install, so the Makefile calls `xelatex`
  directly for the blueprint PDF, and `gs`/`dvisvgm` being absent makes the web
  blueprint render math as bitmaps (pdftoppm fallback) rather than SVG - cosmetic.

## ADR-0008 - Toolchain/system dependencies for a clean rebuild

- **Date**: 2026-07-11
- **Context**: Invariant 4 requires a documented, reproducible rebuild from clean.
- **Decision**: The build depends on: `elan`/`lake` (Lean, pinned by
  `lean-toolchain`); the Mathlib olean cache (`lake exe cache get`); `uv` (Manim
  venv, `media/`); `ffmpeg` (Manim rendering); a TeX install with `xelatex` (book
  PDF + blueprint PDF); `graphviz`/`dot` (blueprint dep graph); and the
  `tools/.venv` Python env (`leanblueprint`, `plastex`). All are invoked through
  Makefile targets.
- **Rationale**: One `make setup` establishes the environments; `make all` rebuilds
  every artifact. Optional niceties (MathTex, SVG blueprint math) need extra TeX
  packages via `sudo tlmgr` and are documented, not required.
- **Consequences**: `make setup` must be run once on a clean checkout before
  `make all`. Versions are pinned where the tool allows (`lean-toolchain`,
  `media/uv.lock`); system tools (ffmpeg, graphviz, TeX) are provisioned via the
  platform package manager and their versions recorded in ADR-0001.

## ADR-0009 - GitHub Actions: CI + Pages deploy; changelog/PR-hygiene deferred

- **Date**: 2026-07-11
- **Context**: The repo lives at `github.com/BaDaaS/feynman` (public, so the book
  can publish on GitHub Pages free tier). We need CI and a published book.
- **Decision**:
  - `.github/workflows/ci.yml`: builds `QuantumBook` (via `leanprover/lean-action`
    pinned to a commit SHA, which handles elan + the Mathlib olean cache), runs the
    no-sorry check, the book renderer, the blueprint decl check, and shellcheck -
    all through Makefile targets (per rules/makefile.md).
  - `.github/workflows/pages.yml`: renders the interactive HTML book and deploys it
    to GitHub Pages (`actions/deploy-pages`), source set to GitHub Actions.
  - Actions are pinned: `lean-action` and `free-disk-space` by commit SHA;
    first-party `actions/*` by major tag.
- **Rationale**: `lean-action` is the sanctioned, cache-aware way to build a Mathlib
  project in CI without a `curl | sh` elan install (respects the
  untrusted-execution rule). Pages needs a public repo on the free tier, matching
  the CC-BY-SA "public" decision (ADR-0005).
- **Deviation from the personal GitHub-workflow standard**: that standard also
  mandates changelog and PR-hygiene workflows. These are DEFERRED during
  bootstrapping (large agent-authored commits would fail the 500-line PR-size gate,
  and there is no PR flow yet). Add `changelog.yaml` + `pr-hygiene.yaml` (toolbox
  scripts) when the repo moves to a PR-based flow with a `CHANGELOG.md`.
- **Consequences**: CI runtime is dominated by Verso compiling from source (Mathlib
  is cached). The Pages URL is `https://badaas.github.io/feynman/` after the first
  deploy.

## ADR-0010 - Repository Claude Code skills (`.claude/skills/`)

- **Date**: 2026-07-11
- **Context**: This is a long-horizon, multi-session project with a strict
  four-layer discipline (§5) and hard invariants (§2). Encoding the repeatable
  workflows as in-repo skills keeps future sessions consistent.
- **Decision**: Ship project skills under `.claude/skills/`:
  `add-concept` (drive one concept through all four layers + provenance),
  `lean-proof-loop` (search Mathlib, prove, verify no-sorry/axioms),
  `verso-chapter` (author/extend a Verso chapter tied to Lean decls),
  `manim-scene` (add a faithful ManimCE scene + narration), and
  `blueprint-node` (add/lint a blueprint node and run the decl check).
- **Rationale**: The prompt's working loop (§9) and three-layer discipline (§5) are
  procedural knowledge best captured as skills, not re-derived each session.
- **Consequences**: Skills reference the pinned toolchain and the invariants; keep
  them in lockstep with `DECISIONS.md` and the Makefile targets.
