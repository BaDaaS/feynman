/-
SPDX-License-Identifier: CC-BY-SA-4.0
Book prose for Part I, composite systems and entanglement. Mathematics in
QuantumBook/FiniteDim/Entanglement.lean.
-/
import VersoManual
import QuantumBook.FiniteDim.Entanglement

open Verso.Genre Manual

#doc (Manual) "Composite Systems and Entanglement" =>

%%%
shortTitle := "Entanglement"
%%%

A system built from two subsystems has state space the *tensor product* of the
two, `A ⊗ B`, not their Cartesian product. This single modeling choice is the
source of the most distinctive quantum phenomenon. A pure joint state that factors
as `a ⊗ b` describes two independent subsystems; a state that does not so factor is
*entangled*. Schrodinger, who named it in 1935, called entanglement "the
characteristic trait of quantum mechanics."

# Product and entangled states

{docstring QuantumBook.FiniteDim.IsProduct}

{docstring QuantumBook.FiniteDim.IsEntangled}

# The Bell state is entangled

The canonical example is the Bell state, the maximally entangled state of two
qubits.

{docstring QuantumBook.FiniteDim.bellState}

{docstring QuantumBook.FiniteDim.bellState_isEntangled}

The proof is a clean coefficient argument. Expand a hypothetical factorization
`a ⊗ c` in the tensor-product basis `b_i ⊗ b_j`; its coefficient at `(i, j)` is the
product `α_i γ_j` of the subsystem coefficients. Matching against the Bell state's
coefficients (`1` on the diagonal, `0` off it) forces `α_0 γ_0 = 1`, `α_0 γ_1 = 0`,
and `α_1 γ_1 = 1`. The first says `α_0 ≠ 0`, so the second forces `γ_1 = 0`, which
the third forbids. No factorization exists.

```
       Bell = b0(x)b0 + b1(x)b1        assume = a (x) c
         |                                |
         |  coefficients in basis bi(x)bj |  coeff at (i,j) = alpha_i * gamma_j
         v                                v
       [1 0 / 0 1]  =/=  [ai*cj]   (a rank-2 matrix is not a single outer product)
   -- depicts: QuantumBook.FiniteDim.bellState_isEntangled
   -- (x) is the tensor product; a product state has a rank-1 coefficient matrix
```

Geometrically, the coefficient matrix of a product state is a single outer product
`α γ^T`, hence rank one; the Bell state's coefficient matrix is the identity, rank
two. Entanglement is exactly this excess rank - the Schmidt rank - and it is the
resource behind Bell-inequality violation (foundations track) and quantum
computation.

# Sources & further reading

- E. Schrodinger, "Die gegenwartige Situation in der Quantenmechanik," _Die
  Naturwissenschaften_ 23 (1935),
  [doi:10.1007/BF01491891](https://doi.org/10.1007/BF01491891). Coins
  "entanglement" and identifies it as the characteristic trait.
- M. A. Nielsen and I. L. Chuang, _Quantum Computation and Quantum Information_
  (Cambridge, 2010),
  [doi:10.1017/CBO9780511976667](https://doi.org/10.1017/CBO9780511976667), ch. 2.
  Tensor products, the Bell states, and the Schmidt decomposition.

See `references/reading-map.md` and `references/sources.md`.
