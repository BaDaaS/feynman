<!-- SPDX-License-Identifier: CC-BY-SA-4.0 -->

# sources.md - per-concept provenance map

Maps each formal concept (a named Lean declaration in `QuantumBook/`) to its
sources: the historical origin where relevant, plus at least one rigorous modern
treatment we follow. This is the lightweight per-concept record (prompt.md §5.4)
that compounds into the scholarship layer (§10). Citation keys refer to
`bibliography.bib`. Links are verified per invariant 7; unconfirmed links are
marked `[unverified]`.

Format per entry: **Lean decl** -> origin / historical note -> modern treatment(s)
we follow -> one-line "why this source".

---

## Part 0 - Substrate

### Finite-dimensional spectral theorem (Hermitian operator)

- **Lean declarations**:
  - `QuantumBook.Foundations.hermitian_spectral_decomposition`
    (matrix form; wraps Mathlib `Matrix.IsHermitian.spectral_theorem`)
  - `QuantumBook.Foundations.selfAdjoint_eigenvalue_real`
    (observables have real spectrum; wraps
    `LinearMap.IsSymmetric.conj_eigenvalue_eq_self`)
  - `QuantumBook.Foundations.hermitian_eigenvector_orthonormal`
    (the eigenvector matrix is unitary; orthonormal eigenbasis)
- **Historical origin**: the finite-dimensional (matrix) spectral theorem for
  Hermitian/symmetric matrices is classical 19th-century linear algebra
  (Cauchy 1829 for real symmetric matrices; the Hermitian case follows). In the
  quantum context, the identification of observables with self-adjoint operators
  and real eigenvalues with measured values is due to the founders: Heisenberg,
  Born & Jordan (matrix mechanics, 1925-26) and, in rigorous operator form,
  von Neumann (*Mathematical Foundations of Quantum Mechanics*, 1932). See the
  historical route in `reading-map.md`.
- **Modern treatments we follow**:
  - Hall, *Quantum Theory for Mathematicians* (GTM 267) - the finite-dim spectral
    theorem and its role as the template for the unbounded case; the math-first
    reader's home text. `[Hall2013QTM]`
  - Teschl, *Mathematical Methods in Quantum Mechanics* (AMS GSM 157),
    open-access - careful, free, and explicit about the finite-dim ⇒
    infinite-dim progression. `[Teschl2014]` `[free]`
  - Mathlib source: `Mathlib/Analysis/Matrix/Spectrum.lean` and
    `Mathlib/Analysis/InnerProductSpace/Spectrum.lean` - the exact declarations we
    build on (prompt.md invariant 6: cite what you use).
- **Why these**: Hall frames the theorem exactly the way this book does (the
  baby case that anticipates the unbounded spectral theorem, our Part IV
  frontier); Teschl is free and rigorous; the Mathlib files are the machine-checked
  substrate our theorem re-exports.
- **Formalization prior art**: Dedecker & Loreaux, "The continuous functional
  calculus in Lean" (arXiv:2501.15639) - the CFC that Part II will lean on; cited
  here because the spectral theorem is the finite-dim shadow of the functional
  calculus. `[DedeckerLoreaux2025]` `[free]`

---

## Part I - Finite-dimensional QM

### The qubit and the Pauli operators

- **Lean declarations**: `QuantumBook.FiniteDim.sigmaX/sigmaY/sigmaZ`;
  `sigmaX/Y/Z_isHermitian`; `sigmaX/Y/Z_trace`; `sigmaX/Y/Z_sq`.
- **Historical origin**: the Pauli matrices are due to Wolfgang Pauli (1927), in
  his treatment of electron spin; the identification of a two-level system as the
  fundamental unit of quantum information is later (Schumacher's "qubit", 1995).
  The `su(2)` structure is the Lie theory of Cartan/Weyl.
- **Modern treatments we follow**:
  - Nielsen & Chuang, _Quantum Computation and Quantum Information_, ch. 1-2 - the
    canonical qubit/Pauli/Bloch presentation. `[NielsenChuang2010]`
  - Woit, _Quantum Theory, Groups and Representations_, ch. 3-4 (free) - the
    `SU(2)`/`su(2)` representation-theoretic view of the Paulis. `[Woit2017]` `[free]`
- **Why these**: Nielsen-Chuang is the shared vocabulary; Woit supplies the
  representation-theoretic reading that Part II (M2.5, spin) develops.
- **Mathlib provenance**: `Matrix.IsHermitian`, `Matrix.trace`,
  `Matrix.trace_fin_two`, `Matrix.mul_fin_two`, `Complex.conj_I`
  (`Mathlib/LinearAlgebra/Matrix/*`, `Mathlib/Data/Complex/Basic.lean`).

---

_Further concepts append below as they are formalized. Keep this file in lockstep
with `PROGRESS.md` and the blueprint graph._
