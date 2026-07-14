/-
SPDX-License-Identifier: CC-BY-SA-4.0
Book front matter: a historical introduction tracing quantum mechanics through
its foundational papers and their main ideas, with an explanation for each of
what the idea means. Every paper is cited to a verified source (the same DOIs
tracked in references/reading-map.md and references/bibliography.bib). This file
is prose only; it references no Lean declaration.
-/
import VersoManual

open Verso.Genre Manual

#doc (Manual) "A Short History of Quantum Mechanics" =>

%%%
shortTitle := "History"
%%%

Quantum mechanics is one of the few physical theories whose mathematical
structure was found before it was understood. This introduction traces that
structure through its foundational papers and explains, for each, the main idea
it contributed and what that idea means for a reader who thinks in algebra and
geometry. Every paper is cited to a verified source. A dated arc with module
cross-references is in `course/history.md`; the complete route-organized
bibliography is in `references/reading-map.md`.

# The old quantum theory (1900-1924)

Before there was a theory there were quantization rules imposed by hand on
classical mechanics. Planck (1900) forced the energy of an oscillator to be an
integer multiple of `h f` to fit the blackbody spectrum; Einstein (1905) treated
light itself as quanta of energy `h f` to explain the photoelectric effect; Bohr
(1913) quantized the angular momentum of atomic orbits and recovered the hydrogen
spectrum; and the Bohr-Sommerfeld rule required the action integral of `p dq`
around an orbit to be an integer multiple of `h`. Each rule pinned a discrete
quantity onto an otherwise classical picture, and each was justified only by the
spectra it reproduced.

The rules worked for hydrogen, with its single electron, and failed for helium.
They supplied no equation of motion and no account of *why* action should be
quantized; Bohr's correspondence principle, that quantum results must approach
classical ones for large quantum numbers, was the only bridge back to known
physics. The lesson the founders drew, and the one this book takes, is that a
correct theory would have to come from new mathematics rather than from patched
classical mechanics. Read in hindsight, the correspondence principle is already a
hint that classical mechanics is a limiting case of something noncommutative.

# Matrix mechanics (1925): observables stop commuting

Refusing to speak of unobservable electron orbits, Heisenberg reorganized the
theory around quantities one can actually measure, the amplitudes of transitions
between stationary states, and found that the natural rule for combining them,
summing over intermediate states, does not commute
([Heisenberg 1925](https://doi.org/10.1007/BF01328377)). Born recognized the
doubly-indexed arrays of amplitudes as matrices, and within months Born,
Heisenberg, and Jordan produced the systematic formalism, including the canonical
commutation relation `QP - PQ = i h-bar I`
([Born, Heisenberg, and Jordan 1926](https://doi.org/10.1007/BF01379806)).

What this means is that physical quantities are represented by operators on a
linear space and the order in which they act carries physical content. Position
`Q` and momentum `P` fail to commute by a fixed amount, and that single fact is
the uncertainty principle: there is no basis in which both are diagonal, so no
state has a sharp value of both at once. The relation is also mathematically
decisive, and in a way a mathematician can check immediately. No finite matrices
satisfy it, because the trace of `QP - PQ` is zero while the trace of `i h-bar I`
is `i h-bar` times the dimension, which is nonzero; a theorem of Wielandt and
Wintner extends this to say no bounded operators satisfy it either. The
commutation relation therefore *forces* unbounded self-adjoint operators, which is
why the unbounded spectral theorem sits at the frontier of this book. The
noncommutative algebra of observables is the object the whole subject is built
around, and the operator-algebraic route the book takes starts here.

# Wave mechanics (1926): the same theory, wearing analysis

Following de Broglie's proposal that matter has a wavelength, Schrodinger wrote
quantization as an eigenvalue problem for a differential operator, `H psi = E psi`
with `H = -(h-bar^2 / 2m) Laplacian + V`
([Schrodinger 1926](https://doi.org/10.1002/andp.19263840404)). The allowed
energies are the eigenvalues, that is the spectrum, of `H`; the wavefunctions are
its eigenfunctions; and the discreteness that the old theory imposed by hand now
emerges as the discreteness of a spectrum, the same way the frequencies of a
vibrating string are fixed by boundary conditions.

This looked nothing like matrix mechanics yet predicted the same spectra, and
Schrodinger and later authors showed the two are unitarily equivalent. Matrix
mechanics acts on the sequence space `l^2`, wave mechanics on the function space
`L^2(R^n)`, and those two Hilbert spaces are isomorphic, with the
harmonic-oscillator eigenbasis (the Hermite functions) providing the explicit
isometry between them. What this means is that there is one abstract structure, a
Hilbert space carrying operators, presented in many concrete representations, and
that "the spectrum of a self-adjoint operator" is the mathematically honest
meaning of "the possible measured values." One structure, many representations, is
the theme that organizes the book.

# The probability rule (1926): Born reads the wavefunction

Schrodinger first hoped the wavefunction was a literal physical wave. Studying
collision processes, Born reinterpreted it, and the reinterpretation is the point
where quantum mechanics becomes irreducibly statistical
([Born 1926](https://doi.org/10.1007/BF01397477)). Concretely: a state is a unit
vector `psi` in a Hilbert space `H`, and an observable is a self-adjoint operator
`A`. In finite dimensions `A` has real eigenvalues `a_i` with an orthonormal
eigenbasis `e_i`, and the state expands as `psi = sum_i c_i e_i` where the complex
numbers `c_i = <e_i, psi>` are called amplitudes. The Born rule says a measurement
of `A` returns the eigenvalue `a_i` with probability `|c_i|^2 = |<e_i, psi>|^2`,
and leaves the system in the corresponding eigenstate `e_i`.

Several things about this rule are worth making explicit, because it is the hinge
between the linear structure and experiment. First, the probabilities are
consistent: since `psi` is a unit vector and the `e_i` are orthonormal, Parseval's
identity gives `sum_i |c_i|^2 = 1`, so the outcome probabilities sum to one
automatically. Second, the average reading of the instrument is the expectation
value `<A> = <psi, A psi> = sum_i a_i |c_i|^2`, the eigenvalues weighted by their
Born probabilities; for a statistical mixture described by a density operator
`rho` this becomes `<A> = tr(rho A)`. Third, and most important, the rule takes the
*squared modulus* of an amplitude, not the amplitude itself. Amplitudes are complex
numbers that add before they are squared, so for two indistinguishable paths
`|c_1 + c_2|^2` is generally not `|c_1|^2 + |c_2|^2`: the cross term is
interference, and it is exactly what produces the fringes of the double-slit
experiment and distinguishes quantum probability from the classical kind, where
one would simply add probabilities. The Born rule is thus the least "derived" of
the postulates, grafted by hand onto an otherwise deterministic and unitary
theory, which is precisely why Gleason's later theorem, that it is very nearly
forced by the geometry of subspaces, is so satisfying. In this book the
finite-dimensional Born rule is a fully proven statement: the Born probabilities
are nonnegative, they sum to one, and they are preserved by unitary evolution.

# Transformation theory and the Dirac formalism (1927-1930)

Dirac and Jordan unified the matrix and wave pictures into transformation theory:
a state is an abstract vector, observables are operators, and a representation is a
choice of basis (the position basis, the momentum basis, the energy basis), with a
unitary change of basis carrying one representation to another. Dirac's _The
Principles of Quantum Mechanics_ gave the bra-ket notation, in which a state is a
ket, a linear functional is a bra, their pairing is an inner product, and an
operator can be built from outer products, together with the delta-function
calculus physicists still use
([Dirac 1930, 4th ed. 1958](https://global.oup.com/academic/product/the-principles-of-quantum-mechanics-9780198520115)).

What this means is that the physical content is representation-independent:
Heisenberg's matrices and Schrodinger's functions are the same vector written in
different bases, related by a unitary transformation, exactly as one rotates
coordinates without changing a geometric object. The notation is powerful and
deliberately informal, and part of the mathematician's work is to see where it
quietly steps outside the Hilbert space. The delta-function and the
non-normalizable "eigenstates" of position and momentum are not vectors in `L^2`;
making them rigorous needs the theory of rigged Hilbert spaces (a Gelfand triple),
a topic this book places at its frontier.

# Von Neumann's axiomatization (1932): the theory becomes mathematics

Von Neumann replaced the competing pictures with a single axiomatic framework and
in doing so made quantum mechanics a chapter of functional analysis: the state
space is a separable complex Hilbert space; observables are (possibly unbounded)
self-adjoint operators; the possible values of an observable are the points of its
spectrum; measurement is projection onto an eigenspace; and a statistical mixture
is a density operator, a positive operator of trace one, whose expectation values
are given by a trace
([von Neumann 1932, Princeton ed. 2018](https://doi.org/10.1515/9781400889921)).

The keystone is the spectral theorem, which writes a self-adjoint operator as an
integral over its spectrum against a projection-valued measure. That decomposition
is precisely what turns "the measured value is a point of the spectrum, with
Born-rule probabilities" from a slogan into a theorem: the projection-valued
measure supplies, for each state, the probability distribution over outcomes. What
this means for the present project is that essentially everything the book proves
rests on von Neumann's scaffolding. The finite-dimensional spectral theorem is the
vertical slice already fully verified in Lean; his spectral theorem for *unbounded*
self-adjoint operators is the honest frontier, stated and tracked in the blueprint
because it is not yet in Mathlib. Von Neumann also introduced the trace and density
formalism used throughout quantum information and gave an influential
no-hidden-variables argument that Bell would later criticize as proving less than
it seemed to.

# Symmetry as representation theory (1931)

Wigner brought group theory into quantum mechanics. A physical symmetry, a rotation
or a translation, acts on the Hilbert space of states, and Wigner's theorem says
any such symmetry is realized by a unitary or antiunitary operator, unique up to a
phase, so symmetries act as projective representations of the symmetry group
(Wigner, _Group Theory and Its Application to the Quantum Mechanics of Atomic
Spectra_, 1931; English translation by J. J. Griffin, Academic Press, 1959).

What this means is that classifying particles, spectra, and selection rules becomes
classifying the irreducible representations of the relevant groups. Spin is the
representation theory of `SU(2)` and its two-to-one cover of the rotation group
`SO(3)`, which is why a spin-one-half state must be turned through `720` degrees,
not `360`, to return to itself; relativistic particles are labelled by mass and
spin through the representations of the Poincare group. Continuous symmetries have
generators that are conserved quantities, the quantum counterpart of Noether's
theorem, so angular momentum generates rotations and energy generates time
translation. This representation-theoretic route is one the book takes up in its
algebraic part.

# Entanglement and the completeness debate (1935)

Einstein, Podolsky, and Rosen built a two-particle state whose subsystems are
perfectly correlated and argued as follows: if measuring particle `A` lets you
predict an outcome on particle `B` with certainty and without disturbing `B`, that
outcome is an "element of reality"; since a suitable state lets you do this for
observables that do not commute, quantum mechanics must be an incomplete
description
([Einstein, Podolsky, and Rosen 1935](https://doi.org/10.1103/PhysRev.47.777)).
Schrodinger's reply coined the term entanglement, called it the characteristic
trait of quantum mechanics, and illustrated it with the cat, a microscopic
superposition amplified until it entangles a macroscopic object
([Schrodinger 1935](https://doi.org/10.1007/BF01491891)).

What this means mathematically is clean and decisive. A joint state lives in the
tensor product of the two factor Hilbert spaces, and a generic joint vector is not
a product of a vector from each factor; that non-factorizability is entanglement.
The Schmidt decomposition writes any pure joint state as a short sum of matched
orthonormal pairs and its number of terms, the Schmidt rank, measures exactly how
far the state is from a product, with rank one meaning unentangled. Tracing out one
half of an entangled pure state leaves a genuinely mixed density operator on the
other, so a part of a pure whole is itself uncertain, which has no classical
analogue. The correlations are real and stronger than any local classical model
allows, yet, as the nonlocality results below make precise, they cannot be used to
send a signal. This book proves that the Bell state is entangled.

# Gleason, Bell, and contextuality (1957-1969)

Three theorems sharpen the foundations into mathematics. Gleason showed that any
assignment of probabilities to the closed subspaces (equivalently, the
projections) of a Hilbert space of dimension at least three, additive on
orthogonal families, must have the form `p(P) = tr(rho P)` for some density
operator `rho`; so the Born rule is very nearly forced by the lattice of
projections rather than being an independent postulate, and the only freedom is the
state `rho` itself
([Gleason 1957](https://doi.org/10.1512/iumj.1957.6.56050)). Bell turned the EPR
assumptions of locality and definite pre-existing values into an inequality that
any such hidden-variable theory must obey, and showed quantum predictions violate
it
([Bell 1964](https://doi.org/10.1103/PhysicsPhysiqueFizika.1.195)); Clauser,
Horne, Shimony, and Holt cast the inequality in a form real experiments could test,
which later experiments did, siding with quantum mechanics
([Clauser, Horne, Shimony, and Holt 1969](https://doi.org/10.1103/PhysRevLett.23.880)).
Kochen and Specker exhibited a finite set of projections that cannot be assigned
definite `0/1` values consistently with their algebraic relations, ruling out
non-contextual hidden variables: a value cannot be attached to an observable
independently of which compatible observables are measured with it
([Kochen and Specker 1967](https://doi.org/10.1512/iumj.1968.17.17004)).

What these mean together is that the probabilistic, nonlocal, and contextual
features of the theory are not ignorance waiting to be explained away by hidden
variables; they are forced by the structure of the Hilbert space. Because the
arguments are largely finite-dimensional, they are strong candidates for
formalization, and they connect directly to the no-signaling fact recorded in the
reading map: the entangled correlations are non-signaling, so quantum nonlocality
does not permit faster-than-light communication.

# Geometry enters (1959-1984)

The Aharonov-Bohm effect showed that an electron's phase is shifted by the line
integral of the electromagnetic potential around a region, even where the magnetic
field itself vanishes, so the potential, a connection in geometric language, has
observable consequences and the accumulated phase is a holonomy
([Aharonov and Bohm 1959](https://doi.org/10.1103/PhysRev.115.485)). Berry found
that carrying a system's Hamiltonian slowly around a closed loop in parameter space
returns the state with an extra geometric phase that depends only on the loop, not
on how slowly it was traversed
([Berry 1984](https://doi.org/10.1098/rspa.1984.0023)), and Simon identified that
phase as the holonomy of a natural connection on a line bundle over parameter space
([Simon 1983](https://doi.org/10.1103/PhysRevLett.51.2167)).

What this means is that the right home for quantum states is not the vector space
but the projective space of rays `CP^n`, since multiplying a state by a phase
changes nothing physical. The right tools are then line bundles, connections, and
curvature: a state carried around a loop can come back rotated by a phase that
records the curvature enclosed, exactly as parallel transport on a curved surface
rotates a vector. Phases once dismissed as unphysical turn out to be measurable
holonomies, with the Fubini-Study geometry of projective Hilbert space in the
background. This is the geometric route the book develops in its geometry part.

# Formalization (2020s): the theorem becomes code

The most recent chapter is the one this project belongs to: machine-checking the
mathematics in a proof assistant. Mathlib now carries the finite-dimensional
spectral theorem for Hermitian operators, tensor products, and the continuous
functional calculus
([Dedecker and Loreaux 2025](https://arxiv.org/abs/2501.15639)), which together
make finite-dimensional quantum mechanics fully provable with no gaps. This book is
built on that base: every claim is a proven Lean theorem with no `sorry`, a clearly
flagged frontier `sorry` tracked in the blueprint, or an informal remark that makes
no formal claim, and there is no fourth category.

What this means in practice is that the boundary between "verified" and "frontier"
is drawn by the mathematics itself rather than by taste. What is not yet in Mathlib,
chiefly the spectral theorem for unbounded self-adjoint operators, Stone's theorem
in full, and the essential self-adjointness of Schrodinger operators, is exactly the
frontier the book tracks, each as a stated theorem with no Lean proof yet. Part of
the point of the project is to watch that line recede as the library grows, turning
today's frontier nodes into tomorrow's verified theorems.

# Sources & further reading

Each paper above links to its verified DOI or publisher record. For the fuller
dated narrative with module cross-references, see `course/history.md`; for the
complete route-organized reading list with every identifier, see
`references/reading-map.md` and the per-concept provenance in
`references/sources.md`.
