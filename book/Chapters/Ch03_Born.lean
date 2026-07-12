/-
SPDX-License-Identifier: CC-BY-SA-4.0
Book prose for Part I, the Born rule. Mathematics in QuantumBook/FiniteDim/Born.lean.
-/
import VersoManual
import QuantumBook.FiniteDim.Born

open Verso.Genre Manual

#doc (Manual) "The Born Rule" =>

%%%
shortTitle := "Born rule"
%%%

A measurement returns one eigenvalue, at random. The Born rule says *which* random:
if `b` is an orthonormal eigenbasis of the observable and the system is in state
`x`, then the outcome labeled `i` occurs with probability the squared modulus of
the amplitude, `‖⟪b i, x⟫‖²`. This is the one irreducibly probabilistic postulate
of quantum mechanics, and the bridge from the linear algebra to experiment.

# It is a probability distribution

For the Born rule to deserve the name, the numbers `‖⟪b i, x⟫‖²` must be a genuine
probability distribution: nonnegative, and summing to one on a normalized state.

{docstring QuantumBook.FiniteDim.bornProb}

{docstring QuantumBook.FiniteDim.bornProb_nonneg}

Nonnegativity is immediate - each probability is a squared norm. The content is that
they sum to one, and this is exactly Parseval's identity for an orthonormal basis:
the total squared length of a vector is the sum of the squared lengths of its
components.

{docstring QuantumBook.FiniteDim.bornProb_sum}

{docstring QuantumBook.FiniteDim.bornProb_sum_eq_one}

```
                                  b (orthonormal eigenbasis)
             state x  ---------------------------------------->  amplitudes <b i, x>
                |                                                      |
      Born      |  p i = |<b i, x>|^2                                  | | . |^2
                v                                                      v
          {p i : i}  ------- sum p i = ||x||^2 = 1 -------------->  [0,1] (a distribution)
   -- depicts: QuantumBook.FiniteDim.bornProb_sum_eq_one
   -- the total probability is Parseval's identity; equals 1 on a unit state
```

With expectation values (previous chapter), the mean outcome is the
eigenvalue-weighted average `∑ λ_i p_i`, recovering `⟪x, A x⟫`. The Born rule is
where the deterministic linear structure and the probabilistic predictions meet;
Gleason's theorem (foundations track) shows it is essentially the *only* such rule.

# Sources & further reading

- M. Born, "Zur Quantenmechanik der Stossvorgange," _Zeitschrift fur Physik_ 37
  (1926), [doi:10.1007/BF01397477](https://doi.org/10.1007/BF01397477). The origin
  of the probability interpretation.
- M. A. Nielsen and I. L. Chuang, _Quantum Computation and Quantum Information_
  (Cambridge, 2010),
  [doi:10.1017/CBO9780511976667](https://doi.org/10.1017/CBO9780511976667), ch. 2.
  The measurement postulate and the Born rule in the finite-dimensional setting.
- K. Landsman, _Foundations of Quantum Theory_ (Springer, 2017, open access),
  [doi:10.1007/978-3-319-51777-3](https://doi.org/10.1007/978-3-319-51777-3), on
  Gleason's derivation of the rule.

See `references/reading-map.md` and `references/sources.md`.
