# PROGRESS - status mirror of the blueprint graph

Human-readable mirror of the blueprint dependency graph (prompt.md §3, §9.5). This
is the depth/frontier ledger: what is proven, what is frontier-flagged, and the
next smallest step. `SCOPE.md` is the breadth ledger; `blueprint/` is the
machine-checked graph.

**Invariant reminder (prompt.md §2)**: every mathematical claim is exactly one of
(a) a fully-proven Lean theorem with no `sorry`; (b) a `sorry` explicitly flagged
as *frontier* (not yet in Mathlib) and tracked as a blueprint node; (c) a clearly
marked informal/physical remark making no formal claim. No fourth category.

---

## Current tier: Tier 0 - vertical slice

Goal (prompt.md §12): one concept end-to-end through all layers, proving the
pipeline works, then stop and report.

### Concept: finite-dimensional spectral theorem (Hermitian operator) - COMPLETE

The Tier-0 vertical slice is complete across all four layers and verified.

| Layer                | Artifact                                              | Status |
| -------------------- | ----------------------------------------------------- | ------ |
| Formal (Lean)        | `QuantumBook/Foundations/Spectral.lean` (3 theorems)  | done (no `sorry`) |
| Book (Verso + ASCII) | `book/Chapters/Ch00_Substrate.lean`                   | done (HTML renders) |
| Video (Manim)        | `media/manim/ch00/spectral.py` + `media/scripts/ch00.md` | done (2 scenes render) |
| Provenance           | `references/sources.md` + `references/bibliography.bib` | done (links verified) |
| Blueprint node       | `blueprint/src/content.tex` (3 proven + 1 frontier)   | done (PDF+web+checkdecls) |

Verified declarations (all axioms `[propext, Classical.choice, Quot.sound]`,
confirmed by `#print axioms`; `lake build --wfail` clean):

- `QuantumBook.Foundations.selfAdjoint_eigenvalue_isReal` (blueprint `thm:selfadjoint-real`)
- `QuantumBook.Foundations.hermitian_spectral_decomposition` (`thm:hermitian-spectral`)
- `QuantumBook.Foundations.selfAdjoint_eigenvector_equation` (`thm:eigenvector-equation`)

### `sorry` ledger (must always be empty of *undocumented* sorries)

_Empty._ No `sorry` in the codebase. Every `sorry` that appears must be a frontier
node listed here with a one-line justification and a blueprint entry.
Finite-dimensional results carry no `sorry` (invariant 2).

| Location | Statement | Why frontier (what Mathlib lacks) | Blueprint node |
| -------- | --------- | --------------------------------- | -------------- |
| (none)   |           |                                   |                |

---

## Frontier line

The verified/frontier boundary (prompt.md §2): everything finite-dimensional is
fully proven; the first legitimate frontier node is already recorded in the
blueprint as `thm:unbounded-spectral` (the unbounded self-adjoint spectral
theorem), carrying no Lean declaration because it is not yet in Mathlib. It sits
one edge past the proven `thm:eigenvector-equation`. Further frontier nodes appear
in Part IV (CCR, Schrödinger dynamics). As Mathlib grows, retire frontier nodes
here (the "re-verification duty", §11).

## Next smallest step

Tier-0 slice done and reported. Next: begin **Tier 1 / Part I** with the smallest
concept - the qubit state space (`ℂ²` / `EuclideanSpace ℂ (Fin 2)`) and an
observable (Pauli operator) as a self-adjoint operator - reusing the Part 0
spectral machinery. Add its four layers before advancing.
