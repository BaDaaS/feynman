/-
SPDX-License-Identifier: CC-BY-SA-4.0
Book prose for Part 0 (Substrate). The mathematics it narrates lives in
`QuantumBook/Foundations/`; this file only explains and points at it.
-/
import VersoManual
import QuantumBook.Foundations.Spectral

open Verso.Genre Manual

#doc (Manual) "The Substrate: Finite-Dimensional Spectral Theory" =>

%%%
shortTitle := "Substrate"
%%%

Quantum mechanics is, at its foundation, linear algebra over the complex numbers
plus a rule that turns operators into probabilities. Part 0 builds the linear
algebra carefully, and fully verified, so that later parts have somewhere solid to
stand. The organizing theorem is the one every physicist meets under the name
"observables are diagonalizable with real eigenvalues" and every mathematician
knows as the *spectral theorem* for self-adjoint operators.

We treat the finite-dimensional case here. It is the honest baby case of the
general theory: the same statement over an infinite-dimensional Hilbert space, for
*unbounded* operators, is a Part IV frontier result that Mathlib does not yet
carry. Keeping that boundary in view is a feature of this book, not an apology for
it. Everything in this chapter is a fully proven Lean theorem with no `sorry`.

# Observables have real spectra

An *observable* is modeled by a self-adjoint (symmetric) operator `T` on a
complex inner product space. The physical content of self-adjointness is that
measured values are real numbers, and that content is already forced by the
definition: every eigenvalue of a symmetric operator is real.

{docstring QuantumBook.Foundations.selfAdjoint_eigenvalue_isReal}

The proof is two steps: Mathlib's `LinearMap.IsSymmetric.conj_eigenvalue_eq_self`
gives that an eigenvalue equals its own complex conjugate, and a complex number
fixed by conjugation has zero imaginary part. Notably, no finiteness is needed for
*this* fact; self-adjointness alone does the work.

# Diagonalization

The structural heart of the theorem is that a Hermitian matrix is *diagonalized* by
a unitary change of basis. Writing `U` for the unitary whose columns are an
orthonormal eigenbasis and `D` for the diagonal matrix of (real) eigenvalues, the
operator factors as `A = U D U*`.

{docstring QuantumBook.Foundations.hermitian_spectral_decomposition}

This is the commuting square an algebraist reads off the theorem: `A` acting on the
space is the same as changing to the eigenbasis (`U*`), scaling each coordinate `i`
by the eigenvalue `λ_i` (`D`), and changing back (`U`).

```
                  A
         H  --------------->  H          -- self-adjoint operator (the observable)
         ^                    ^
      U  |                    | U         -- eigenbasis change (unitary), == means iso
         |                    |
        C^n  ------------->  C^n          -- diagonal: coordinate i scaled by lambda_i
                  D
   -- depicts: QuantumBook.Foundations.hermitian_spectral_decomposition
   -- arrows: --> map, == isomorphism (U is unitary, so U* = U^-1)
```

# States with a definite value

The operator form says the same thing basis-freely: there is an orthonormal basis
of eigenvectors on which the operator acts by scaling. The `i`-th basis vector is a
state in which the observable `T` has the definite value `λ_i` — the eigen-equation
`T eᵢ = λᵢ • eᵢ`.

{docstring QuantumBook.Foundations.selfAdjoint_eigenvector_equation}

These three facts — real spectrum, unitary diagonalization, and an orthonormal
eigenbasis — are exactly the substrate the measurement postulate needs. In Part I
we add the Born rule on top of them; in Part II we replace "Hermitian matrix" with
"self-adjoint element of a C\*-algebra" and recover the same shape through the
continuous functional calculus.

# Sources & further reading

- B. C. Hall, _Quantum Theory for Mathematicians_ (Springer GTM 267, 2013),
  [doi:10.1007/978-1-4614-7116-5](https://doi.org/10.1007/978-1-4614-7116-5). Frames
  the finite-dimensional spectral theorem as the template for the unbounded case,
  exactly as we do; the math-first reader's home text.
- G. Teschl, _Mathematical Methods in Quantum Mechanics_ (AMS GSM 157, 2014),
  free author copy at
  [mat.univie.ac.at/~gerald/ftp/book-schroe](https://www.mat.univie.ac.at/~gerald/ftp/book-schroe/).
  Rigorous, free, and explicit about the finite- to infinite-dimensional passage.
- J. von Neumann, _Mathematical Foundations of Quantum Mechanics_ (1932; Wheeler
  ed. 2018), [doi:10.1515/9781400889921](https://doi.org/10.1515/9781400889921). The
  origin of modeling observables as self-adjoint operators.
- Formalization: A. Dedecker and J. Loreaux, "The continuous functional calculus in
  Lean" ([arXiv:2501.15639](https://arxiv.org/abs/2501.15639)) — the tool Part II
  builds on; the spectral theorem is its finite-dimensional shadow.

The full, route-organized reading map is in `references/reading-map.md`; per-result
provenance is in `references/sources.md`.
