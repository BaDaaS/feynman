/-
Copyright (c) 2026 Quantum Book authors. All rights reserved.
Released under the Apache 2.0 license as described in `LICENSE-CODE`.
SPDX-License-Identifier: Apache-2.0
-/
import Mathlib.Analysis.InnerProductSpace.PiL2

/-!
# The Born rule (Part I)

Measuring an observable in a state `x` yields one of its eigenvalues at random. If
`b` is an orthonormal eigenbasis (from the spectral theorem, Part 0), the
probability of the outcome labeled `i` is the squared modulus of the amplitude
`⟪b i, x⟫`. This is the **Born rule**.

For it to be a probability rule at all, the numbers `‖⟪b i, x⟫‖²` must be
nonnegative and must sum to one on a normalized state. Both hold, and the second is
exactly Parseval's identity for an orthonormal basis. We prove them here; this is
the well-formedness of the Born rule, fully verified.

## Main definitions

* `QuantumBook.FiniteDim.bornProb` - the Born probability of an outcome.

## Main results

* `QuantumBook.FiniteDim.bornProb_nonneg` - Born probabilities are nonnegative.
* `QuantumBook.FiniteDim.bornProb_sum` - they sum to `‖x‖²`.
* `QuantumBook.FiniteDim.bornProb_sum_eq_one` - hence to one on a unit state.

## Mathlib provenance

* `OrthonormalBasis.sum_sq_norm_inner_right` (Parseval),
  `Mathlib/Analysis/InnerProductSpace/PiL2.lean`.
-/

namespace QuantumBook.FiniteDim

open scoped ComplexConjugate

variable {ι : Type*} [Fintype ι]
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℂ E]

/-- The **Born probability** of the outcome labeled `i` when the state `x` is
measured in the orthonormal eigenbasis `b`: the squared modulus of the amplitude
`⟪b i, x⟫`. -/
noncomputable def bornProb (b : OrthonormalBasis ι ℂ E) (x : E) (i : ι) : ℝ :=
  ‖inner ℂ (b i) x‖ ^ 2

/-- Born probabilities are nonnegative. -/
theorem bornProb_nonneg (b : OrthonormalBasis ι ℂ E) (x : E) (i : ι) :
    0 ≤ bornProb b x i := by
  unfold bornProb; positivity

/-- **The Born probabilities sum to `‖x‖²`** (Parseval's identity). -/
theorem bornProb_sum (b : OrthonormalBasis ι ℂ E) (x : E) :
    ∑ i, bornProb b x i = ‖x‖ ^ 2 := by
  unfold bornProb
  exact b.sum_sq_norm_inner_right x

/-- **The Born rule is a probability distribution:** on a normalized state, the
outcome probabilities sum to one. -/
theorem bornProb_sum_eq_one (b : OrthonormalBasis ι ℂ E) {x : E} (hx : ‖x‖ = 1) :
    ∑ i, bornProb b x i = 1 := by
  rw [bornProb_sum, hx]; norm_num

end QuantumBook.FiniteDim
