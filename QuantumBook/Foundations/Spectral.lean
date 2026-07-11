/-
Copyright (c) 2026 Quantum Book authors. All rights reserved.
Released under the Apache 2.0 license as described in `LICENSE-CODE`.
SPDX-License-Identifier: Apache-2.0
-/
import Mathlib.Analysis.Matrix.Spectrum
import Mathlib.Analysis.InnerProductSpace.Spectrum

/-!
# The finite-dimensional spectral theorem (Part 0 - Substrate)

The "baby case" of the spectral theorem: a self-adjoint (Hermitian) operator on a
finite-dimensional complex inner product space is diagonalized by an orthonormal
basis of eigenvectors, and its eigenvalues are real. This is the mathematical
substrate of measurement in quantum mechanics: an *observable* is a self-adjoint
operator, its *possible measured values* are the (real) eigenvalues, and the
*eigenvectors* are the states with a definite value.

Everything here is finite-dimensional, hence fully verified against Mathlib with
no `sorry` (prompt.md invariant 2). The infinite-dimensional / unbounded analogue
(the unbounded self-adjoint spectral theorem) is a Part IV frontier node, because
it is not yet in Mathlib.

## Main results

* `QuantumBook.Foundations.selfAdjoint_eigenvalue_isReal` - eigenvalues of a
  symmetric (self-adjoint) operator over `ℂ` are real. *Observables have real
  spectra.*
* `QuantumBook.Foundations.hermitian_spectral_decomposition` - a Hermitian matrix
  `A` factors as `U D U*` with `U` unitary and `D` real-diagonal. *Diagonalization.*
* `QuantumBook.Foundations.selfAdjoint_eigenvector_equation` - the operator acts on
  each basis eigenvector by scaling: `T eᵢ = λᵢ • eᵢ`. *Definite-value states.*

## Mathlib provenance (invariant 6: cite what you use)

* `Matrix.IsHermitian.spectral_theorem`
  (`Mathlib/Analysis/Matrix/Spectrum.lean`)
* `Matrix.IsHermitian.eigenvectorUnitary`, `Matrix.IsHermitian.eigenvalues` (ibid.)
* `LinearMap.IsSymmetric.conj_eigenvalue_eq_self`,
  `LinearMap.IsSymmetric.apply_eigenvectorBasis`,
  `LinearMap.IsSymmetric.eigenvectorBasis`, `LinearMap.IsSymmetric.eigenvalues`
  (`Mathlib/Analysis/InnerProductSpace/Spectrum.lean`)
* `Unitary.conjStarAlgAut_apply` (`Mathlib/Algebra/Star/UnitaryStarAlgAut.lean`)
* `Complex.conj_eq_iff_im` (`Mathlib/Data/Complex/Basic.lean`)
-/

namespace QuantumBook.Foundations

open Matrix
open scoped ComplexConjugate

/-- **Observables have real spectra.**

Every eigenvalue of a symmetric (self-adjoint) operator `T` on a complex inner
product space is real: if `T v = μ • v` for some nonzero `v`, then `μ.im = 0`.

This is the reason a self-adjoint operator is the right formal model of a physical
*observable*: measured values are real numbers, and here they fall out of
self-adjointness alone (no finite-dimensionality needed). The proof is a two-line
consequence of Mathlib's `LinearMap.IsSymmetric.conj_eigenvalue_eq_self` (which
gives `conj μ = μ`) and `Complex.conj_eq_iff_im` (`conj z = z ↔ z.im = 0`). -/
theorem selfAdjoint_eigenvalue_isReal
    {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℂ E]
    {T : E →ₗ[ℂ] E} (hT : T.IsSymmetric) {μ : ℂ}
    (hμ : Module.End.HasEigenvalue T μ) : μ.im = 0 :=
  Complex.conj_eq_iff_im.mp (hT.conj_eigenvalue_eq_self hμ)

/-- **Spectral theorem, matrix form (diagonalization).**

A Hermitian matrix `A` is diagonalized by a unitary change of basis:
`A = U D U*`, where the columns of the unitary `U` (`hA.eigenvectorUnitary`) are an
orthonormal eigenbasis and `D` is the diagonal matrix of the real eigenvalues
`hA.eigenvalues` (embedded into `ℂ` by `RCLike.ofReal`).

This is the computational face of the theorem, and the finite-dimensional shadow of
the continuous functional calculus used in Part II. It restates Mathlib's
`Matrix.IsHermitian.spectral_theorem` (phrased with the star-algebra conjugation
`Unitary.conjStarAlgAut`) in the explicit `U D U*` product form. -/
theorem hermitian_spectral_decomposition
    {n : Type*} [Fintype n] [DecidableEq n] {A : Matrix n n ℂ} (hA : A.IsHermitian) :
    A = (hA.eigenvectorUnitary : Matrix n n ℂ)
          * diagonal (RCLike.ofReal ∘ hA.eigenvalues)
          * (star hA.eigenvectorUnitary : Matrix n n ℂ) := by
  -- Rewrite only the outer `A` (not the `A` hidden inside `hA.eigenvectorUnitary`),
  -- then unfold the conjugation `conjStarAlgAut U D = U * D * (star U)`. The remaining
  -- goal closes definitionally (`↑(star U)` is `star ↑U`).
  conv_lhs => rw [hA.spectral_theorem, Unitary.conjStarAlgAut_apply]

/-- **Spectral theorem, operator form (eigen-equation).**

For a self-adjoint operator `T` on a finite-dimensional complex inner product space
`E` with `Module.finrank ℂ E = n`, Mathlib produces an orthonormal eigenbasis
`hT.eigenvectorBasis hn : OrthonormalBasis (Fin n) ℂ E` with real eigenvalues
`hT.eigenvalues hn : Fin n → ℝ`. On each basis vector the operator acts by scaling:
`T eᵢ = λᵢ • eᵢ`.

Physically, `eᵢ` is a state in which the observable `T` has the definite value `λᵢ`.
This wraps `LinearMap.IsSymmetric.apply_eigenvectorBasis`. -/
theorem selfAdjoint_eigenvector_equation
    {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℂ E] [FiniteDimensional ℂ E]
    {T : E →ₗ[ℂ] E} (hT : T.IsSymmetric) {n : ℕ} (hn : Module.finrank ℂ E = n)
    (i : Fin n) :
    T (hT.eigenvectorBasis hn i) = (hT.eigenvalues hn i : ℂ) • hT.eigenvectorBasis hn i :=
  hT.apply_eigenvectorBasis hn i

end QuantumBook.Foundations
