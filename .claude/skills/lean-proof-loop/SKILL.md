---
name: lean-proof-loop
description: >-
  The tight edit-search-verify loop for writing a Lean 4 declaration in this repo
  against Mathlib v4.31.0: search Mathlib for existing results, verify decl names
  before use, prove or frontier-flag, and gate on no-sorry plus an axiom check.
  Use when adding or fixing any theorem/def in QuantumBook/.
---

# Lean proof loop (QuantumBook, Lean/Mathlib v4.31.0)

## Search Mathlib before writing anything

The pinned Mathlib is unpacked at `.lake/packages/mathlib/Mathlib/`. Module paths
move between versions; verify against THIS checkout, do not trust memory.

- Find a declaration by name/pattern:
  `grep -rnE "theorem <name>|def <name>" .lake/packages/mathlib/Mathlib/`
- Find where a concept lives:
  `find .lake/packages/mathlib/Mathlib -iname "*Spectrum*"` etc.
- Confirm a lemma's exact signature by reading its source lines before using it.
- Naming conventions: `operation_property` (`mul_comm`), `_iff`, `_of_`,
  `Type.operation` (`Matrix.IsHermitian.spectral_theorem`).

Never cite a lemma name from memory. If you cannot find it, it may not exist in
this version; either find the real name or treat the step as frontier.

## Prove, or frontier-flag

- Finite-dimensional / bounded: prove it (no `sorry`). Prefer named Mathlib lemmas
  over opaque automation where it aids the reader (this is a book).
- Genuinely not in Mathlib (unbounded spectral theorem, Stone unbounded, etc.):
  write the statement with a `sorry`, add a one-line comment "frontier: <what
  Mathlib lacks>", and register it as a `\notready` blueprint node and in the
  `PROGRESS.md` sorry ledger. Never leave an undocumented `sorry`.

## Common gotchas seen in this repo

- Dependent rewrite fails ("motive is not type correct") when the term being
  rewritten appears inside a hypothesis-dependent subterm (e.g. `A` inside
  `hA.eigenvectorUnitary`). Fix with `conv_lhs => rw [...]` to target only the
  intended occurrence, or `simp only`.
- Coercions across `star`/units: `↑(star U)` vs `star ↑U` differ syntactically but
  `unitary.coe_star` (a `@[simp, norm_cast]` lemma) bridges them; often the goal
  then closes by `rfl` (so a trailing `rw` may hit "no goals").
- Every file must carry an SPDX header `SPDX-License-Identifier: Apache-2.0` and a
  docstring saying why the declaration is useful (the book renders it).

## Verify (all must pass before "done")

1. `make proofs` (`lake build QuantumBook`) is green.
2. `make verify-no-sorry` (`lake build QuantumBook --wfail`) is green - turns a
   `sorry` warning into a failure.
3. Axiom check: `#print axioms <FullyQualified.Name>` reports ONLY
   `propext, Classical.choice, Quot.sound`. Any `sorryAx` or custom axiom is a red
   flag; `native_decide` is banned (do not use it).
   Run it with:
   `printf 'import QuantumBook\n#print axioms <Name>\n' | lake env lean /dev/stdin`
4. `grep -rn "sorry" QuantumBook/` returns nothing except documented frontier nodes.

## Iterate fast

Build a single module with `lake build QuantumBook.<Module.Path>` rather than the
whole library. Feed each compiler error back into the next edit; do not revert a
whole proof to `sorry` because one step failed.
