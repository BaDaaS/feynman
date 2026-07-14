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

## ADR-0004 - Narration scripts: neutral (usable for self-record OR TTS) [WITHDRAWN]

- **Date**: 2026-07-11
- **Status**: Withdrawn 2026-07-14. The video/animation layer (Manim scenes,
  narration scripts, narrated reels) was removed from the repository; the book
  is now formal + book + provenance. See the layout in `README.md`.

## ADR-0005 - Licensing: dual (Apache-2.0 code, CC-BY-SA-4.0 book)

- **Date**: 2026-07-11
- **Context**: `prompt.md` §13 (TODO author) - repo/CI host & license.
- **Decision** (author): public GitHub; **Apache-2.0** for the Lean code
  (`QuantumBook/`, `tools/`, build scripts), **CC-BY-SA-4.0** for the book text
  and ASCII (`book/`, `blueprint/`, `references/` prose). See `LICENSING.md`,
  `LICENSE-CODE`, `LICENSE-BOOK`.
- **Rationale**: Author preference. Permissive code license maximizes reuse of
  the formalization; ShareAlike keeps the pedagogical prose open. This split is
  standard for verified-math + exposition repos.
- **Consequences**: New files carry an SPDX header naming their license. The
  exact GitHub remote is set by the author; until then the README states the
  intended host.

## ADR-0006 - Manim labels use plain text (Pango), not LaTeX (MathTex) [WITHDRAWN]

- **Date**: 2026-07-11
- **Status**: Withdrawn 2026-07-14. The video/animation layer (ManimCE scenes)
  was removed from the repository, so the Manim label decision no longer applies.

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
  `lean-toolchain`); the Mathlib olean cache (`lake exe cache get`); `uv` (the
  `tools/.venv` Python env); a TeX install with `xelatex` (book PDF + blueprint
  PDF); `graphviz`/`dot` (blueprint dep graph); and that `tools/.venv` env
  (`leanblueprint`, `plastex`). All are invoked through Makefile targets.
- **Rationale**: One `make setup` establishes the environments; `make all` rebuilds
  every artifact. Optional niceties (SVG blueprint math) need extra TeX packages
  via `sudo tlmgr` and are documented, not required.
- **Consequences**: `make setup` must be run once on a clean checkout before
  `make all`. Versions are pinned where the tool allows (`lean-toolchain`);
  system tools (graphviz, TeX) are provisioned via the platform package manager
  and their versions recorded in ADR-0001.

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

## ADR-0011 - Reading-map scope: math-first plus a physicist's cross-reference track

- **Date**: 2026-07-12
- **Context**: `prompt.md` §13 (TODO author) - reading-map scope: stay strictly
  math-first, or also carry a parallel physicist's track (Griffiths / Sakurai /
  Shankar / Zwiebach) for cross-reference.
- **Decision** (author): keep the reading map math-first, but add a clearly-labeled
  "Physicist's track (cross-reference)" section listing the standard physics texts
  (Griffiths-Schroeter, Sakurai-Napolitano, Shankar, Zwiebach, Cohen-Tannoudji,
  Feynman Vol III [free], Weinberg, Ballentine), each with a verified DOI/URL/ISBN
  and a one-line "which reader it serves" annotation.
- **Rationale**: Author preference; a math-first reader still benefits from knowing
  where the physics-first community's standard references sit, without diluting the
  main list. All links verified per invariant 7 (Feynman Vol III free edition
  confirmed live; the caltech.edu host 403s automated fetchers, so liveness was
  confirmed via indexed chapter pages).
- **Consequences**: `references/reading-map.md` gains the section and
  `references/bibliography.bib` the entries (keys `Griffiths2018`,
  `SakuraiNapolitano2021`, `Shankar1994`, `Zwiebach2022`, `CohenTannoudji`,
  `FeynmanIII`, `Weinberg2015QM`, `Ballentine2014`). The coverage-ambition §13 TODO
  (how far into Tier 5+ / toward QFT) remains open.

## ADR-0012 - Narrated videos: local macOS `say` TTS, committed reels, Pages /watch [WITHDRAWN]

- **Date**: 2026-07-12
- **Status**: Withdrawn 2026-07-14. The video/animation layer was removed from
  the repository: the `media/` tree (Manim scenes, narration scripts,
  `narrate.py`, committed reels), the `videos`/`narrate` Makefile targets, and
  the Pages `/watch` publish step are all gone. The book ships as formal + book
  + provenance.
