---
name: add-concept
description: >-
  Drive one new quantum-mechanics concept through all four layers of this repo
  (Lean proof, Verso book chapter, Manim scene, provenance) while preserving the
  hard invariants. Use whenever adding a new definition or theorem to the book:
  a qubit, the Born rule, entanglement, a C*-algebra fact, a frontier node, etc.
---

# Add one concept, end to end

This repo builds a verified QM book in four coupled layers. A concept is not
"done" until all four exist and agree (or it is explicitly logged as book-only /
frontier). Follow the loop from `prompt.md` §9 and keep it tight. Read
`PROGRESS.md` and `SCOPE.md` first to pick the smallest next concept.

## The invariants (never violate)

- Every mathematical claim is exactly one of: (a) a proven Lean theorem with no
  `sorry`; (b) a `sorry` explicitly flagged as *frontier* (not yet in Mathlib) and
  tracked as a blueprint node; (c) a clearly-marked informal remark with no formal
  claim. No fourth category. Never hide a `sorry`.
- Finite-dimensional results MUST be fully proven. Only unbounded/infinite-dim
  results may be frontier.
- `QuantumBook/` is the single source of truth; `book/` narrates it; `media/`
  animates it. The book references real Lean declarations by name via
  `{docstring ...}`, so prose cannot drift from proofs.
- Prefer Mathlib; cite the exact declaration you use in a comment. Never fabricate
  a lemma name (verify with `lake env lean`/grep before using it).

## The loop

1. **Orient.** Read `PROGRESS.md` (frontier), `SCOPE.md` (breadth),
   `course/syllabus.md` (the planned Lean anchor name for this concept). Pick the
   smallest next unit.
2. **Formalize** (use the `lean-proof-loop` skill). Add the Lean decl under the
   right `QuantumBook/<Part>/` file. Search Mathlib first. Prove it, or
   frontier-flag it with a documented `sorry`. `make proofs` and
   `make verify-no-sorry` must pass; check `#print axioms` shows only
   `propext, Classical.choice, Quot.sound`.
3. **Narrate + diagram** (use the `verso-chapter` skill). Add/extend the Verso
   chapter in `book/Chapters/`, referencing the decl via `{docstring Name}`, plus
   a portable-ASCII abstraction diagram with a `-- depicts: <Name>` tag and a
   Sources block. `make book-html` must render.
4. **Animate** (use the `manim-scene` skill). Add a ManimCE scene in
   `media/manim/chNN/` faithful to the formal object, and a narration entry in
   `media/scripts/`. `make videos` must render it.
5. **Blueprint + provenance** (use the `blueprint-node` skill). Add a node in
   `blueprint/src/content.tex` with `\lean{Name}\leanok` (or `\notready` for
   frontier) and `\uses{...}`. Run `make check-blueprint`. Add the source(s) to
   `references/sources.md` and any new work to `references/bibliography.bib`
   (verify every link; mark unverifiable ones `[unverified]`).
6. **Record.** Update `PROGRESS.md` (status table + sorry ledger), tick `SCOPE.md`,
   and append an ADR to `DECISIONS.md` if a design choice was made.
7. **Verify the whole thing.** `make check` green. Then summarize what changed and
   the next smallest step.

## Where things go

- Lean: `QuantumBook/Foundations|FiniteDim|Algebraic|Geometry|Frontier|Categorical/`
- Book: `book/Chapters/ChNN_*.lean` + include it from `book/Book.lean` and add the
  module to the `Book` lib `globs` in `lakefile.toml`.
- Video: `media/manim/chNN/*.py` + `media/scripts/chNN.md`.
- Blueprint: `blueprint/src/content.tex`.
- Provenance: `references/sources.md`, `references/bibliography.bib`.

## Stop cleanly

Never end with a broken build or an undocumented `sorry`. `make check` is the gate.
