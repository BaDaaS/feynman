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

## Tier 1 / Part I - in progress

### Concept: the qubit and the Pauli operators - COMPLETE (four layers)

| Layer                | Artifact                                              | Status |
| -------------------- | ----------------------------------------------------- | ------ |
| Formal (Lean)        | `QuantumBook/FiniteDim/Qubit.lean` (12 theorems)       | done (no `sorry`) |
| Book (Verso + ASCII) | `book/Chapters/Ch01_Qubit.lean`                       | done (HTML renders) |
| Video (Manim)        | `media/manim/ch01/qubit.py` + `media/scripts/ch01.md` | done (2 scenes render) |
| Provenance           | `references/sources.md` (Part I section)              | done |
| Blueprint nodes      | `lem:pauli-hermitian/traceless/involution`            | done (checkdecls pass) |

Verified declarations (axioms `[propext, Classical.choice, Quot.sound]`;
`--wfail` clean): `QuantumBook.FiniteDim.{sigmaX,sigmaY,sigmaZ}` and, for each,
`_isHermitian`, `_trace`, `_sq`; plus the three Pauli-algebra relations
`sigma{X,Y,Z}_mul_*`.

### Concept: observables and expectation values - COMPLETE (four layers)

| Layer                | Artifact                                              | Status |
| -------------------- | ----------------------------------------------------- | ------ |
| Formal (Lean)        | `QuantumBook/FiniteDim/Observable.lean`               | done (no `sorry`) |
| Book (Verso + ASCII) | `book/Chapters/Ch02_Observable.lean`                  | done (HTML renders) |
| Video (Manim)        | `media/manim/ch02/observable.py` + `media/scripts/ch02.md` | done (renders) |
| Provenance           | `references/sources.md` (Observables)                 | done |
| Blueprint node       | `thm:expectation-real`                                | done (checkdecls pass) |

Verified: `QuantumBook.FiniteDim.expectation_isReal` (the expectation of a
self-adjoint observable is real), axioms `[propext, Classical.choice, Quot.sound]`.

### Concept: the Born rule - COMPLETE (four layers)

| Layer                | Artifact                                              | Status |
| -------------------- | ----------------------------------------------------- | ------ |
| Formal (Lean)        | `QuantumBook/FiniteDim/Born.lean`                     | done (no `sorry`) |
| Book (Verso + ASCII) | `book/Chapters/Ch03_Born.lean`                        | done (HTML renders) |
| Video (Manim)        | `media/manim/ch03/born.py` + `media/scripts/ch03.md`  | done (renders) |
| Provenance           | `references/sources.md` (Born rule)                   | done |
| Blueprint node       | `thm:born-rule`                                       | done (checkdecls pass) |

Verified: `QuantumBook.FiniteDim.{bornProb, bornProb_nonneg, bornProb_sum,
bornProb_sum_eq_one}` - the Born probabilities are nonnegative and sum to one
(Parseval). Axioms `[propext, Classical.choice, Quot.sound]`.

### Concept: unitary evolution / probability conservation - COMPLETE (four layers)

| Layer                | Artifact                                              | Status |
| -------------------- | ----------------------------------------------------- | ------ |
| Formal (Lean)        | `QuantumBook/FiniteDim/Dynamics.lean`                 | done (no `sorry`) |
| Book (Verso + ASCII) | `book/Chapters/Ch04_Dynamics.lean`                    | done (HTML renders) |
| Video (Manim)        | `media/manim/ch04/dynamics.py` + `media/scripts/ch04.md` | done (renders) |
| Provenance           | `references/sources.md` (Unitary evolution)           | done |
| Blueprint node       | `thm:probability-conservation`                        | done (checkdecls pass) |

Verified: `QuantumBook.FiniteDim.bornProb_sum_unitary` - unitary evolution
preserves the total Born probability. Axioms `[propext, Classical.choice,
Quot.sound]`.

### Concept: composite systems and entanglement - COMPLETE (four layers)

| Layer                | Artifact                                              | Status |
| -------------------- | ----------------------------------------------------- | ------ |
| Formal (Lean)        | `QuantumBook/FiniteDim/Entanglement.lean`             | done (no `sorry`) |
| Book (Verso + ASCII) | `book/Chapters/Ch05_Entanglement.lean`                | done (HTML renders) |
| Video (Manim)        | `media/manim/ch05/entanglement.py` + `media/scripts/ch05.md` | done (renders) |
| Provenance           | `references/sources.md` (Entanglement)                | done |
| Blueprint node       | `thm:bell-entangled`                                  | done (checkdecls pass) |

Verified: `QuantumBook.FiniteDim.{IsProduct, IsEntangled, bellState,
bellState_isEntangled}` - the Bell state is not a product state (a tensor-basis
coefficient argument). Axioms `[propext, Classical.choice, Quot.sound]`.

## Next smallest step

Continue Part I: the **Schmidt decomposition** and the **partial trace / reduced
density operator** (the reduced state of a Bell pair is maximally mixed), then
**no-cloning**. These use the tensor and SVD machinery. Add each concept's four
layers before advancing.
