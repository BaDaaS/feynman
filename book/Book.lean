/-
SPDX-License-Identifier: CC-BY-SA-4.0
Root document of the book. Assembles the chapters via `{include}`.
-/
import VersoManual
import Chapters.Voices
import Chapters.Ch00_Substrate
import Chapters.Ch01_Qubit
import Chapters.Ch02_Observable
import Chapters.Ch03_Born
import Chapters.Ch04_Dynamics
import Chapters.Ch05_Entanglement

open Verso.Genre Manual

#doc (Manual) "A Verified, Illustrated Book on Quantum Mechanics" =>

%%%
shortTitle := "Verified QM"
%%%

This book develops quantum mechanics with its mathematics machine-verified in
Lean 4 against Mathlib. Every mathematical claim is one of three things: a fully
proven theorem with no `sorry`; a theorem explicitly flagged as _frontier_ (not yet
available in Mathlib) and tracked in the blueprint; or a clearly marked informal
remark that makes no formal claim. There is no fourth category.

The route through the subject is deliberately operator-algebraic, representation-
theoretic, and geometric, rather than PDE-first: it is written for a reader who
thinks in algebra and geometry and wants proofs, not persuasion. The verified /
frontier line follows the mathematics itself. Finite-dimensional quantum mechanics
(qubits, spin systems, the finite-dimensional spectral theorem, quantum
information) is fully proven. Infinite-dimensional and unbounded results (position
and momentum, the canonical commutation relations, the unbounded spectral theorem,
Schrödinger dynamics) are frontier nodes, because the unbounded self-adjoint
spectral theorem is not yet in Mathlib.

This is the first vertical slice: a single concept — the finite-dimensional
spectral theorem — carried through the formal layer (the Lean library
`QuantumBook`) and this narrated book layer, to prove the whole pipeline works
end to end.

{include 0 Chapters.Voices}

{include 0 Chapters.Ch00_Substrate}

{include 0 Chapters.Ch01_Qubit}

{include 0 Chapters.Ch02_Observable}

{include 0 Chapters.Ch03_Born}

{include 0 Chapters.Ch04_Dynamics}

{include 0 Chapters.Ch05_Entanglement}
