<!-- SPDX-License-Identifier: CC-BY-SA-4.0 -->

# Syllabus: module by module

Each module is roughly one lecture. The template is fixed:

- **Question** - the motivating problem.
- **Origin** - the historical source (see [`history.md`](history.md)).
- **Mathematics** - what is developed, stated precisely.
- **Lean anchor** - the declaration in `QuantumBook/` that pins it. `[proven]`
  names a real, `sorry`-free declaration; a name in `angle brackets` is a planned
  declaration; `[frontier]` is a tracked `sorry`-node.
- **Concept** - the foundational/interpretive issue it raises.
- **Resources** - curated, from [`../references/reading-map.md`](../references/reading-map.md).
- **Exercises** - formal (F), analytic (A), conceptual (C).

Citations use bibtex keys from
[`../references/bibliography.bib`](../references/bibliography.bib). Video pointers
name a course from the reading map (MIT OCW 8.04/8.05/8.06, Schuller's lectures).

---

# Part 0 - Substrate (mathematical foundations) `[proven]`

The linear algebra on which everything rests, built to be reused verbatim in
infinite dimensions later. Fully verified.

## M0.1 - Complex inner-product spaces

- **Question**: What is the state space of a quantum system, before any physics?
- **Origin**: von Neumann's choice of a complex Hilbert space [`VonNeumann2018`].
- **Mathematics**: finite-dimensional complex inner-product spaces
  (`EuclideanSpace ℂ (Fin n)`); sesquilinear inner product, norm, orthonormal
  bases, orthogonal projection, the adjoint of a vector (bra). Why complex and not
  real: interference, the need for a square root of $-1$ in the generator of
  time evolution.
- **Lean anchor**: Mathlib `InnerProductSpace ℂ E`, `EuclideanSpace`,
  `OrthonormalBasis`. Course wrapper `<QuantumBook.Foundations.State>` (planned).
- **Concept**: the difference between a vector and a ray (global phase is
  physically irrelevant) - foreshadows projective space (M3.1).
- **Resources**: [`Hall2013QTM`] ch. 3; [`Woit2017`] ch. 4 (free); MIT OCW 8.05
  linear-algebra review.
- **Exercises**: (A) show a complex inner product is determined by its norm via
  polarization. (C) argue physically why global phase cannot be observed.

## M0.2 - Operators, adjoints, self-adjointness

- **Question**: Which linear maps deserve to be called observables?
- **Origin**: matrix mechanics' Hermitian arrays [`Heisenberg1925`].
- **Mathematics**: linear operators on $E$; the adjoint $T^{*}$; self-adjoint
  (`IsSymmetric` / Hermitian), skew-adjoint, unitary, normal operators; the
  spectral notions (eigenvalue, eigenspace). Self-adjoint = real diagonal in an
  orthonormal basis (proved next).
- **Lean anchor**: `LinearMap.IsSymmetric`, `Matrix.IsHermitian`, `unitary`
  (Mathlib). Real spectrum is
  `QuantumBook.Foundations.selfAdjoint_eigenvalue_isReal` `[proven]`.
- **Concept**: why *self*-adjoint and not merely symmetric - the distinction is
  invisible in finite dimensions and decisive in infinite dimensions (M4.2).
- **Resources**: [`Hall2013QTM`] ch. 3, 9; [`ReedSimon1`] ch. VI; Schuller
  Quantum Theory lectures on self-adjointness.
- **Exercises**: (F) prove that the eigenvalues of a symmetric operator are real
  (this is the anchor decl). (A) show unitary = norm-preserving bijection.

## M0.3 - The finite-dimensional spectral theorem `[proven, done]`

- **Question**: Can every observable be simultaneously "diagonalized" - given a
  basis of definite-value states?
- **Origin**: classical (Cauchy) linear algebra; its quantum reading is
  von Neumann's.
- **Mathematics**: a Hermitian matrix $A = U D U^{*}$ with $U$ unitary and $D$
  real-diagonal; equivalently, a self-adjoint operator has an orthonormal
  eigenbasis and acts by scaling on it. This is the finite-dimensional core that
  the unbounded theorem (M4.3) will generalize.
- **Lean anchor**: `QuantumBook.Foundations.hermitian_spectral_decomposition` and
  `QuantumBook.Foundations.selfAdjoint_eigenvector_equation` `[proven]`. This is
  the completed Tier-0 vertical slice; see `book/Chapters/Ch00_Substrate.lean`.
- **Concept**: the spectral theorem is the mathematical content of "measuring an
  observable yields one of its eigenvalues, and leaves the system in the
  corresponding eigenstate."
- **Resources**: [`Hall2013QTM`] ch. 7; [`Teschl2014`] ch. 3 (free); the book
  chapter.
- **Exercises**: (F) prove $A = UDU^{*}$ from Mathlib's `spectral_theorem` (done
  in the book; redo it your way). (A) diagonalize the Pauli matrices by hand.

## M0.4 - Tensor products

- **Question**: How do we describe a system built from two subsystems?
- **Origin**: Schrodinger's entanglement [`Schrodinger1935`].
- **Mathematics**: the tensor product $H_A \otimes H_B$; bases, dimension
  multiplies; operators $A \otimes B$; the swap; why quantum composition is
  tensor and not Cartesian product (this is the whole source of entanglement).
- **Lean anchor**: Mathlib `TensorProduct`, `TensorProduct.map`; course wrapper
  `<QuantumBook.FiniteDim.systemTensor>` (planned).
- **Concept**: composition-by-tensor is *the* structural fact behind entanglement,
  Bell inequalities, and quantum computing's power.
- **Resources**: [`NielsenChuang2010`] ch. 2; [`Hall2013QTM`] ch. 19;
  [`HeunenVicary2019`] (monoidal structure).
- **Exercises**: (A) show $\dim(H_A \otimes H_B) = \dim H_A \cdot \dim H_B$ and
  that not every vector factors. (F) define the swap and prove it is unitary.

## M0.5 - Positive operators, trace, density operators

- **Question**: What is the most general state, including statistical mixtures?
- **Origin**: von Neumann's trace formalism [`VonNeumann2018`].
- **Mathematics**: positive semidefinite operators; the trace and its cyclicity;
  a density operator $\rho \geq 0$ with $\operatorname{tr}\rho = 1$; pure states as
  rank-one projections; the convex structure of the state space (extreme points =
  pure states).
- **Lean anchor**: Mathlib `Matrix.PosSemidef`, `Matrix.trace`; course
  `<QuantumBook.FiniteDim.DensityOperator>` (planned).
- **Concept**: the state space is a convex set; measurement statistics are linear
  functionals on it - the doorway to the operator-algebraic view (M2.1).
- **Resources**: [`Watrous2018`] ch. 2 (free); [`Wilde2017`] ch. 3-4 (free).
- **Exercises**: (F) prove trace is cyclic. (A) show the qubit density operators
  are the Bloch ball; pure states are its surface.

---

# Part I - Finite-dimensional quantum mechanics (the postulates) `[proven]`

The postulates, each anchored to a proven theorem. This part alone is a
releasable "verified QM primer."

## M1.1 - States

- **Question**: What represents "the state of the system"?
- **Mathematics**: pure states as rays (unit vectors mod phase) or rank-one
  projections; mixed states as density operators; convex combination = classical
  mixture. Restatement of M0.5 as postulate 1.
- **Lean anchor**: `<QuantumBook.FiniteDim.State>`, `<...DensityOperator>`.
- **Concept**: ray vs vector; the physical irrelevance of global phase and the
  relevance of relative phase.
- **Resources**: [`Hall2013QTM`] ch. 3; MIT OCW 8.04.
- **Exercises**: (C) why is a mixed state not just "a probability distribution
  over pure states" in a basis-independent way? (A) purification of a mixed state.

## M1.2 - Observables

- **Question**: What represents a measurable quantity, and what are its possible
  values?
- **Mathematics**: observables as self-adjoint operators; possible values = the
  spectrum; the projection-valued decomposition of the identity from the spectral
  theorem (M0.3). Expectation value $\langle A\rangle_\rho =
  \operatorname{tr}(\rho A)$.
- **Lean anchor**: builds on
  `QuantumBook.Foundations.selfAdjoint_eigenvector_equation` `[proven]`; planned
  `<QuantumBook.FiniteDim.expectation>`.
- **Concept**: why a real-valued measurement corresponds to a self-adjoint
  operator (M0.2's real-spectrum theorem is the justification).
- **Resources**: [`Hall2013QTM`] ch. 3; [`Strocchi2008`] (axioms).
- **Exercises**: (F) prove $\operatorname{tr}(\rho A) \in \mathbb{R}$ for
  self-adjoint $A$ and state $\rho$. (A) compute $\langle \sigma_z\rangle$ on a
  Bloch state.

## M1.3 - The Born rule

- **Question**: What is the probability of a measurement outcome?
- **Origin**: Born [`Born1926`]; justified by Gleason [`Gleason1957`].
- **Mathematics**: the probability of outcome (eigenvalue) $\lambda$ in state
  $\rho$ is $\operatorname{tr}(P_\lambda\, \rho)$ where $P_\lambda$ is the
  eigenprojection; for a pure state $\psi$, $|\langle e_\lambda | \psi\rangle|^2$.
  A commuting-square diagram: state $\to$ density operator $\to$ outcome
  distribution.
- **Lean anchor**: `<QuantumBook.FiniteDim.born_rule>` (planned), built on the
  spectral projections of M0.3.
- **Concept**: the Born rule is the one genuinely probabilistic postulate; Gleason
  shows it is nearly forced (M5.2). This is where "measurement" enters and the
  interpretations diverge (M5.3).
- **Resources**: [`NielsenChuang2010`] ch. 2; [`Landsman2017`] (free) on Gleason;
  SEP "Philosophical Issues in Quantum Theory".
- **Exercises**: (F) show the Born probabilities are nonnegative and sum to 1
  (partition of unity from spectral projections). (A) verify for a spin-1/2
  Stern-Gerlach sequence.

## M1.4 - The qubit and the Bloch sphere

- **Question**: What is the simplest quantum system, and what is its geometry?
- **Mathematics**: $H = \mathbb{C}^2$; the Pauli operators $\sigma_x, \sigma_y,
  \sigma_z$ as a basis of the trace-zero Hermitian matrices; states as points of
  the Bloch ball, pure states as its 2-sphere; unitary evolution as $SU(2)$
  rotation, the $SU(2)\to SO(3)$ double cover.
- **Lean anchor**: `<QuantumBook.FiniteDim.Qubit>`, `<...pauli>`,
  `<...blochVector>` (planned).
- **Concept**: the first appearance of projective geometry (the Bloch sphere is
  $\mathbb{CP}^1$) and of the spin double cover - a preview of M2.5 and M3.1.
- **Resources**: [`NielsenChuang2010`] ch. 1-2; [`Woit2017`] ch. 3-4 (free) on
  $SU(2)$; MIT OCW 8.05.
- **Exercises**: (F) prove the Pauli matrices are Hermitian, traceless, and
  square to $I$. (A) show $SU(2)$ acts on the Bloch sphere as $SO(3)$; find the
  kernel.

## M1.5 - Unitary dynamics

- **Question**: How does a closed system evolve in time?
- **Origin**: Schrodinger [`Schrodinger1926`]; Stone's theorem for the generator.
- **Mathematics**: time evolution is a one-parameter unitary group
  $U(t) = e^{-itH/\hbar}$ with self-adjoint generator $H$ (the Hamiltonian); the
  finite-dimensional Schrodinger equation $i\hbar\,\dot\psi = H\psi$. Finite-dim
  Stone: continuous one-parameter unitary groups $\leftrightarrow$ self-adjoint
  generators (matrix exponential).
- **Lean anchor**: Mathlib `Matrix.exp`, `NormedSpace.exp`; course
  `<QuantumBook.FiniteDim.evolution>` (planned). The unbounded Stone theorem is
  M4.5 `[frontier]`.
- **Concept**: dynamics is a *symmetry* (a group action); this is the seed of the
  representation-theoretic view (M2.5) and of the geometric phase (M3.3).
- **Resources**: [`Hall2013QTM`] ch. 10; [`Takhtajan2008`]; MIT OCW 8.04.
- **Exercises**: (F) prove $e^{-itH}$ is unitary for Hermitian $H$. (A) solve the
  two-level Rabi problem.

## M1.6 - Composite systems and entanglement

- **Question**: What states of a bipartite system cannot be understood as
  independent subsystems?
- **Origin**: EPR and Schrodinger [`EPR1935`, `Schrodinger1935`].
- **Mathematics**: states on $H_A \otimes H_B$; product vs entangled;
  the Schmidt decomposition $\psi = \sum_i \sqrt{p_i}\, a_i \otimes b_i$; Schmidt
  rank as an entanglement witness; the reduced density operator via partial trace.
  Maximally entangled states and the Bell basis.
- **Lean anchor**: `<QuantumBook.FiniteDim.schmidtDecomposition>`,
  `<...partialTrace>` (planned), on Mathlib `TensorProduct` and SVD.
- **Concept**: entanglement is the "characteristic trait" (Schrodinger); it is the
  resource behind Bell violation (M5.1) and quantum computation (M6.x).
- **Resources**: [`NielsenChuang2010`] ch. 2; [`Watrous2018`] (free);
  [`Wilde2017`] (free).
- **Exercises**: (F) prove the Schmidt rank is basis-independent. (A) compute the
  reduced state of a Bell pair; observe it is maximally mixed.

## M1.7 - Mixed states, partial trace, no-cloning

- **Question**: What are the fundamental limits already visible in finite
  dimensions?
- **Mathematics**: partial trace and its characterization as the unique
  trace-preserving map consistent with local expectations; the no-cloning theorem
  (no unitary copies an unknown state) from linearity; purification (every mixed
  state is a marginal of a pure state).
- **Lean anchor**: `<QuantumBook.FiniteDim.no_cloning>` (planned) - a clean,
  fully-formalizable theorem.
- **Concept**: no-cloning is a one-line linear-algebra fact with enormous
  consequences (quantum key distribution); a showcase of "finite-dim ⇒ provable."
- **Resources**: [`NielsenChuang2010`] ch. 12; [`Wilde2017`] (free);
  [`LeanQuantumInfo`] for prior formalization.
- **Exercises**: (F) prove no-cloning from bilinearity/inner-product preservation.
  (A) purify a qubit mixed state into a two-qubit pure state.

---

# Part II - Operator-algebraic view `[targeted]`

Formalize as far as Mathlib's C*-algebra and continuous functional calculus reach
[`DedeckerLoreaux2025`].

## M2.1 - C*-algebras and states

- **Question**: What if we take the algebra of observables, not the Hilbert space,
  as primary?
- **Origin**: Gelfand-Naimark (1943); [`BratteliRobinson1`], [`Strocchi2008`].
- **Mathematics**: C*-algebras (Banach $*$-algebras with $\|a^*a\|=\|a\|^2$);
  positive elements; states as positive normalized linear functionals; the
  commutative case (Gelfand: $C(X)$).
- **Lean anchor**: Mathlib `CStarAlgebra`, `CStarRing`; course
  `<QuantumBook.Algebraic.State>` (planned).
- **Concept**: observables-first is the natural home for systems with infinitely
  many degrees of freedom (statistical mechanics, QFT) where no single Hilbert
  space is preferred.
- **Resources**: [`BratteliRobinson1`]; [`Strocchi2008`]; [`Landsman2017`] (free).
- **Exercises**: (A) show a state on $M_n(\mathbb{C})$ is $\rho \mapsto
  \operatorname{tr}(\rho\,\cdot)$ (finite-dim Gelfand-Naimark-Segal preview).

## M2.2 - The GNS construction

- **Question**: How do you get a Hilbert-space representation back from an
  algebra and a state?
- **Mathematics**: from a state $\omega$ on a C*-algebra $A$, build a Hilbert
  space (complete $A/\ker$ under $\langle a,b\rangle = \omega(a^*b)$), a cyclic
  vector, and a representation. The bridge between the algebraic and Hilbert-space
  pictures.
- **Lean anchor**: `<QuantumBook.Algebraic.gns>` (planned; likely partial -
  depends on Mathlib's completion and representation API).
- **Concept**: different states give inequivalent representations (superselection),
  invisible in finite dimensions.
- **Resources**: [`BratteliRobinson1`] ch. 2; [`Landsman2017`] (free).
- **Exercises**: (A) carry out GNS for a state on $M_2(\mathbb{C})$ explicitly.

## M2.3 - Gelfand-Naimark

- **Question**: Is every C*-algebra an algebra of operators?
- **Mathematics**: the commutative Gelfand-Naimark theorem ($A \cong C_0(X)$ for
  $X$ the spectrum); the general one (every C*-algebra embeds in $B(H)$ via a
  direct sum of GNS representations).
- **Lean anchor**: Mathlib's Gelfand duality (`WeakDual.CharacterSpace`,
  `gelfandTransform`) where available; course pointer `<QuantumBook.Algebraic.gelfandNaimark>`.
- **Concept**: "quantum = noncommutative $C(X)$" - the slogan that makes
  noncommutative geometry possible.
- **Resources**: [`BratteliRobinson1`]; Mathlib analysis docs [`Mathlib4`].
- **Exercises**: (A) identify the spectrum of the algebra generated by a single
  self-adjoint operator with its spectrum-as-a-set.

## M2.4 - Continuous functional calculus

- **Question**: How do we apply a continuous function to an operator?
- **Origin**: the modern Lean formalization [`DedeckerLoreaux2025`].
- **Mathematics**: for a self-adjoint (or normal) element $a$, a $*$-homomorphism
  $C(\sigma(a)) \to A$ sending $\mathrm{id}\mapsto a$; recovers the spectral
  theorem, defines $\sqrt{a}$, $e^{ita}$, projections. The finite-dim spectral
  theorem (M0.3) is its shadow.
- **Lean anchor**: Mathlib `cfc`, `CFC`; course examples in
  `<QuantumBook.Algebraic.FunctionalCalculus>`.
- **Concept**: the CFC is the tool that will let us *state* the unbounded spectral
  theorem's finite/bounded approximations; it is the frontier's near side.
- **Resources**: [`DedeckerLoreaux2025`] (free, arXiv); Mathlib docs.
- **Exercises**: (F) use Mathlib's `cfc` to define the square root of a positive
  matrix and prove it squares back.

## M2.5 - Symmetry: SU(2), SO(3), spin

- **Question**: How does representation theory produce spin and angular momentum?
- **Origin**: Wigner [`Wigner1931`]; [`Woit2017`], [`HallLie2015`].
- **Mathematics**: Lie groups/algebras $\mathfrak{su}(2)\cong\mathfrak{so}(3)$;
  irreducible representations indexed by spin $j=0,\tfrac12,1,\dots$; the spin-1/2
  rep is the qubit; angular momentum operators as the $\mathfrak{su}(2)$ generators;
  Wigner's theorem (symmetries = unitary/antiunitary).
- **Lean anchor**: Mathlib Lie-algebra and representation API; course
  `<QuantumBook.Algebraic.su2Rep>` (targeted).
- **Concept**: physical symmetry is unitary representation theory; particles are
  irreducibles - the deepest structural idea in the course.
- **Resources**: [`HallLie2015`]; [`Woit2017`] (free); [`Sternberg1994`];
  Schuller's Geometric Anatomy lectures.
- **Exercises**: (A) build the spin-1 rep from spin-1/2 $\otimes$ spin-1/2 and
  find the singlet/triplet (Clebsch-Gordan by hand).

---

# Part III - Geometry of quantum theory `[book/targeted]`

Book-strong, formalization targeted.

## M3.1 - Projective Hilbert space

- **Question**: What is the true state space once phase is quotiented out?
- **Mathematics**: $\mathbb{P}(H) = (H\setminus 0)/\mathbb{C}^\times$; rays as
  points; the tautological line bundle; the qubit case $\mathbb{CP}^1 = S^2$
  (Bloch). Transition probabilities as a function on $\mathbb{P}(H)\times
  \mathbb{P}(H)$.
- **Lean anchor**: Mathlib `Projectivization`; course
  `<QuantumBook.Geometry.rayState>`.
- **Concept**: states are points of a projective variety; observables are related
  to sections/functions on it - the geometric restatement of Part I.
- **Resources**: [`Woit2017`] (free); [`Moretti2017`]; Schuller Geometric Anatomy.
- **Exercises**: (A) show the Fubini-Study distance recovers the Born
  transition probability.

## M3.2 - The Fubini-Study metric

- **Question**: Does the state space have a natural geometry?
- **Mathematics**: the Fubini-Study Kahler metric on $\mathbb{P}(H)$; its Riemann-
  ian, symplectic, and complex structures; geodesics and the quantum speed limit.
- **Lean anchor**: `<QuantumBook.Geometry.fubiniStudy>` (book-level first).
- **Concept**: quantum state space is a Kahler manifold; dynamics is Hamiltonian
  flow on it (M3.4) - quantum mechanics *is* a classical Hamiltonian system on
  $\mathbb{P}(H)$.
- **Resources**: [`Moretti2017`]; [`GuilleminSternberg1984`].
- **Exercises**: (A) compute the FS metric on $\mathbb{CP}^1$; recognize the round
  sphere.

## M3.3 - Berry / geometric phase

- **Question**: What survives a cyclic adiabatic evolution beyond the dynamical
  phase?
- **Origin**: Berry [`Berry1984`], Simon [`Simon1983`], Aharonov-Bohm
  [`AharonovBohm1959`].
- **Mathematics**: parallel transport of the eigenline over parameter space; the
  Berry connection and curvature; the geometric phase as holonomy of the
  tautological bundle with the FS connection; the Aharonov-Bohm phase as a special
  case.
- **Lean anchor**: `<QuantumBook.Geometry.berryPhase>` (book-level; connection/
  holonomy formalization is targeted/frontier depending on Mathlib bundles).
- **Concept**: phase is geometry (holonomy); this is where fibre bundles enter
  physics irreducibly.
- **Resources**: [`Simon1983`], [`Berry1984`]; [`Woit2017`] (free).
- **Exercises**: (A) compute the Berry phase of a spin-1/2 in a slowly rotating
  field; get the solid-angle answer.

## M3.4 - Symplectic / Kahler structure

- **Question**: In what sense is quantum mechanics a Hamiltonian system?
- **Mathematics**: the imaginary part of the Hermitian form is a symplectic form;
  Schrodinger evolution is the Hamiltonian flow of $\langle H\rangle$ on
  $\mathbb{P}(H)$; the real part is the FS metric; together, Kahler.
- **Lean anchor**: `<QuantumBook.Geometry.symplecticState>` (book-level).
- **Concept**: the classical/quantum boundary is softer than it looks: QM is
  classical mechanics on a very special phase space.
- **Resources**: [`GuilleminSternberg1984`]; [`BatesWeinstein1997`] (free).
- **Exercises**: (A) verify Schrodinger's equation is Hamilton's equations for
  $\langle H\rangle$ under the symplectic form.

## M3.5 - Geometric quantization (survey)

- **Question**: Can one build the quantum theory from the classical phase space
  functorially?
- **Origin**: Kostant-Souriau; Kirillov's orbit method [`Kirillov2004`].
- **Mathematics**: prequantum line bundle, polarization, the quantization map;
  coadjoint orbits and the orbit method; obstructions. Survey level.
- **Lean anchor**: none planned near-term (book/survey).
- **Concept**: "quantization" as a construction, not a guess; the counterpoint to
  deformation quantization.
- **Resources**: [`Woodhouse1992`]; [`BatesWeinstein1997`] (free);
  [`Kirillov2004`].
- **Exercises**: (C) contrast geometric and deformation quantization on a
  one-paragraph example.

---

# Part IV - Frontier and categorical capstone `[frontier/book]`

Where rigor is hardest; frontier results are tracked `sorry`-nodes.

## M4.1 - Unbounded operators and domains

- **Question**: Why can't position and momentum be bounded operators?
- **Mathematics**: the CCR $[Q,P]=i\hbar I$ has no bounded solution (Wintner-
  Wielandt); operators defined on dense domains; closed and closable operators;
  the graph.
- **Lean anchor**: Mathlib unbounded-operator support is partial; course
  `<QuantumBook.Frontier.Unbounded>` collects what exists.
- **Concept**: the domain *is* physics (boundary conditions); ignoring it produces
  paradoxes.
- **Resources**: [`ReedSimon1`], [`ReedSimon2`]; [`Hall2013QTM`] ch. 9;
  [`Teschl2014`] (free).
- **Exercises**: (A) prove no bounded operators satisfy the CCR (trace argument in
  finite dim shows the obstruction).

## M4.2 - Symmetric vs self-adjoint

- **Question**: When does a symmetric operator generate a unitary group?
- **Mathematics**: the domain of the adjoint; symmetric $\subsetneq$ self-adjoint;
  deficiency indices; essential self-adjointness; von Neumann's extension theory.
  The particle-in-a-box as the canonical example of many self-adjoint extensions.
- **Lean anchor**: `[frontier]` - Mathlib lacks the extension theory; tracked.
- **Concept**: the finite-dim illusion (M0.2) that symmetric = self-adjoint breaks
  here; this is the single most important subtlety in mathematical QM.
- **Resources**: [`ReedSimon2`] ch. X; [`Teschl2014`] (free) ch. 2.
- **Exercises**: (A) find the self-adjoint extensions of $-i\,d/dx$ on $[0,1]$;
  interpret the boundary phase.

## M4.3 - The unbounded spectral theorem `[frontier]`

- **Question**: What is the general form of "diagonalizing" a self-adjoint
  operator?
- **Origin**: von Neumann [`VonNeumann2018`].
- **Mathematics**: a self-adjoint operator is unitarily equivalent to
  multiplication by a real function on an $L^2$ space; equivalently a
  projection-valued spectral measure $E$, with $A = \int \lambda\, dE(\lambda)$.
- **Lean anchor**: **frontier node** `thm:unbounded-spectral` in the blueprint - a
  `sorry` with no Lean declaration, because this is *not yet in Mathlib*. This is
  the flagship frontier of the project.
- **Concept**: this theorem is the exact boundary of what is currently
  formalizable; retiring it is the project's long-term goal (prompt §11).
- **Resources**: [`ReedSimon1`] ch. VIII; [`Hall2013QTM`] ch. 10;
  [`Moretti2017`].
- **Exercises**: (C) explain why the finite-dim proof (M0.3) does not generalize;
  identify precisely the missing Mathlib ingredient.

## M4.4 - Position, momentum, and the CCR

- **Question**: What is the canonical representation, and is it unique?
- **Mathematics**: $Q$ = multiplication by $x$, $P = -i\hbar\, d/dx$ on
  $L^2(\mathbb{R})$; the Stone-von Neumann uniqueness theorem for the (regular,
  irreducible) representations of the Heisenberg group; the exponentiated Weyl
  form of the CCR.
- **Lean anchor**: `[frontier/targeted]` - the Weyl form is closer to formalizable
  than the unbounded operators themselves.
- **Concept**: uniqueness of the representation is why "the" wavefunction picture
  is canonical in finite degrees of freedom - and why it fails in QFT (infinitely
  many), reconnecting to M2.1.
- **Resources**: [`Hall2013QTM`] ch. 14; [`Woit2017`] (free); [`ReedSimon1`].
- **Exercises**: (A) verify the Weyl relations from the CCR formally; note the
  domain issues.

## M4.5 - Stone's theorem and Schrodinger dynamics `[frontier]`

- **Question**: What is the rigorous statement of quantum time evolution?
- **Mathematics**: Stone's theorem (strongly continuous one-parameter unitary
  groups $\leftrightarrow$ self-adjoint generators) in infinite dimensions;
  essential self-adjointness of Schrodinger operators $-\Delta + V$ (Kato-Rellich);
  well-posedness of the Schrodinger equation.
- **Lean anchor**: `[frontier]` - depends on M4.3; tracked.
- **Concept**: only now is "the system evolves by $e^{-itH}$" a theorem rather than
  a formal manipulation.
- **Resources**: [`ReedSimon2`]; [`Teschl2014`] (free); [`Hall2013QTM`].
- **Exercises**: (A) apply Kato-Rellich to show $-\Delta + 1/|x|$ is essentially
  self-adjoint on a suitable domain.

## M4.6 - Categorical / diagrammatic quantum mechanics (capstone)

- **Question**: How much of quantum theory is structure, independent of Hilbert
  spaces?
- **Origin**: Abramsky-Coecke [`AbramskyCoecke2004`]; [`CoeckeKissinger2017`],
  [`HeunenVicary2019`], [`BaezStay2011`].
- **Mathematics**: dagger compact closed (monoidal) categories; states, effects,
  and processes as morphisms; the graphical calculus; teleportation and
  entanglement-swapping as diagram equations; the Rosetta Stone linking physics,
  topology, logic, and computation.
- **Lean anchor**: Mathlib `CategoryTheory.Monoidal`, dagger/rigid structure where
  present; course `<QuantumBook.Categorical>` (targeted; a natural fit for a
  formal-methods reader).
- **Concept**: the capstone that reframes the whole course - quantum processes as
  a compositional algebra, with proofs that are pictures.
- **Resources**: [`AbramskyCoecke2004`] (free); [`CoeckeKissinger2017`];
  [`HeunenVicary2019`]; [`BaezStay2011`] (free).
- **Exercises**: (A) prove quantum teleportation as a diagram equation in a dagger
  compact category (no Hilbert spaces).

---

# Part V - Foundations and quantum information (spiral electives)

Grown outward per `../SCOPE.md`; treated fairly and carefully.

## M5.1 - Bell and CHSH

- **Origin**: EPR [`EPR1935`], Bell [`Bell1964`], CHSH [`CHSH1969`].
- **Mathematics**: local hidden-variable models; the CHSH inequality
  $|S|\leq 2$ classically; the Tsirelson bound $2\sqrt2$ quantum; violation by a
  Bell pair (M1.6). Largely finite-dimensional ⇒ strongly formalizable.
- **Lean anchor**: `<QuantumBook.Foundations.chsh>` (targeted; a great
  formalization target).
- **Concept**: no local hidden-variable theory reproduces quantum statistics -
  a theorem, not a philosophy.
- **Resources**: [`Bell1964`] (free); SEP "Bell's Theorem"; [`NielsenChuang2010`].
- **Exercises**: (F) prove the classical CHSH bound. (A) derive the Tsirelson
  bound.

## M5.2 - Gleason, Kochen-Specker, contextuality

- **Origin**: Gleason [`Gleason1957`], Kochen-Specker [`KochenSpecker1967`].
- **Mathematics**: Gleason's derivation of the Born rule from projection measures
  (dim $\geq 3$); the Kochen-Specker obstruction to non-contextual $\{0,1\}$
  value assignments; finite KS sets.
- **Lean anchor**: `<QuantumBook.Foundations.kochenSpecker>` (a finite,
  combinatorial, formalizable statement).
- **Concept**: measured values cannot pre-exist independently of the measurement
  context.
- **Resources**: [`Gleason1957`], [`KochenSpecker1967`]; [`Landsman2017`] (free).
- **Exercises**: (A) exhibit a small KS set in $\mathbb{R}^3$ and show the
  coloring obstruction.

## M5.3 - Measurement, decoherence, interpretations

- **Question**: What actually happens in a measurement?
- **Mathematics**: the measurement problem stated precisely (unitary evolution vs
  projection); decoherence and the einselection of a pointer basis; a fair survey
  of Copenhagen, many-worlds, Bohmian, and objective-collapse readings - as
  clearly-labeled *informal* remarks (category 3).
- **Lean anchor**: none (category 3 by design).
- **Concept**: where the mathematics is silent and the interpretation begins; the
  course marks the boundary explicitly.
- **Resources**: SEP "Philosophical Issues in Quantum Theory", "Quantum
  Mechanics"; [`Landsman2017`] (free).
- **Exercises**: (C) state the measurement problem without using any interpretive
  vocabulary; identify exactly which postulate each interpretation modifies.

## M6.x - Quantum information and computation (spiral)

Mostly finite-dimensional, hence highly verifiable; grow as time allows.

- M6.1 Quantum channels (CPTP maps), Choi-Jamiolkowski, Kraus form.
- M6.2 Entropy: von Neumann and relative entropy, data processing, strong
  subadditivity (formalized in [`LeanQuantumInfo`]).
- M6.3 Quantum error correction: stabilizer codes, the Knill-Laflamme conditions.
- M6.4 Algorithms: Deutsch-Jozsa, Grover, phase estimation.
- **Lean anchors**: `<QuantumBook.FiniteDim.channel>`, `<...vonNeumannEntropy>`,
  `<...stabilizerCode>` (targeted). Reuse [`LeanQuantumInfo`] conventions.
- **Resources**: [`NielsenChuang2010`]; [`Watrous2018`] (free); [`Wilde2017`]
  (free); Preskill Ph219 notes (free).
- **Exercises**: (F) prove a channel is CPTP iff its Choi matrix is positive with
  the right partial trace. (A) run Grover for $N=4$ by hand.
