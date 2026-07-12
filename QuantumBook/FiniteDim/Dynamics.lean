/-
Copyright (c) 2026 Quantum Book authors. All rights reserved.
Released under the Apache 2.0 license as described in `LICENSE-CODE`.
SPDX-License-Identifier: Apache-2.0
-/
import QuantumBook.FiniteDim.Born

/-!
# Unitary evolution and probability conservation (Part I)

A closed quantum system evolves by a *unitary* operator `U`. In finite dimensions a
unitary is exactly a linear isometry equivalence `E ≃ₗᵢ[ℂ] E`: a linear bijection
that preserves the inner product, hence the norm. The physical requirement this
encodes is **conservation of total probability**: if the Born probabilities of a
state sum to one, they still sum to one after the system evolves.

We prove exactly that, on top of the Born rule (`bornProb_sum`): unitary evolution
preserves the sum of the Born probabilities, because it preserves the norm. Fully
verified, no `sorry`.

## Main results

* `QuantumBook.FiniteDim.bornProb_sum_unitary` - unitary evolution conserves the
  total Born probability.

## Mathlib provenance

* `LinearIsometryEquiv` and `LinearIsometryEquiv.norm_map`
  (`Mathlib/Analysis/NormedSpace/LinearIsometry.lean`).
-/

namespace QuantumBook.FiniteDim

variable {ι : Type*} [Fintype ι]
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℂ E]

/-- **Unitary evolution conserves total probability.**

A unitary evolution `U` (a linear isometry equivalence of the state space) preserves
the sum of the Born probabilities of a state: `∑ p_i(U x) = ∑ p_i(x)`. The reason is
that `U` preserves the norm, and the total Born probability equals the squared norm
(Parseval, `bornProb_sum`). In particular a normalized state stays normalized, so
the outcome probabilities continue to sum to one throughout the evolution. -/
theorem bornProb_sum_unitary (b : OrthonormalBasis ι ℂ E) (U : E ≃ₗᵢ[ℂ] E) (x : E) :
    ∑ i, bornProb b (U x) i = ∑ i, bornProb b x i := by
  rw [bornProb_sum, bornProb_sum, U.norm_map]

end QuantumBook.FiniteDim
