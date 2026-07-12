/-
Copyright (c) 2026 Quantum Book authors. All rights reserved.
Released under the Apache 2.0 license as described in `LICENSE-CODE`.
SPDX-License-Identifier: Apache-2.0
-/
import Mathlib.LinearAlgebra.TensorProduct.Basis
import Mathlib.Data.Complex.Basic

/-!
# Composite systems and entanglement (Part I)

A system built from two subsystems `A` and `B` has state space the tensor product
`A ⊗ B` (not the Cartesian product). A pure state is a *product state* if it factors
as `a ⊗ b`; otherwise it is *entangled*. Entanglement - "the characteristic trait of
quantum mechanics" (Schrodinger, 1935) - is precisely the failure of a joint state
to be a product of subsystem states.

We define product and entangled states and prove the canonical example: the Bell
state `b₀ ⊗ b₀ + b₁ ⊗ b₁` is entangled. The proof is a coefficient comparison in the
tensor-product basis. Fully verified, no `sorry`.

## Main definitions

* `QuantumBook.FiniteDim.IsProduct` / `IsEntangled`.
* `QuantumBook.FiniteDim.bellState`.

## Main results

* `QuantumBook.FiniteDim.bellState_isEntangled` - the Bell state is entangled.

## Mathlib provenance

* `Basis.tensorProduct`, `Basis.tensorProduct_repr_tmul_apply`
  (`Mathlib/LinearAlgebra/TensorProduct/Basis.lean`); `Basis.repr_self`.
-/

namespace QuantumBook.FiniteDim

open scoped TensorProduct
open Module

variable {V : Type*} [AddCommGroup V] [Module ℂ V]

/-- A pure state of a bipartite system is a *product state* if it factors as a
tensor product `a ⊗ b` of subsystem states. -/
def IsProduct (ψ : V ⊗[ℂ] V) : Prop := ∃ a b : V, ψ = a ⊗ₜ[ℂ] b

/-- A pure state is *entangled* if it is not a product state. -/
def IsEntangled (ψ : V ⊗[ℂ] V) : Prop := ¬ IsProduct ψ

/-- The Bell state `b₀ ⊗ b₀ + b₁ ⊗ b₁` on a two-level subsystem with basis `b`;
the maximally entangled state of two qubits. -/
noncomputable def bellState (b : Basis (Fin 2) ℂ V) : V ⊗[ℂ] V :=
  b 0 ⊗ₜ[ℂ] b 0 + b 1 ⊗ₜ[ℂ] b 1

/-- **The Bell state is entangled.**

`b₀ ⊗ b₀ + b₁ ⊗ b₁` is not a product state. If it were `a ⊗ c`, then comparing
coefficients in the tensor-product basis gives, with `αᵢ = ⟨bᵢ*, a⟩` and
`γⱼ = ⟨bⱼ*, c⟩`: `γ₀α₀ = 1`, `γ₁α₀ = 0`, `γ₁α₁ = 1`. The first forces `α₀ ≠ 0`, so
the second forces `γ₁ = 0`, contradicting the third. -/
theorem bellState_isEntangled (b : Basis (Fin 2) ℂ V) :
    IsEntangled (bellState b) := by
  rintro ⟨a, c, h⟩
  unfold bellState at h
  set B := b.tensorProduct b with hBdef
  -- Read off the coefficients at (0,0), (0,1), (1,1) in the tensor-product basis.
  have h00 := congrArg (fun z => B.repr z (0, 0)) h
  have h01 := congrArg (fun z => B.repr z (0, 1)) h
  have h11 := congrArg (fun z => B.repr z (1, 1)) h
  simp [hBdef, map_add, Finsupp.add_apply,
    Basis.tensorProduct_repr_tmul_apply, Basis.repr_self,
    smul_eq_mul] at h00 h01 h11
  -- h00 : 1 = γ₀ * α₀ ; h01 : 0 = γ₁ * α₀ ; h11 : 1 = γ₁ * α₁ (up to orientation)
  have hα0 : b.repr a 0 ≠ 0 := by
    intro H; rw [H, mul_zero] at h00; exact one_ne_zero h00
  -- simp reduced h01 (`0 = γ₁·α₀`) to the disjunction `γ₁ = 0 ∨ α₀ = 0`.
  have hγ1 : b.repr c 1 = 0 := h01.resolve_right hα0
  rw [hγ1, zero_mul] at h11
  exact one_ne_zero h11

end QuantumBook.FiniteDim
