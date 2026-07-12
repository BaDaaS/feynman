/-
SPDX-License-Identifier: CC-BY-SA-4.0
Book prose for Part I, observables and expectation values. Mathematics in
QuantumBook/FiniteDim/Observable.lean.
-/
import VersoManual
import QuantumBook.FiniteDim.Observable

open Verso.Genre Manual

#doc (Manual) "Observables and Expectation Values" =>

%%%
shortTitle := "Observables"
%%%

An observable is a self-adjoint operator; a measurement of it yields one of its
(real) eigenvalues (Part 0). But a single measurement is random. What the theory
predicts deterministically is the *average* over many measurements: the
**expectation value**. For a system in the (unit) state `x`, the expectation of the
observable `A` is the inner product `⟨A⟩_x = ⟪x, A x⟫`.

# The expectation is a real number

For this to be a physical prediction it must be real, and it is - exactly because
`A` is self-adjoint.

{docstring QuantumBook.FiniteDim.expectation}

{docstring QuantumBook.FiniteDim.expectation_isReal}

The proof is the cleanest possible illustration of why self-adjointness is the
right hypothesis. Conjugating an inner product swaps its two arguments; being
self-adjoint means `A` can be moved from one argument to the other without cost.
Do both and you return to where you started: the expectation equals its own complex
conjugate, so its imaginary part vanishes.

```
                         A
             state x  ------->  A x
                |                |
      <x, - >   |                | <x, - >     -- pair against x on both sides
                v                v
              [expectation]  =  <x, A x>  in  R   -- real, because A is self-adjoint
   -- depicts: QuantumBook.FiniteDim.expectation_isReal
   -- arrows: --> operator action; the bracket <x,-> is a linear functional
```

Together with the spectral theorem, the expectation value in an eigenstate is
exactly the corresponding eigenvalue, and in a general state it is the
eigenvalue-weighted average given by the Born rule - the next concept.

# Sources & further reading

- B. C. Hall, _Quantum Theory for Mathematicians_ (Springer GTM 267, 2013),
  [doi:10.1007/978-1-4614-7116-5](https://doi.org/10.1007/978-1-4614-7116-5),
  ch. 3. Observables, expectation values, and the connection to the spectral
  theorem, for a mathematician.
- F. Strocchi, _An Introduction to the Mathematical Structure of Quantum
  Mechanics_ (World Scientific, 2008),
  [doi:10.1142/7038](https://doi.org/10.1142/7038). The axiomatic role of
  expectation values as states (positive normalized functionals), previewing the
  operator-algebraic view of Part II.

See `references/reading-map.md` and `references/sources.md`.
