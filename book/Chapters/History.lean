/-
SPDX-License-Identifier: CC-BY-SA-4.0
Book front matter: a short historical introduction tracing quantum mechanics
through its foundational papers and their main ideas. Every paper is cited to a
verified source (the same DOIs tracked in references/reading-map.md and
references/bibliography.bib). This file is prose only; it references no Lean
declaration.
-/
import VersoManual

open Verso.Genre Manual

#doc (Manual) "A Short History of Quantum Mechanics" =>

%%%
shortTitle := "History"
%%%

Quantum mechanics is one of the few physical theories whose mathematical
structure was found before it was understood. This introduction traces that
structure through its foundational papers and the main idea each one contributed,
with every paper cited to a verified source. A fuller, dated arc with
module cross-references is in `course/history.md`; the complete route-organized
bibliography is in `references/reading-map.md`.

# The old quantum theory (1900-1924)

Before there was a theory there were quantization rules imposed by hand on
classical mechanics: Planck's quantized oscillator energy (1900), Einstein's
light quanta (1905), and Bohr's quantized atomic orbits (1913). They fit the
hydrogen spectrum and failed for helium, and they had no equation of motion. The
lesson the founders drew, and the one this book takes, is that a correct theory
would need new mathematics rather than patched classical mechanics.

# Matrix mechanics (1925): observables stop commuting

The decisive break is Heisenberg's 1925 paper, which reorganized the theory
around observable transition amplitudes and found that their natural
multiplication does not commute
([Heisenberg 1925](https://doi.org/10.1007/BF01328377)). Born recognized the
arrays as matrices, and within months Born, Heisenberg, and Jordan produced the
systematic formalism, including the canonical commutation relation
QP - PQ = i h-bar I
([Born, Heisenberg, and Jordan 1926](https://doi.org/10.1007/BF01379806)). That
single relation is the seed of the whole mathematical theory: the algebra of
observables is noncommutative.

# Wave mechanics (1926): the same theory, wearing analysis

Independently, Schrodinger wrote quantization as an eigenvalue problem for a
differential operator, H psi = E psi
([Schrodinger 1926](https://doi.org/10.1002/andp.19263840404)). It looked
entirely different from matrix mechanics and reproduced the same spectra; the two
pictures turn out to be unitarily equivalent. This is the first appearance of the
theme that organizes the book: one structure, many representations.

# The probability rule (1926): Born reads the wavefunction

Born's short paper on collision processes supplied the missing interpretive rule:
the squared modulus of an amplitude is a probability
([Born 1926](https://doi.org/10.1007/BF01397477)). This is the Born rule, the
bridge from the linear-algebraic structure to experiment, and the least "derived"
of the postulates.

# Transformation theory and the Dirac formalism (1927-1930)

Dirac and Jordan unified the matrix and wave pictures into transformation theory:
states are vectors, observables are operators, and different representations are
different bases. Dirac's _The Principles of Quantum Mechanics_ gave the bra-ket
notation and the delta-function calculus physicists still use
([Dirac 1930, 4th ed. 1958](https://global.oup.com/academic/product/the-principles-of-quantum-mechanics-9780198520115)).

# Von Neumann's axiomatization (1932): the theory becomes mathematics

The turning point for a mathematician is von Neumann's _Mathematical Foundations
of Quantum Mechanics_, which replaced the competing pictures with one framework:
the state space is a separable complex Hilbert space, observables are self-adjoint
operators, the spectral theorem gives their possible values, measurement is
projection, and mixed states are density operators with a trace
([von Neumann 1932, Princeton ed. 2018](https://doi.org/10.1515/9781400889921)).
His spectral theorem for unbounded self-adjoint operators is still the frontier of
this book's formalization, because it is not yet in Mathlib.

# Symmetry as representation theory (1931)

Wigner brought group representation theory into quantum mechanics, including the
symmetry theorem that now bears his name (Wigner, _Group Theory and Its
Application to the Quantum Mechanics of Atomic Spectra_, 1931; English translation
by J. J. Griffin, Academic Press, 1959). Symmetry becomes the study of unitary
(and antiunitary) representations of the relevant groups.

# Entanglement and the completeness debate (1935)

Einstein, Podolsky, and Rosen argued that quantum mechanics is incomplete, using a
two-particle state with correlated measurements
([Einstein, Podolsky, and Rosen 1935](https://doi.org/10.1103/PhysRev.47.777)).
Schrodinger's reply coined the term entanglement and introduced the cat
([Schrodinger 1935](https://doi.org/10.1007/BF01491891)). Mathematically,
entanglement is the decisive fact that a vector in a tensor product need not be a
product of vectors from the factors.

# Gleason, Bell, and contextuality (1957-1969)

Three results sharpen the foundations into theorems. Gleason showed that any
assignment of probabilities to the projections of a Hilbert space of dimension at
least three, additive on orthogonal families, must come from a density operator,
so the Born rule is nearly forced
([Gleason 1957](https://doi.org/10.1512/iumj.1957.6.56050)). Bell turned EPR into
an inequality that experiment could violate
([Bell 1964](https://doi.org/10.1103/PhysicsPhysiqueFizika.1.195)); Clauser,
Horne, Shimony, and Holt gave its experimentally usable form
([Clauser, Horne, Shimony, and Holt 1969](https://doi.org/10.1103/PhysRevLett.23.880)).
Kochen and Specker ruled out non-contextual hidden variables with a finite
combinatorial obstruction
([Kochen and Specker 1967](https://doi.org/10.1512/iumj.1968.17.17004)).

# Geometry enters (1959-1984)

The Aharonov-Bohm effect showed that the electromagnetic potential, a connection
in geometric language, has physical consequences even where the field vanishes,
making the quantum phase a holonomy
([Aharonov and Bohm 1959](https://doi.org/10.1103/PhysRev.115.485)). Berry found
that adiabatic transport around a loop in parameter space leaves a geometric phase
([Berry 1984](https://doi.org/10.1098/rspa.1984.0023)), and Simon identified it as
the holonomy of a natural line bundle over the parameter space
([Simon 1983](https://doi.org/10.1103/PhysRevLett.51.2167)). This is where the
geometry of quantum theory becomes physically visible.

# Formalization (2020s): the theorem becomes code

The most recent chapter is the one this project belongs to. Mathlib now carries
the finite-dimensional spectral theorem, tensor products, and the continuous
functional calculus
([Dedecker and Loreaux 2025](https://arxiv.org/abs/2501.15639)), enough of the
analysis that finite-dimensional quantum mechanics is fully provable. What is not
yet there, chiefly the unbounded self-adjoint spectral theorem, is exactly this
book's frontier, and part of the point is to watch that line recede as Mathlib
grows.

# Sources & further reading

Each paper above links to its verified DOI or publisher record. For the fuller
dated narrative with module cross-references, see `course/history.md`; for the
complete route-organized reading list with every identifier, see
`references/reading-map.md` and the per-concept provenance in
`references/sources.md`.
