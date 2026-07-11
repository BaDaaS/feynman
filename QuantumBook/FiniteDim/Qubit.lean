/-
Copyright (c) 2026 Quantum Book authors. All rights reserved.
Released under the Apache 2.0 license as described in `LICENSE-CODE`.
SPDX-License-Identifier: Apache-2.0
-/
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.LinearAlgebra.Matrix.Hermitian
import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.Data.Complex.Basic
import Mathlib.Analysis.InnerProductSpace.PiL2

/-!
# The qubit and the Pauli operators (Part I)

The qubit is the simplest quantum system: its state space is the two-dimensional
complex inner product space `EuclideanSpace ℂ (Fin 2)`. Its observables are the
self-adjoint operators on `ℂ²`, and the traceless ones are spanned by the three
**Pauli operators** `σ_x, σ_y, σ_z`. Here we define them and prove the three facts
that make them observables and generators of qubit dynamics:

* they are Hermitian (self-adjoint), so by
  `QuantumBook.Foundations.selfAdjoint_eigenvalue_isReal` they have real spectra
  and model observables;
* they are traceless, so they span the `su(2)` directions (the generators of
  `SU(2)` qubit rotations, up to `i`);
* they are involutions (`σ² = I`), so their eigenvalues are `±1` - a qubit
  measurement of a Pauli observable has two outcomes.

Everything here is finite-dimensional and fully verified (no `sorry`).

## Main definitions

* `QuantumBook.FiniteDim.Qubit` - the qubit state space `ℂ²`.
* `QuantumBook.FiniteDim.sigmaX/sigmaY/sigmaZ` - the Pauli matrices.

## Main results

* `pauli*_isHermitian` - each Pauli operator is Hermitian.
* `pauli*_trace` - each Pauli operator is traceless.
* `pauli*_sq` - each Pauli operator squares to the identity.
-/

namespace QuantumBook.FiniteDim

open Matrix
open scoped ComplexConjugate

/-- The qubit state space: two-dimensional complex Euclidean space `ℂ²`. -/
abbrev Qubit : Type := EuclideanSpace ℂ (Fin 2)

/-- The Pauli `X` operator (bit flip), `!![0, 1; 1, 0]`. -/
def sigmaX : Matrix (Fin 2) (Fin 2) ℂ := !![0, 1; 1, 0]

/-- The Pauli `Y` operator, `!![0, -i; i, 0]`. -/
def sigmaY : Matrix (Fin 2) (Fin 2) ℂ := !![0, -Complex.I; Complex.I, 0]

/-- The Pauli `Z` operator (phase flip), `!![1, 0; 0, -1]`. -/
def sigmaZ : Matrix (Fin 2) (Fin 2) ℂ := !![1, 0; 0, -1]

/-- Pauli `X` is Hermitian, hence a qubit observable. -/
theorem sigmaX_isHermitian : sigmaX.IsHermitian := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp [sigmaX, Matrix.conjTranspose_apply]

/-- Pauli `Y` is Hermitian, hence a qubit observable. -/
theorem sigmaY_isHermitian : sigmaY.IsHermitian := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [sigmaY, Matrix.conjTranspose_apply, Complex.conj_I]

/-- Pauli `Z` is Hermitian, hence a qubit observable. -/
theorem sigmaZ_isHermitian : sigmaZ.IsHermitian := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp [sigmaZ, Matrix.conjTranspose_apply]

/-- Pauli `X` is traceless. -/
theorem sigmaX_trace : sigmaX.trace = 0 := by
  simp [Matrix.trace_fin_two, sigmaX]

/-- Pauli `Y` is traceless. -/
theorem sigmaY_trace : sigmaY.trace = 0 := by
  simp [Matrix.trace_fin_two, sigmaY]

/-- Pauli `Z` is traceless: the two eigenvalues `+1` and `-1` cancel. -/
theorem sigmaZ_trace : sigmaZ.trace = 0 := by
  simp [Matrix.trace_fin_two, sigmaZ]

/-- Pauli `X` is an involution, so its eigenvalues are `±1`. -/
theorem sigmaX_sq : sigmaX * sigmaX = 1 := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [sigmaX, Matrix.mul_apply, Fin.sum_univ_two]

/-- Pauli `Y` is an involution, so its eigenvalues are `±1`. -/
theorem sigmaY_sq : sigmaY * sigmaY = 1 := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [sigmaY, Matrix.mul_apply, Fin.sum_univ_two,
      Complex.I_mul_I]

/-- Pauli `Z` is an involution, so its eigenvalues are `±1`. -/
theorem sigmaZ_sq : sigmaZ * sigmaZ = 1 := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [sigmaZ, Matrix.mul_apply, Fin.sum_univ_two]

/-- The Pauli algebra relation `σ_x σ_y = i σ_z`. Together with its cyclic
permutations this is the multiplication table of the Pauli operators; it encodes
the `su(2)` Lie bracket (and the Clifford relation) that generates qubit
rotations. -/
theorem sigmaX_mul_sigmaY : sigmaX * sigmaY = Complex.I • sigmaZ := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [sigmaX, sigmaY, sigmaZ, Matrix.mul_apply, Fin.sum_univ_two]

/-- The Pauli algebra relation `σ_y σ_z = i σ_x` (cyclic). -/
theorem sigmaY_mul_sigmaZ : sigmaY * sigmaZ = Complex.I • sigmaX := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [sigmaX, sigmaY, sigmaZ, Matrix.mul_apply, Fin.sum_univ_two]

/-- The Pauli algebra relation `σ_z σ_x = i σ_y` (cyclic). -/
theorem sigmaZ_mul_sigmaX : sigmaZ * sigmaX = Complex.I • sigmaY := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [sigmaX, sigmaY, sigmaZ, Matrix.mul_apply, Fin.sum_univ_two]

end QuantumBook.FiniteDim
