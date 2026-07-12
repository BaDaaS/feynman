/-
Copyright (c) 2026 Quantum Book authors. All rights reserved.
Released under the Apache 2.0 license as described in `LICENSE-CODE`.
SPDX-License-Identifier: Apache-2.0
-/
import Mathlib.Analysis.InnerProductSpace.Symmetric
import Mathlib.Data.Complex.Basic

/-!
# Observables and expectation values (Part I)

An *observable* is a self-adjoint (symmetric) operator `A` on the state space, and
its *expectation value* in a (unit) state `x` is `⟨A⟩_x = ⟪x, A x⟫`. The one fact
that makes this a physical prediction is that the expectation of an observable is a
*real* number, whatever the state. We prove exactly that.

This is the finite-dimensional (and, in fact, general inner-product-space) content
of "a measurement yields a real number on average," and it sits directly on the
Part 0 notion of self-adjointness. Fully verified, no `sorry`.

## Main definitions

* `QuantumBook.FiniteDim.expectation` - the expectation value `⟪x, A x⟫`.

## Main results

* `QuantumBook.FiniteDim.expectation_isReal` - the expectation of a self-adjoint
  observable is real.

## Mathlib provenance

* `LinearMap.IsSymmetric` and `inner_conj_symm`
  (`Mathlib/Analysis/InnerProductSpace/Symmetric.lean`, `.../Basic.lean`)
* `Complex.conj_eq_iff_im` (`Mathlib/Data/Complex/Basic.lean`)
-/

namespace QuantumBook.FiniteDim

open scoped ComplexConjugate

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℂ E]

/-- The expectation value `⟨A⟩_x = ⟪x, A x⟫` of an observable `A` (a self-adjoint
operator) in the state `x`. For a unit vector `x` this is the mean measured value
of `A`. -/
noncomputable def expectation (A : E →ₗ[ℂ] E) (x : E) : ℂ := inner ℂ x (A x)

/-- **Observables have real expectation values.**

If `A` is self-adjoint (symmetric), then its expectation value in any state `x` is
real: `(⟪x, A x⟫).im = 0`. This is why a self-adjoint operator is the right model of
a measurable quantity - its predicted averages are real numbers, in every state.

The proof: conjugating the inner product swaps its arguments
(`inner_conj_symm`), and self-adjointness (`LinearMap.IsSymmetric`) swaps them
back, so the expectation equals its own conjugate and hence has zero imaginary
part (`Complex.conj_eq_iff_im`). -/
theorem expectation_isReal {A : E →ₗ[ℂ] E} (hA : A.IsSymmetric) (x : E) :
    (expectation A x).im = 0 := by
  apply Complex.conj_eq_iff_im.mp
  unfold expectation
  rw [inner_conj_symm]
  exact hA x x

end QuantumBook.FiniteDim
