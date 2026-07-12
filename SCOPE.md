# SCOPE - whole-territory coverage map

The low-resolution map of the *entire* intended territory (prompt.md §11a). Every
topic is a stub with a one-line status, so "cover as much as possible" is visible
and navigable from day one. Later passes raise the resolution. This is the
breadth ledger; `PROGRESS.md` is the depth/frontier ledger and the blueprint is
the machine-checked dependency graph.

**Status legend**

- `[ ]` not started
- `[~]` in progress (some layer exists)
- `[x]` complete across all four layers (formal + book + video + provenance), or
  explicitly logged as book-only / frontier
- `(F)` frontier: legitimately `sorry`-stated per invariant 2 (not yet in Mathlib)
- `(B)` book-level: prose/geometry-first, formalization targeted or deferred

Each topic will become a blueprint node. The verified/frontier line (§2) runs
through this map: finite-dimensional ⇒ must be fully proven; unbounded /
infinite-dimensional ⇒ may be frontier.

---

## Tier 0 - Vertical slice (pipeline proof)

- [~] End-to-end pipeline on one concept: the finite-dim spectral theorem for a
  Hermitian operator, through all three layers + provenance. **(in progress)**

## Tier 1 - Verified finite-dimensional core (Parts 0-I, fully proven)

### Part 0 - Substrate

- [~] Finite-dim complex inner product / Hilbert spaces (`EuclideanSpace ℂ n`)
- [ ] Adjoint of an operator; self-adjoint (Hermitian) operators
- [ ] Orthonormal bases, orthogonal projections
- [~] Spectral theorem for Hermitian operators (baby case) - Tier-0 concept
- [ ] Real spectrum of a self-adjoint operator (observables are real)
- [ ] Tensor products of finite-dim Hilbert spaces
- [ ] Positive operators; density operators; trace

### Part I - Finite-dimensional QM

- [~] The qubit: state space `ℂ²`, Pauli operators (Hermitian, traceless,
  involutive - all proven); Bloch sphere (book/video)
- [~] Observables as self-adjoint operators; expectation values real (proven);
  eigenvalues as outcomes
- [~] The Born rule: probabilities nonnegative and sum to one (proven)
- [~] Unitary evolution: conserves total probability (proven); one-parameter groups / finite-dim Stone (planned)
- [ ] Composite systems via tensor products
- [ ] Entanglement; Schmidt decomposition
- [ ] Density matrices; mixed states; partial trace
- [ ] No-cloning; basic quantum information primitives

## Tier 2 - Operator-algebraic & representation-theoretic (Part II)

- [ ] C*-algebras; states as positive normalized functionals
- [ ] GNS construction
- [ ] Gelfand-Naimark
- [ ] Continuous functional calculus (as far as Mathlib reaches)
- [ ] Symmetry as representation theory: SU(2), SO(3)
- [ ] Spin; irreducible representations of SU(2)

## Tier 3 - Geometry of quantum theory (Part III)

- [ ] (B) Projective Hilbert space; rays as physical states
- [ ] (B) Fubini-Study metric
- [ ] (B) Berry / geometric phase; Simon's holonomy interpretation
- [ ] (B) Symplectic / Kähler structure of quantum state space
- [ ] (B) First look at geometric quantization

## Tier 4 - Frontier & categorical capstone (Part IV)

- [ ] (F) Unbounded operators; domains
- [ ] (F) Symmetric vs. self-adjoint; deficiency indices
- [ ] (F) The unbounded self-adjoint spectral theorem - **not yet in Mathlib**
- [ ] (F) Position & momentum; canonical commutation relations (CCR)
- [ ] (F) Stone's theorem (unbounded); Schrödinger dynamics
- [ ] Categorical / diagrammatic QM: dagger-compact categories, string diagrams

## Tier 5+ - Expansion frontier (open-ended)

### Quantum information & computation (mostly finite-dim ⇒ highly verifiable)

- [ ] Quantum channels (CPTP maps); Choi-Jamiołkowski
- [ ] Entropy (von Neumann, relative); data processing
- [ ] Quantum error correction; stabilizer codes
- [ ] Quantum algorithms (Deutsch-Jozsa, Grover, phase estimation)

### Foundations

- [ ] Measurement problem; decoherence
- [ ] Bell / CHSH inequalities and their violation
- [ ] Contextuality: Gleason, Kochen-Specker
- [ ] Interpretations (treated fairly, informal/§2c remarks)

### Mathematical deepening

- [ ] (F) Full spectral theory of unbounded operators
- [ ] (F) Schrödinger operators; essential self-adjointness
- [ ] (F) Rigged Hilbert spaces
- [ ] (F) Stone's theorem in generality
- [ ] von Neumann algebra structure; types

### Symmetry & quantization

- [ ] (B) Coadjoint orbits; the orbit method
- [ ] (B) Deformation vs. geometric quantization

### Toward QFT (long horizon, rigor hardest)

- [ ] (F/B) Canonical quantization of free fields
- [ ] (F/B) Second quantization; Fock space
- [ ] (F/B) An honest look at AQFT (Haag-Kastler axioms)

---

## Coverage-ambition note (prompt.md §13, deferred)

How far into Tier 5+ to formally commit (cap at NRQM + quantum information, or
explicitly aim toward QFT) is an open `TODO(author)` decision. The map above lists
the full ambition as *stubs* so it is visible, without committing the timeline.
The reading-map "physicist's track" cross-reference question (§13) is likewise
deferred; `references/reading-map.md` currently stays math-first.
