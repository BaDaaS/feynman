<!-- SPDX-License-Identifier: CC-BY-SA-4.0 -->

# Quantum Mechanics, Verified: a math-first course

This is the course built on top of the verified book. It is a complete,
route-organized curriculum that takes a mathematically mature reader from the
linear algebra of a single qubit to the operator-algebraic, geometric, and
categorical formulations of quantum theory, with the mathematics
machine-checked in Lean 4 wherever it can be.

It is designed to be taught, self-studied, and turned into video lectures. Every
module lists what it develops, the historical origin of the idea, the exact Lean
declaration that anchors it (or a frontier flag if none exists yet), the
conceptual questions it raises, curated resources, and exercises.

- Course home and map: this file.
- Historical arc (the story, dated and sourced): [`history.md`](history.md).
- Detailed module-by-module syllabus: [`syllabus.md`](syllabus.md).
- Foundations and interpretation track: [`foundations.md`](foundations.md).
- Reading list (every link verified): [`../references/reading-map.md`](../references/reading-map.md).

## Who this is for

The primary reader is a mathematician with strong algebra and geometry and a
formal-methods sensibility, who has seen quantum mechanics before and wants the
real structure with proofs. The course favors the operator-algebraic,
representation-theoretic, geometric, and categorical routes over the physicist's
PDE-first route. Physical intuition is welcome; it never replaces a proof.

Assumed background: linear algebra over a field; basic group theory and
point-set topology; comfort with proofs. Helpful but not required: measure theory
and functional analysis (developed as needed), Lie groups, category theory
basics. No prior Lean is assumed; the formal layer is readable as ordinary
mathematics and the interactive book renders proof states.

## The defining discipline

Every mathematical claim in the course is exactly one of three things
(prompt invariant 2):

1. a fully proven Lean theorem with no `sorry`;
2. a theorem flagged as *frontier* - true, but not yet formalizable because the
   prerequisite is not in Mathlib - tracked as a blueprint node; or
3. a clearly labeled informal or physical remark that makes no formal claim.

The verified/frontier line follows the mathematics: finite-dimensional quantum
mechanics is fully proven; unbounded operators and the analysis of Schrodinger
dynamics are the honest frontier. Watching that line recede as Mathlib grows is
part of the pedagogy, not an embarrassment.

## The four layers (how each concept is taught)

For every concept the course couples four artifacts that cannot contradict each
other:

```
  formal  -->  book  -->  video
    |           |           |
    +-----> provenance <----+
  (Lean decl) (Verso prose  (Manim scene   (sources.md +
   in Quantum   + ASCII       + narration     bibliography)
    Book/)      diagram)       script)
```

- Formal: a Lean definition/theorem in `QuantumBook/`, proven or frontier-flagged.
- Book: a Verso chapter that references the Lean declaration by name (so prose
  cannot drift from the proof) plus an ASCII abstraction diagram.
- Video: a ManimCE scene faithful to the formal object, with a narration script.
- Provenance: the historical origin and a rigorous modern treatment, recorded in
  `references/sources.md` and `references/bibliography.bib`.

## The module map

Modules are grouped into parts. Each `Mx.y` is one teachable unit (roughly one
lecture). Status tags: `[proven]` fully formalized; `[targeted]` formalization
planned/partial; `[frontier]` legitimately `sorry`-flagged; `[book]`
prose/geometry-first. See `syllabus.md` for the detail and `../SCOPE.md` for the
breadth ledger.

- Part 0 - Substrate (mathematical foundations) `[proven]`
  M0.1 Complex inner-product spaces . M0.2 Operators, adjoints, self-adjointness .
  M0.3 The finite-dim spectral theorem . M0.4 Tensor products .
  M0.5 Positive operators, trace, density operators
- Part I - Finite-dimensional quantum mechanics (the postulates) `[proven]`
  M1.1 States . M1.2 Observables . M1.3 The Born rule . M1.4 The qubit and Bloch
  sphere . M1.5 Unitary dynamics . M1.6 Composite systems and entanglement .
  M1.7 Mixed states, partial trace, no-cloning
- Part II - Operator-algebraic view `[targeted]`
  M2.1 C*-algebras and states . M2.2 GNS . M2.3 Gelfand-Naimark .
  M2.4 Continuous functional calculus . M2.5 Symmetry: SU(2), SO(3), spin
- Part III - Geometry of quantum theory `[book/targeted]`
  M3.1 Projective Hilbert space . M3.2 Fubini-Study metric .
  M3.3 Berry/geometric phase . M3.4 Symplectic/Kahler structure .
  M3.5 Geometric quantization (survey)
- Part IV - Frontier and categorical capstone `[frontier/book]`
  M4.1 Unbounded operators . M4.2 Symmetric vs self-adjoint .
  M4.3 The unbounded spectral theorem `[frontier]` . M4.4 Position, momentum, CCR .
  M4.5 Stone's theorem and Schrodinger dynamics `[frontier]` .
  M4.6 Categorical/diagrammatic QM (capstone)
- Part V - Foundations and quantum information (spiral electives)
  M5.1 Bell/CHSH . M5.2 Gleason, Kochen-Specker, contextuality .
  M5.3 Measurement, decoherence, interpretations .
  M6.x Channels, entropy, error correction, algorithms

## Dependency graph (prerequisite order, ASCII)

Arrows point from prerequisite to dependent. `~~>` marks a soft/conceptual
dependency; `-->` a hard mathematical one.

```
  M0.1 --> M0.2 --> M0.3 --> M0.5 --> M1.1 --> M1.2 --> M1.3
                       |        |        |        |        |
                       |        |        v        v        v
            M0.4 ------+--------+----> M1.6 <--- M1.4     M5.1
              |                         |          |        ^
              v                         v          v        |
            M1.7 <------------------- M1.5       (Bloch)     |
                                        |                    |
                       M2.1 --> M2.2 --> M2.3                |
                          \       \                          |
                           \       v                         |
                            +--> M2.4 --> M2.5 ~~> M3.3       |
                                                   ^         |
              M3.1 --> M3.2 -----------------------+         |
                 |                                           |
                 v                                           |
              M3.4 --> M3.5                                  |
                                                             |
              M0.2 --> M4.1 --> M4.2 --> M4.3 --> M4.4 --> M4.5
                                            ^                
              M1.6 ~~> M4.6 (categorical capstone) <~~ M2.x  
              M1.2 --> M5.2      M1.x --> M5.3      M1.6 --> M6.x
```

## Course tracks (pick your route)

The material supports several routes through the same graph:

- The verified core (a releasable "verified QM primer"): Part 0 + Part I.
- The algebraist's route: Part 0, Part I (light), Part II, then M4.6.
- The geometer's route: Part 0, Part I (light), Part III, geometric quantization.
- The foundations route: Part 0-I, then Part V (Bell, Kochen-Specker,
  measurement), with M1.6 and M1.2 as the technical spine.
- The quantum-information route: Part 0-I, then M6.x (channels, entropy, codes,
  algorithms) - almost entirely finite-dimensional and therefore highly
  verifiable.

## Assessment and exercises

Each module in `syllabus.md` ends with exercises in three registers:

- Formal exercises: complete or extend a Lean proof (the book renders the goal
  state, so these are checkable). Difficulty is bounded by the verified/frontier
  line.
- Analytic exercises: pencil-and-paper problems in the style of the cited texts.
- Conceptual exercises: foundational questions with no single right answer,
  pointing at `foundations.md` and the Stanford Encyclopedia entries.

A capstone project: take a concept not yet in the book, carry it through all four
layers (Lean + Verso + Manim + provenance), and open a pull request. The
`add-concept` skill in `.claude/skills/` scaffolds exactly this workflow.

## How to run the artifacts

See the top-level [`README.md`](../README.md): `make all` rebuilds the proofs,
the interactive HTML/PDF book, the blueprint dependency graph, and the videos;
`make check` runs the verification gates. The interactive book is the primary
teaching surface; the blueprint graph shows, at a glance, what is proven and what
is frontier.
