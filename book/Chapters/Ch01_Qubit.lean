/-
SPDX-License-Identifier: CC-BY-SA-4.0
Book prose for Part I, the qubit. Mathematics in QuantumBook/FiniteDim/Qubit.lean.
-/
import VersoManual
import QuantumBook.FiniteDim.Qubit

open Verso.Genre Manual

#doc (Manual) "The Qubit and the Pauli Operators" =>

%%%
shortTitle := "Qubit"
%%%

The qubit is the hydrogen atom of quantum information: the smallest system with
genuinely quantum behavior, and the one on which every later structure is first
tested. Its state space is the two-dimensional complex inner product space `ℂ²`,
written `QuantumBook.FiniteDim.Qubit`. Its observables are the self-adjoint
operators on `ℂ²`, and the physically interesting ones - the traceless
self-adjoint operators - are spanned by three matrices, the *Pauli operators*.

Everything in this chapter reuses Part 0: an observable is self-adjoint (M0.2),
so by the real-spectrum theorem it has real eigenvalues, and by the spectral
theorem it is diagonalized by an orthonormal eigenbasis. The qubit makes all of
this concrete and fully computable.

# The Pauli operators

There are three, and we define them as explicit two-by-two complex matrices.

{docstring QuantumBook.FiniteDim.sigmaX}

{docstring QuantumBook.FiniteDim.sigmaY}

{docstring QuantumBook.FiniteDim.sigmaZ}

# They are observables: Hermitian with real spectra

Each Pauli operator is Hermitian, so it is a legitimate observable, and its
eigenvalues are real by the Part-0 theorem
`QuantumBook.Foundations.selfAdjoint_eigenvalue_isReal`.

{docstring QuantumBook.FiniteDim.sigmaZ_isHermitian}

The same holds for `X` and `Y` (`sigmaX_isHermitian`, `sigmaY_isHermitian`).

# They are traceless: the su(2) directions

The Pauli operators are traceless. The trace-zero self-adjoint two-by-two matrices
are exactly the (real) span of the three Paulis; multiplied by `i`, they are the
Lie algebra `su(2)` whose exponentials are the `SU(2)` qubit rotations (Part II,
M2.5). Tracelessness is thus the algebraic signature of a *generator of dynamics*
rather than a phase.

{docstring QuantumBook.FiniteDim.sigmaZ_trace}

# They square to the identity: two outcomes

Each Pauli operator is an involution, `σ² = I`. Combined with the spectral theorem,
an involution has eigenvalues that square to one, so they are `+1` and `-1`: a
Pauli measurement has exactly two outcomes. This is the two-level structure that
makes `ℂ²` a *bit*.

{docstring QuantumBook.FiniteDim.sigmaZ_sq}

```
              sigmaZ (an involution:  sigmaZ * sigmaZ = 1)
        C^2  --------------------------------------->  C^2
         |                                              |
      P  |  spectral projections onto the +1, -1        |  eigenvalues in {+1, -1}
         v  eigenspaces (Born rule, Part I)             v
       {+1, -1} ------------------------------------> [0,1]
                         outcome probabilities
   -- depicts: QuantumBook.FiniteDim.sigmaZ_sq
   -- arrows: --> map; the two eigenvalues of an involution are +1 and -1
```

# The Pauli algebra

The three operators are not independent as an algebra: they multiply into each
other. The single relation `σ_x σ_y = i σ_z`, with its cyclic permutations,
is their whole multiplication table. It is the `su(2)` Lie bracket in disguise
(and the Clifford relation of a two-dimensional space), and it is what makes the
exponentials of the Paulis the `SU(2)` rotations of the qubit - the subject of
Part II.

{docstring QuantumBook.FiniteDim.sigmaX_mul_sigmaY}

# Sources & further reading

- M. A. Nielsen and I. L. Chuang, _Quantum Computation and Quantum Information_
  (Cambridge, 2010), [doi:10.1017/CBO9780511976667](https://doi.org/10.1017/CBO9780511976667),
  ch. 1-2. The standard introduction to the qubit, the Pauli operators, and the
  Bloch sphere.
- P. Woit, _Quantum Theory, Groups and Representations_ (Springer, 2017), free at
  [math.columbia.edu/~woit/QM/qmbook.pdf](https://www.math.columbia.edu/~woit/QM/qmbook.pdf),
  ch. 3-4. The `SU(2)` / `su(2)` structure behind the Paulis, from a
  representation-theoretic angle.

See `references/reading-map.md` for the full list and `references/sources.md` for
per-result provenance.
