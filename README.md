# A Verified, Illustrated Book on Quantum Mechanics

A book on quantum mechanics in which the mathematics is **machine-verified in
Lean 4** (against Mathlib), the prose lives beside the code, structural
abstractions are drawn in ASCII, and each chapter carries an animation + narration
layer so the material can be turned into videos.

It is written for a math-first reader (strong algebra/geometry and
formal-methods sensibility) who has seen quantum mechanics before: the route is
operator-algebraic, representation-theoretic, geometric, and categorical rather
than PDE-first. Physical intuition is welcome but never substitutes for a proof.

This repository currently contains the **Tier-0 vertical slice**: one concept, the
finite-dimensional spectral theorem, carried end to end through every layer to
prove the pipeline works. See `PROGRESS.md` for status and `prompt.md` for the full
project constitution.

## The core invariant

Every mathematical claim in the book is exactly one of:

1. a fully proven Lean theorem with **no `sorry`**; or
2. a theorem carrying a `sorry` **explicitly flagged as frontier** (not yet in
   Mathlib) and tracked as a blueprint node; or
3. a clearly marked informal/physical remark that makes **no formal claim**.

There is no fourth category, and no hidden `sorry`. Finite-dimensional results are
fully proven; unbounded/infinite-dimensional results are frontier nodes.

## Layout

```
QuantumBook/        THE LIBRARY: Lean defs + theorems (the single source of truth)
  Foundations/      Part 0 - substrate: finite-dim Hilbert spaces, spectral theorem
  FiniteDim/ Algebraic/ Geometry/ Frontier/ Categorical/   (later parts; see SCOPE.md)
book/               THE BOOK: Verso sources (.lean); chapters import decls by name
  Book.lean         root document (assembles chapters)
  Chapters/         one file per chapter (prose + ASCII, referencing Lean decls)
  Main.lean         book renderer executable
blueprint/          leanblueprint: LaTeX + dependency graph (proven vs frontier)
media/              THE ANIMATION LAYER
  manim/chNN/       ManimCE scenes (faithful to the formal objects)
  scripts/          narration scripts (a re-voicing of the chapter prose)
references/         THE SCHOLARSHIP LAYER
  bibliography.bib  every cited work (verified DOIs/arXiv/URLs)
  sources.md        per-concept provenance: Lean decl -> sources
  reading-map.md    route-organized, annotated reading list
tools/              build + check scripts (+ the Python tools venv)
build/              GENERATED: HTML/PDF book, mp4 renders (git-ignored)
DECISIONS.md        ADR-style log of design decisions
PROGRESS.md         status mirror of the blueprint (depth/frontier ledger)
SCOPE.md            whole-territory coverage map (breadth ledger)
```

**Key rule:** `QuantumBook/` is the truth; `book/` narrates it; `media/` animates
it. Book chapters reference real declarations (via Verso's `{docstring ...}`), so
the prose cannot drift from the proofs.

## Pinned versions (see `DECISIONS.md` ADR-0001)

| Component | Version | Pinned in |
| --------- | ------- | --------- |
| Lean      | `leanprover/lean4:v4.31.0` | `lean-toolchain` |
| Mathlib   | `v4.31.0` | `lakefile.toml` |
| Verso     | `v4.31.0` | `lakefile.toml` |
| ManimCE   | 0.20.1    | `media/uv.lock` |
| leanblueprint | latest (PyPI) | `tools/.venv` |

## Rebuild from clean

Prerequisites (system tools, provisioned via your platform package manager):
`elan`/`lake` (Lean), `uv` (Python), `ffmpeg`, a TeX install with `xelatex`, and
`graphviz` (`dot`). On macOS: `brew install ffmpeg graphviz`, and a MacTeX/BasicTeX
install for `xelatex`.

```sh
# 0. First clone only: resolve the Lean dependency graph.
lake update

# 1. One-time setup of all build environments (Mathlib cache, Manim venv, tools venv).
make setup

# 2. Build every artifact (proofs, book HTML+PDF, blueprint, videos).
make all

# Or verify only (proofs + no-sorry + blueprint decl check):
make check
```

`make help` lists all targets. Individual layers: `make proofs`, `make book`,
`make blueprint`, `make videos`.

### Outputs

- Interactive HTML book: `build/book/html-multi/index.html`
- Book LaTeX/PDF source: `build/book/tex/`
- Blueprint PDF: `blueprint/print/print.pdf`; web dep-graph: `blueprint/web/index.html`
- Videos: `media/media/videos/spectral/`

## Verification

- `make verify-no-sorry` runs `lake build --wfail` (fails on any `sorry`).
- `make check-blueprint` (`tools/check-blueprint-decls.sh`) verifies every
  blueprint `\lean{}` node names a real declaration in the built library.
- Axiom hygiene is checked with `#print axioms` (the Tier-0 theorems depend only on
  `propext`, `Classical.choice`, `Quot.sound`).

## License

Dual-licensed (see `LICENSING.md`): **Apache-2.0** for the Lean code and tooling
(`LICENSE-CODE`), **CC-BY-SA-4.0** for the book prose, narration, ASCII, and media
(`LICENSE-BOOK`). Home: <https://github.com/badaas/feynman>.

## Scholarship

Never fabricate a citation. Every reference resolves to a verified canonical or
archived URL/DOI/arXiv ID; unverifiable ones are marked `[unverified]`. We cite and
paraphrase, and do not reproduce substantial copyrighted text. See
`references/reading-map.md`.
