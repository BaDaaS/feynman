# A Verified, Illustrated Book on Quantum Mechanics

A book on quantum mechanics in which the mathematics is **machine-verified in
Lean 4** (against Mathlib), the prose lives beside the code, and structural
abstractions are drawn in ASCII.

It is written for a math-first reader (strong algebra/geometry and
formal-methods sensibility) who has seen quantum mechanics before: the route is
operator-algebraic, representation-theoretic, geometric, and categorical rather
than PDE-first. Physical intuition is welcome but never substitutes for a proof.

**Read the book online:** <https://badaas.github.io/feynman/> (redirects to the
org's custom domain <https://badaas.be/feynman/>; both serve the live interactive
book, rebuilt on every push by the GitHub Pages workflow).

This repository currently contains the **Tier-0 vertical slice**: one concept, the
finite-dimensional spectral theorem, carried end to end through every layer to
prove the pipeline works. See `PROGRESS.md` for status and `prompt.md` for the full
project constitution.

**The course.** [`course/`](course/) holds the full, route-organized curriculum
this book is built to teach: a [module map and dependency graph](course/README.md),
a dated and sourced [historical arc](course/history.md), a detailed
[module-by-module syllabus](course/syllabus.md) (every module anchored to a Lean
declaration or a frontier flag), and a [foundations track](course/foundations.md)
that separates the theorems from the interpretation. It links throughout to the
verified [reading map](references/reading-map.md).

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
references/         THE SCHOLARSHIP LAYER
  bibliography.bib  every cited work (verified DOIs/arXiv/URLs)
  sources.md        per-concept provenance: Lean decl -> sources
  reading-map.md    route-organized, annotated reading list
tools/              build + check scripts (+ the Python tools venv)
build/              GENERATED: HTML/PDF book (git-ignored)
DECISIONS.md        ADR-style log of design decisions
PROGRESS.md         status mirror of the blueprint (depth/frontier ledger)
SCOPE.md            whole-territory coverage map (breadth ledger)
```

**Key rule:** `QuantumBook/` is the truth; `book/` narrates it. Book chapters
reference real declarations (via Verso's `{docstring ...}`), so the prose cannot
drift from the proofs.

## Building and contributing

The build, verification, and chapter-authoring details live in
[`AGENTS.md`](AGENTS.md): the pinned toolchain, `make setup` / `make all` /
`make check`, the verification gates (no-sorry, blueprint decl check, axiom
hygiene, link check), and the Verso authoring conventions. In short, from a
clean checkout: `lake update`, then `make setup`, then `make all`
(`make help` lists every target). The full project constitution is
[`prompt.md`](prompt.md).

## License

Dual-licensed (see `LICENSING.md`): **Apache-2.0** for the Lean code and tooling
(`LICENSE-CODE`), **CC-BY-SA-4.0** for the book prose and ASCII diagrams
(`LICENSE-BOOK`). Home: <https://github.com/badaas/feynman>.

## Scholarship

Never fabricate a citation. Every reference resolves to a verified canonical or
archived URL/DOI/arXiv ID; unverifiable ones are marked `[unverified]`. We cite and
paraphrase, and do not reproduce substantial copyrighted text. See the
route-organized [reading map](references/reading-map.md) (books, papers, courses,
plus a physicist's-track cross-reference) and the
[sources directory](references/sources-directory.md) (journals, preprint servers,
video courses, YouTube channels, blogs, researchers, and community/formalization
resources).
