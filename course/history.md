<!-- SPDX-License-Identifier: CC-BY-SA-4.0 -->

# The historical arc

Quantum mechanics is one of the few physical theories whose mathematical
structure was discovered before it was understood. This chapter tells the story
as a mathematician reads it: not a chronicle of experiments, but the emergence of
a structure - a noncommutative algebra of observables acting on a Hilbert space,
with a probability rule - and the slow clarification of what that structure means.

Each milestone links to its primary source in
[`../references/bibliography.bib`](../references/bibliography.bib) (verified DOIs)
and to the course module where the mathematics is developed. Citations name the
bibtex key; identifiers are in the reading map.

## 1. The old quantum theory (1900-1924): quantization without a theory

The prehistory is a sequence of quantization rules imposed by hand on classical
mechanics: Planck's quantized oscillator energy (1900), Einstein's light quanta
(1905), Bohr's quantized atomic orbits (1913), and the Bohr-Sommerfeld action
quantization $\oint p\,dq = n h$. These rules worked for the hydrogen spectrum and
failed for helium. They had no underlying theory - no equation of motion, no
account of *why* the action was quantized. The lesson the founders drew, and the
one this course takes seriously, is that a correct theory would have to come from
new mathematics, not from patched classical mechanics.

This period is background; the course begins where the mathematics does. It is
worth reading Bohr's correspondence principle as the first hint that classical
mechanics is a limit of something noncommutative.

## 2. Matrix mechanics (1925): observables stop commuting

The decisive break is Heisenberg's 1925 paper [`Heisenberg1925`]. Refusing to
speak of unobservable orbits, he reorganized the theory around observable
transition amplitudes, arranged in arrays, and found that the natural
multiplication of these arrays did not commute. Born recognized the arrays as
matrices, and within months Born, Heisenberg, and Jordan produced the systematic
formalism [`BornHeisenbergJordan1926`] - the "three-man paper" - including the
canonical commutation relation

$$ [Q, P] = QP - PQ = i\hbar\, I. $$

This single equation is the seed of the entire mathematical theory. It says the
algebra of observables is *noncommutative*, and (as we will see in Part IV) it
cannot be realized by bounded operators on a Hilbert space, which forces the whole
apparatus of unbounded self-adjoint operators.

- Develops into: the noncommutative algebra of observables (Part II, M2.1); the
  CCR and its unbounded realization (Part IV, M4.4).
- Mathematician's reading: the CCR is a Lie-algebra relation; the Heisenberg
  group and its representations (Stone-von Neumann) are the clean statement.

## 3. Wave mechanics (1926): the same theory, wearing analysis

Independently, Schrodinger [`Schrodinger1926`] wrote quantization as an eigenvalue
problem for a differential operator - the wave equation

$$ H\psi = E\psi, \qquad H = -\tfrac{\hbar^2}{2m}\Delta + V. $$

This looked utterly different from matrix mechanics and reproduced the same
spectra. Schrodinger and, more sharply, later authors showed the two pictures are
unitarily equivalent: matrix mechanics acts on $\ell^2$, wave mechanics on
$L^2(\mathbb{R}^n)$, and the eigenbasis of the harmonic oscillator is the
isometry between them. The reconciliation is the first appearance of the theme
that organizes this course: *one structure, many representations*.

- Develops into: the spectral theorem as the common core (Part 0, M0.3;
  Part IV, M4.3); position and momentum as unbounded operators (M4.4).
- Foundational note: the eigenvalue problem is why "the spectrum of a self-adjoint
  operator" is the mathematically honest meaning of "the possible measured
  values."

## 4. The probability rule (1926): Born reads the wavefunction

Born's short paper on collision processes [`Born1926`] supplied the missing
interpretive rule: $|\psi(x)|^2$ is a probability density, and more generally the
probability of an outcome is the squared modulus of an amplitude. This is the
Born rule, the bridge from the linear-algebraic structure to experiment. It is
also the least "derived" postulate - Gleason (1957) will later show it is almost
forced by the lattice of projections, which is why a mathematician finds Gleason's
theorem so satisfying.

- Develops into: the Born rule (Part I, M1.3); Gleason's theorem
  (Part V, M5.2) [`Gleason1957`].

## 5. Transformation theory and the Dirac formalism (1927-1930)

Dirac and Jordan unified matrix and wave mechanics into "transformation theory":
states are vectors, observables are operators, and different representations are
different bases. Dirac's book [`Dirac1958`] gave the bra-ket notation and the
$\delta$-function calculus that physicists still use. The notation is powerful and
mathematically informal; a recurring exercise in this course is to translate a
Dirac-notation manipulation into a precise statement about operators on a Hilbert
space (and to notice where the informal calculus quietly uses unbounded operators
and non-normalizable "eigenvectors" - the seeds of rigged Hilbert spaces).

- Develops into: the postulates in Hilbert-space form (Part I); rigged Hilbert
  spaces as the rigorous home of bras and kets (Part IV / Tier-5 deepening).

## 6. Von Neumann's axiomatization (1932): quantum mechanics becomes mathematics

The turning point for a mathematician is von Neumann's *Mathematical Foundations
of Quantum Mechanics* [`VonNeumann2018`]. He replaced the competing pictures with
a single axiomatic framework: the state space is a separable complex Hilbert
space, observables are self-adjoint operators, the spectral theorem gives their
"possible values," measurement is projection, and mixed states are density
operators with a trace. He proved the spectral theorem for unbounded self-adjoint
operators - the theorem that is *still* the Part IV frontier of our formalization,
because it is not yet in Mathlib. He also introduced the trace formalism,
discussed the measurement problem precisely, and (in)famously gave a no-hidden-
variables argument later criticized by Bell.

- Develops into: essentially all of Parts 0, I, and IV. Von Neumann's book is the
  spine the course rests on.
- The frontier, precisely: von Neumann's unbounded spectral theorem is
  Theorem `thm:unbounded-spectral` in our blueprint - stated, tracked, not yet
  formalized.

## 7. Entanglement and the completeness debate (1935)

Einstein, Podolsky, and Rosen [`EPR1935`] argued that quantum mechanics is
incomplete, using a two-particle state with correlated measurements.
Schrodinger's reply [`Schrodinger1935`] coined the term *entanglement*
(Verschraenkung), identified it as "the characteristic trait of quantum
mechanics," and introduced the cat. Mathematically, entanglement is the simple and
decisive fact that a vector in a tensor product $H_A \otimes H_B$ need not be a
product $v_A \otimes v_B$; the Schmidt decomposition measures exactly how far it
is from one.

- Develops into: tensor products (M0.4); entanglement and Schmidt decomposition
  (M1.6); the EPR argument as the setup for Bell (M5.1).

## 8. Gleason, hidden variables, and contextuality (1957-1967)

Three theorems sharpen the foundations into mathematics a set theorist or lattice
theorist can love. Gleason [`Gleason1957`] showed that any assignment of
probabilities to the projections of a Hilbert space of dimension at least 3, that
is additive on orthogonal families, must come from a density operator - the Born
rule is essentially forced. Kochen and Specker [`KochenSpecker1967`] produced a
finite set of projections in $\mathbb{R}^3$ that cannot be consistently assigned
definite $\{0,1\}$ values, ruling out non-contextual hidden variables. Between
them, Bell [`Bell1964`] turned EPR into an inequality that experiment could
violate, and Clauser-Horne-Shimony-Holt [`CHSH1969`] gave its usable form.

- Develops into: Bell/CHSH (M5.1); Gleason and Kochen-Specker as contextuality
  (M5.2). These are largely finite-dimensional and therefore strong candidates
  for formalization.

## 9. Geometry enters: Aharonov-Bohm, Berry, Simon (1959-1984)

The Aharonov-Bohm effect [`AharonovBohm1959`] showed that the electromagnetic
potential - a connection, in geometric language - has physical consequences even
where the field vanishes, making the quantum phase a holonomy. Berry
[`Berry1984`] found that adiabatic transport around a loop in parameter space
leaves a geometric phase, and Simon [`Simon1983`] identified it as the holonomy of
a natural line bundle over the parameter space (with the Fubini-Study connection
on projective Hilbert space in the background). This is where the geometry of
quantum theory - projective space, the tautological bundle, curvature - becomes
physically visible.

- Develops into: projective Hilbert space and the Fubini-Study metric (M3.1-3.2);
  the geometric phase as holonomy (M3.3).

## 10. Algebra and geometry mature; the categorical turn (1943-2004)

In parallel with physics, the mathematics grew its own foundations. Gelfand and
Naimark (1943) characterized commutative C*-algebras as function algebras and
represented general ones on Hilbert space, giving the operator-algebraic view its
charter; the GNS construction manufactures a representation from a state. Mackey,
Bratteli-Robinson [`BratteliRobinson1`], and Haag [`Haag1996`] built the algebraic
approach to quantum statistical mechanics and field theory. On the geometric side,
Kostant, Souriau, and Kirillov [`Kirillov2004`] developed geometric quantization
and the orbit method, making "quantization" itself a functor-like construction
from symplectic geometry.

Finally, Abramsky and Coecke [`AbramskyCoecke2004`] recast quantum protocols in
the language of compact closed (dagger) categories, showing that much of quantum
information is diagrammatic and does not need Hilbert spaces at all. For a reader
with a PL/formal-methods sensibility this categorical formulation is the natural
capstone, and it connects to the Baez-Stay "Rosetta Stone" [`BaezStay2011`]
between physics, topology, logic, and computation.

- Develops into: C*-algebras, GNS, Gelfand-Naimark (M2.1-2.3); symmetry and
  representation theory (M2.5); geometric quantization (M3.5); the categorical
  capstone (M4.6).

## 11. Formalization (2020s-): the theorem becomes code

The most recent chapter is the one this project belongs to. Mathlib now carries
the finite-dimensional spectral theorem, the continuous functional calculus
[`DedeckerLoreaux2025`], tensor products, and much of the analysis quantum
mechanics needs; the Lean-QuantumInfo library [`LeanQuantumInfo`] formalizes
finite-dimensional quantum information. What is *not* yet there - the unbounded
self-adjoint spectral theorem, Stone's theorem in full, essential
self-adjointness of Schrodinger operators - is exactly the course's frontier. The
history is still being written, and part of the point of this course is to watch
the verified/frontier line move.

## A one-page timeline

```
 1900  Planck         quantized energy                 (old quantum theory)
 1913  Bohr           quantized orbits
 1925  Heisenberg     matrix mechanics; noncommutativity   [Heisenberg1925]  -> M2.1, M4.4
 1926  Born-H.-Jordan CCR, systematic matrix mechanics     [BornHeisenbergJordan1926]
 1926  Schrodinger    wave mechanics (eigenvalue problem)  [Schrodinger1926] -> M0.3, M4.3
 1926  Born           the probability rule                 [Born1926]        -> M1.3
 1927  Dirac/Jordan   transformation theory                [Dirac1958]       -> Part I
 1932  von Neumann    Hilbert-space axiomatization         [VonNeumann2018]  -> Parts 0,I,IV
 1935  EPR / Schrod.  entanglement, incompleteness         [EPR1935]         -> M1.6, M5.1
 1943  Gelfand-Naim.  C*-algebras                                              -> M2.1-2.3
 1957  Gleason        Born rule from projections           [Gleason1957]     -> M5.2
 1959  Aharonov-Bohm  phase as holonomy                    [AharonovBohm1959]-> M3.3
 1964  Bell           the inequality                       [Bell1964]        -> M5.1
 1967  Kochen-Specker contextuality                        [KochenSpecker1967]-> M5.2
 1969  CHSH           experimental Bell inequality         [CHSH1969]        -> M5.1
 1983  Simon          geometric phase as holonomy          [Simon1983]       -> M3.3
 1984  Berry          the geometric phase                  [Berry1984]       -> M3.3
 2004  Abramsky-Coecke categorical quantum mechanics       [AbramskyCoecke2004]-> M4.6
 2025  Mathlib CFC    formalization reaches spectral QM     [DedeckerLoreaux2025]
```
