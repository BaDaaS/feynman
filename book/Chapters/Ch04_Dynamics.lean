/-
SPDX-License-Identifier: CC-BY-SA-4.0
Book prose for Part I, unitary evolution. Mathematics in
QuantumBook/FiniteDim/Dynamics.lean.
-/
import VersoManual
import QuantumBook.FiniteDim.Dynamics

open Verso.Genre Manual

#doc (Manual) "Unitary Evolution and Probability Conservation" =>

%%%
shortTitle := "Dynamics"
%%%

A closed system evolves in time by a *unitary* operator. In finite dimensions this
is exactly a linear isometry of the state space onto itself: a linear bijection that
preserves the inner product. The physical demand behind this choice is that
probability be conserved - a state that is normalized now must stay normalized
later, so that the Born probabilities keep summing to one throughout the evolution.

# Unitary evolution conserves total probability

{docstring QuantumBook.FiniteDim.bornProb_sum_unitary}

The proof is one line on top of the Born rule. The total Born probability of a state
is its squared norm (Parseval, previous chapter), and a unitary preserves the norm
by definition; so the total probability is unchanged. Everything that makes
measurement statistics well-defined at one instant continues to hold at every later
instant.

```
                       U  (unitary evolution, a linear isometry)
             state x  ==================================>  U x
                |                                            |
      Born-sum  |  sum p_i = ||x||^2                         |  sum p_i = ||U x||^2
                v                                            v
              ||x||^2  ======= ||U x|| = ||x|| =========>  ||U x||^2   (equal)
   -- depicts: QuantumBook.FiniteDim.bornProb_sum_unitary
   -- ==> isomorphism (U is unitary); total probability is invariant
```

Concretely, `U(t) = e^{-itH}` for a self-adjoint Hamiltonian `H` is the
one-parameter family of these isometries, and the finite-dimensional Schrodinger
equation `i dψ/dt = Hψ` is its generator. The passage to *infinite* dimensions,
where `H` is unbounded and `e^{-itH}` must be built by Stone's theorem, is a Part IV
frontier.

# Sources & further reading

- B. C. Hall, _Quantum Theory for Mathematicians_ (Springer GTM 267, 2013),
  [doi:10.1007/978-1-4614-7116-5](https://doi.org/10.1007/978-1-4614-7116-5),
  ch. 10. Unitary evolution, one-parameter groups, and Stone's theorem.
- L. Takhtajan, _Quantum Mechanics for Mathematicians_ (AMS GSM 95, 2008),
  [bookstore.ams.org/gsm-95](https://bookstore.ams.org/gsm-95). The dynamics as a
  flow, with the classical correspondence.

See `references/reading-map.md` and `references/sources.md`.
