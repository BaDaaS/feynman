# Project Brief — A Verified, Illustrated Book on Quantum Mechanics
## (prompt for Claude Code)

> This is a living project constitution, not a one-shot task. Read it fully before
> acting. It defines *what* we are building and, more importantly, the *invariants*
> you must preserve across every session. When something is ambiguous, prefer the
> invariants in §2 over local convenience. Sections marked `TODO(author)` are
> decisions I (the author) still need to make — ask me or leave a clearly flagged
> placeholder; never silently guess them.

---

## 1. Mission & reader

Build, incrementally over a long horizon, a **book on quantum mechanics in which the
mathematics is machine-verified in Lean 4 (against Mathlib)**, the prose lives beside
the code, and structural abstractions are drawn in ASCII.

The intended reader (and primary author) is a mathematician with a strong **algebra
and geometry** background and a **formal-methods / programming-languages** sensibility,
who has seen quantum mechanics before. So: favor the operator-algebraic, representation-
theoretic, geometric, and categorical routes over the physicist's PDE-first route.
Physical intuition is welcome but is never a substitute for a proof.

---

## 2. Non-negotiable principles (invariants)

1. **Nothing is asserted that could be proven and isn't.** Every mathematical claim in
   the book is exactly one of:
   - (a) a fully proven Lean theorem with **no `sorry`**, or
   - (b) a stated theorem carrying a `sorry` that is **explicitly flagged as frontier**
     (not yet available in Mathlib) and tracked as a node in the blueprint, or
   - (c) a clearly-marked informal / physical remark that makes **no formal claim**.
   There is no fourth category. Never hide a `sorry`.

2. **The verified/frontier line follows the mathematics.** Finite-dimensional results
   (qubits, spin systems, finite-dim spectral theorem, quantum information) **must be
   fully proven** — Mathlib supports them (Hermitian-matrix spectral theorem, tensor
   products, and the continuous functional calculus are all present). Infinite-
   dimensional / unbounded results (position & momentum, canonical commutation
   relations, the unbounded self-adjoint spectral theorem, Schrödinger dynamics) may be
   `sorry`-stated as frontier nodes, because the unbounded spectral theorem is **not yet
   in Mathlib**. Treat that boundary as a first-class pedagogical feature, not an
   embarrassment.

3. **One source of truth, its projections.** Every concept is anchored to a named Lean
   declaration and projected into tightly-coupled layers (see §5). The prose and the
   ASCII diagram must never contradict the Lean object they depict.

4. **Reproducible from clean.** Pin the Lean toolchain, the exact Mathlib revision, and
   the Verso version. A single documented command must rebuild the whole artifact
   (book HTML/PDF) from a clean checkout.

5. **Small verified increments.** Never advance to a new concept while the current one
   fails to build. "Done" for a unit means: Lean compiles with no *unexpected* `sorry`,
   the book chapter renders, and any ASCII assets referenced actually exist.

6. **Prefer Mathlib; cite what you use.** Before proving anything from scratch, search
   Mathlib for it. When you use a Mathlib result, reference the exact declaration name in
   a comment so the dependency is auditable.

7. **Sources are tracked, honest, and lawful.** Every substantive result carries
   *provenance* — who first proved/stated it and where — and every chapter ends with a
   curated "Sources & further reading" block (see §10). Two hard rules: **never fabricate
   a citation, URL, DOI, or arXiv ID** — resolve and verify each link (prefer
   open-access, canonical, and archived copies), and if you cannot verify it, mark it
   `[unverified]` rather than inventing it. And **respect copyright**: cite, link, and
   paraphrase; do not reproduce substantial copyrighted text (proofs, long passages,
   figures) into the book — restate results in our own words with attribution.

---

## 3. Repository architecture

A single Lake-managed monorepo. Proposed layout (adapt names, keep the separation):

```
quantum-book/
  lean-toolchain                 # pinned Lean version (single source of the version)
  lakefile.toml                  # deps: mathlib, verso
  QuantumBook/                   # THE LIBRARY: defs + theorems (the source of truth)
    Foundations/                 # finite-dim Hilbert spaces, adjoints, spectral thm
    FiniteDim/                   # qubit, observables, Born rule, tensor, entanglement
    Algebraic/                   # C*-algebras, states, GNS, representations, spin
    Geometry/                    # projective space, Berry phase, symplectic/Kähler
    Frontier/                    # unbounded operators, CCR, Schrödinger (sorry-flagged)
    Categorical/                 # monoidal / diagrammatic QM (capstone)
  book/                          # THE BOOK: Verso sources (.lean files = chapters)
    Chapters/Ch00_Substrate.lean # prose + ASCII, importing QuantumBook decls by name
    ...
  blueprint/                     # leanblueprint: LaTeX + dependency graph of results
  references/                    # THE SCHOLARSHIP LAYER (see §10)
    bibliography.bib             # BibTeX: every cited work, with stable IDs (DOI/arXiv)
    sources.md                   # per-concept provenance map: Lean decl -> sources
    reading-map.md               # curated, route-organized reading list (the seed §10)
  tools/                         # build + CI scripts
  build/                         # GENERATED: html/pdf book (git-ignored)
  DECISIONS.md                   # ADR-style log of design decisions
  PROGRESS.md                    # human-readable status mirror of the blueprint graph
  SCOPE.md                       # the whole-territory coverage map + status (see §11)
```

Key rule: **`QuantumBook/` is the truth; `book/` narrates it.**
The book chapters import and reference real declarations from `QuantumBook/` — they do
not restate mathematics in prose that has no formal referent.

---

## 4. Authoring stack

- **Lean 4 + Mathlib** — the verified mathematics.
- **Verso** (`leanprover/verso`) — the book. Chapters are Lean files; every code example
  is type-checked and rendered to interactive HTML with hovers, go-to-definition, and
  **rendered intermediate proof states**. This is why the book cannot drift from the
  proofs. (Fallback if Verso proves too immature for a given need: Alectryon + LeanInk,
  which renders proof states into reStructuredText/Markdown. Prefer Verso.)
- **leanblueprint** — the dependency graph tracking which results are proven vs.
  frontier. This *is* the project's map; keep it current.

Because these tools move, **verify current versions at setup and pin them**; read each
tool's current README rather than relying on memory. Record the pinned versions in
`DECISIONS.md`.

---

## 5. The three-layer discipline (per concept)

For each concept, produce three coupled layers, in this order:

1. **Formal layer** — the Lean definition/theorem in `QuantumBook/`. Proven, or
   frontier-flagged per §2.
2. **Book layer** — in the corresponding Verso chapter: prose explaining it, referencing
   the Lean declaration by name, plus an **ASCII abstraction diagram** (§6) when the
   concept is structural (a commuting square, a tensor factorization, an algebra
   inclusion, a functor).
3. **Provenance** — record, in `references/sources.md`, the source(s) for the result: the
   historical origin where relevant, plus at least one rigorous treatment we're following.
   Add the entries to `bibliography.bib`. This is lightweight per concept but compounds
   into the scholarship layer (§10).

A concept is not "complete" until all three exist and agree, *or* it is explicitly logged
as book-only / frontier in `PROGRESS.md`.

---

## 6. ASCII house style

ASCII diagrams are for **structural abstraction** — the shapes an algebraist/geometer
thinks in — not decoration. Rules:

- Use only portable ASCII (`-`, `|`, `+`, `>`, `v`, `^`, `/`, `\`) — no box-drawing
  Unicode, so the diagrams survive plaintext and code comments alike.
- Every diagram depicts a **named formal referent**; note it beneath the diagram
  (`-- depicts: QuantumBook.FiniteDim.born_rule`).
- Consistent arrow vocabulary: `-->` map, `==>` isomorphism, `>->` inclusion/mono,
  `-->>` surjection, `~~>` "informal/physical, not proven".

Example house style (a measurement as a commuting square):

```
        rho
   S  --------> D(H)          -- state prepares a density operator
   |             |
   | M           | Tr(P . -)  -- projective measurement / Born rule
   v             v
  Out --------> [0,1]         -- outcome probabilities
        p
   -- depicts: QuantumBook.FiniteDim.born_rule
```

---

## 7. (reserved)

The animation and video layer (ManimCE scenes, narration scripts, rendered reels)
was removed from the project. This section number is retained so the cross-references
to later sections (§8–§13) elsewhere in the repository stay valid.

---

## 8. Book / curriculum structure (the parts)

Follow this spine (it encodes the reader's taste and the verified/frontier line). Each
part is a section of the book and a subdirectory of `QuantumBook/`.

- **Part 0 — Substrate.** Finite-dim complex Hilbert spaces, adjoints, tensor products,
  the spectral theorem for Hermitian operators as the "baby case." Fully verified.
- **Part I — Finite-dimensional QM.** Qubit, observables as self-adjoint operators, Born
  rule, composite systems, entanglement, density matrices, unitary evolution. Fully
  verified. (Consult the Lean-QuantumInfo library for prior art and conventions.)
- **Part II — Operator-algebraic view.** C*-algebras, states as positive functionals,
  GNS, Gelfand–Naimark; symmetry as representation theory (SU(2)/SO(3), spin). Verified
  where Mathlib's continuous functional calculus reaches.
- **Part III — Geometry of quantum theory.** Projective Hilbert space, Berry/geometric
  phase, symplectic/Kähler structure, a look at geometric quantization. Mostly
  book-level with targeted formalization.
- **Part IV — Frontier + categorical capstone.** Unbounded operators, CCR, self-adjoint
  vs. symmetric, the unbounded spectral theorem (frontier-flagged); close with
  categorical / diagrammatic QM. Frontier results are `sorry`-nodes with blueprint
  entries describing what Mathlib would need.

---

## 9. How you (Claude Code) should work — the loop

For each work session, operate in this loop and keep it tight:

1. **Orient.** Read `PROGRESS.md` and the blueprint to see the frontier of what's done.
   Pick the smallest next concept.
2. **Formalize.** Search Mathlib first. Write the Lean declaration; prove it, or
   frontier-flag it per §2. Run `lake build` — it must pass.
3. **Narrate + diagram.** Add the book prose in the Verso chapter, the ASCII abstraction,
   and the reference to the Lean name. Build the book; it must render.
4. **Record.** Update `PROGRESS.md`, add provenance to `references/sources.md` and any new
   works to `bibliography.bib` (verify every link), tick the topic in `SCOPE.md`, and if a
   design choice was made, append an ADR entry to `DECISIONS.md`. Update the blueprint graph.
5. **Stop cleanly.** Never end a session with a build broken or a `sorry` undocumented.
   Summarize what changed and what the next smallest step is.

Additional standing rules:
- When you hit something not in Mathlib, **do not fabricate a lemma name**. State the
  gap, frontier-flag it, and note what would be required.
- Keep proofs readable and idiomatic; prefer named Mathlib lemmas over opaque
  automation where it aids the reader's understanding (this is a book).
- Ask me before introducing a new heavyweight dependency or changing the architecture
  in §3.

---

## 10. The sources & scholarship layer

This book should double as an annotated map into the literature, tuned to a math-first
reader. Mechanics:

- **Provenance per result** (from §5.3) and a **"Sources & further reading" block ending
  every chapter**, curated and annotated (one line on *why* each source is worth the
  reader's time and which route it serves), not a raw dump.
- **`references/reading-map.md`** holds the master list, organized by *route* rather than
  alphabetically, so the reader can follow their taste. Seed it with the list below and
  grow it as chapters are written.
- **Link discipline** (invariant 7): resolve every reference to a verified, canonical, or
  archived URL / DOI / arXiv ID; prefer open-access copies; mark anything unverifiable
  `[unverified]`. Re-check liveness periodically (link rot is real over a multi-year
  project). Do not paste copyrighted text into the book.

**Seed reading map** (verify all links before use; `[free]` = openly available):

- *Historical / primary sources* — trace the ideas to their origin: Heisenberg (1925,
  matrix mechanics); Born–Heisenberg–Jordan (1926, the "three-man paper"); Schrödinger
  (1926, wave mechanics); Born (1926, the probability rule); Dirac, *The Principles of
  Quantum Mechanics* (1930; 4th ed. 1958); von Neumann, *Mathematical Foundations of
  Quantum Mechanics* (1932; Princeton 1955; new Wheeler translation 2018); Wigner (1931,
  symmetry theorem); EPR (1935) and Schrödinger's entanglement/"cat" (1935); Bell (1964)
  and CHSH (1969); Gleason (1957); Kochen–Specker (1967); Aharonov–Bohm (1959); Berry
  (1984) and Simon (1983) on geometric phase.
- *Rigorous mathematical QM (the reader's home)* — Hall, *Quantum Theory for
  Mathematicians* (GTM 267, 2013); Takhtajan, *Quantum Mechanics for Mathematicians*
  (GTM 95, 2008); Woit, *Quantum Theory, Groups and Representations* (Springer 2017), free
  author's copy at `math.columbia.edu/~woit/QM/qmbook.pdf` `[free]`; Reed & Simon,
  *Methods of Modern Mathematical Physics* I–IV; Moretti, *Spectral Theory and Quantum
  Mechanics*; Teschl, *Mathematical Methods in Quantum Mechanics* (AMS GSM 157) `[free]`;
  Strocchi, *An Introduction to the Mathematical Structure of QM*; Landsman, *Foundations
  of Quantum Theory* (Springer 2017, open access) `[free]`.
- *Operator algebras / algebraic QM* — Bratteli & Robinson, *Operator Algebras and
  Quantum Statistical Mechanics* I–II; Haag, *Local Quantum Physics*; Emch, *Algebraic
  Methods in Statistical Mechanics and QFT*.
- *Symmetry & representation theory* — Hall, *Lie Groups, Lie Algebras, and
  Representations* (GTM 222); Sternberg, *Group Theory and Physics*; Woit (above).
- *Geometry & quantization* — Woodhouse, *Geometric Quantization*; Bates & Weinstein,
  *Lectures on the Geometry of Quantization* `[free]`; Guillemin & Sternberg, *Symplectic
  Techniques in Physics*; Kirillov, *Lectures on the Orbit Method*.
- *Categorical / diagrammatic QM (feeds the PL/formal-methods side)* — Abramsky & Coecke,
  "A categorical semantics of quantum protocols" (LiCS 2004; arXiv `quant-ph/0402130`)
  `[free]`; Coecke & Kissinger, *Picturing Quantum Processes* (2017); Heunen & Vicary,
  *Categories for Quantum Theory* (2019); Baez & Stay, "Physics, Topology, Logic and
  Computation: A Rosetta Stone" `[free]`.
- *Quantum information (finite-dim, fully verifiable)* — Nielsen & Chuang, *Quantum
  Computation and Quantum Information*; Watrous, *The Theory of Quantum Information*
  `[free]`; Wilde, *Quantum Information Theory* (arXiv) `[free]`; Preskill, Caltech Ph219
  notes `[free]`.
- *Formalization prior art* — the Lean-QuantumInfo library; Dedecker & Loreaux, "The
  continuous functional calculus in Lean" (arXiv `2501.15639`) `[free]`; Mathlib's
  analysis/spectral-theory files; the leanblueprint methodology.
- *Courses & video* `[free]` — MIT OCW **8.04 / 8.05 / 8.06** (Zwiebach et al.),
  `ocw.mit.edu/courses/8-04-quantum-physics-i-spring-2013/` and the 8.05/8.06 sequel
  pages; Frederic Schuller's *Lectures on Quantum Theory* and *Geometric Anatomy of
  Theoretical Physics* (YouTube) — excellent math-first; 3Blue1Brown for geometric
  intuition. Stanford Encyclopedia of Philosophy for careful
  foundational entries (measurement, Bell's theorem, interpretations).

---

## 11. Long-term coverage plan (the spiral)

This is a multi-year project; plan for breadth over time without ever leaving a broken
artifact. Two organizing ideas:

**(a) Broad skeleton first, then deepen (iterative deepening).** Early on, lay down
`SCOPE.md`: a low-resolution map of the *entire* intended territory (below), with every
topic as a stub — a blueprint node and a one-line status. This makes "cover as much as
possible" visible and navigable from day one; subsequent passes raise the resolution.

**(b) Always shippable.** Work in *tiers*. At the end of each tier the whole artifact —
book and proofs — is in a coherent, green (for its scope) state that could be
released as-is. No tier begins until the previous one is clean.

**Tiers (ordered by dependency, not calendar):**

- **Tier 0 — Vertical slice.** The end-to-end pipeline on one concept (see §12).
- **Tier 1 — Verified finite-dimensional core.** Parts 0–I complete across all three
  layers, fully proven. This alone is a genuine, releasable "verified QM primer."
- **Tier 2 — Algebraic & representation-theoretic layer.** Part II. Lean-QuantumInfo
  conventions reused; formalize as far as the continuous functional calculus reaches.
- **Tier 3 — Geometry.** Part III. Projective space, geometric phase, symplectic/Kähler,
  first look at geometric quantization. Book-strong, formalization targeted.
- **Tier 4 — Frontier & categorical capstone.** Part IV. Unbounded operators and the
  spectral theorem as tracked `sorry`-nodes; categorical QM as the unifying finale.
- **Tier 5+ — Expansion frontier (open-ended).** Grow `SCOPE.md` outward as time and
  Mathlib allow, each sub-topic entering the same three-layer discipline:
  - deeper **quantum information & computation** (channels, entropy, error correction,
    algorithms) — mostly finite-dim, so highly verifiable;
  - **foundations**: measurement problem, decoherence, Bell/CHSH and contextuality
    (Gleason, Kochen–Specker), interpretations — treated fairly and carefully;
  - **mathematical deepening**: full spectral theory of unbounded operators, Schrödinger
    operators and self-adjointness, rigged Hilbert spaces, Stone's theorem, C\*- and von
    Neumann-algebra structure — advancing the verified/frontier line as Mathlib grows;
  - **symmetry & quantization**: coadjoint orbits, the orbit method, deformation vs.
    geometric quantization;
  - **toward QFT** (long horizon): canonical quantization of free fields, second
    quantization, Fock space, and an honest look at AQFT — clearly flagged as where rigor
    and formalization are hardest.

**A standing "re-verification" duty.** Because Mathlib and the toolchain move, schedule
periodic passes that bump pinned versions, re-run the full build, and — importantly —
*retire `sorry`-nodes that Mathlib has since made provable*, migrating them from frontier
to fully-verified. The frontier should recede over the life of the project; make that
visible in `PROGRESS.md`.

---

## 12. First milestone — the vertical slice

Before scaling, build **one thin end-to-end slice** proving the whole pipeline works:

- Repo skeleton per §3, with toolchain/Mathlib/Verso pinned and a working build
  command.
- **Part 0, one concept** — e.g. the finite-dim spectral theorem for a Hermitian
  operator — carried through **all three layers**: proven in `QuantumBook/Foundations/`,
  narrated in `book/Chapters/Ch00_Substrate.lean` with one ASCII diagram, and its
  provenance recorded in `references/`.
- `PROGRESS.md`, `DECISIONS.md`, and the blueprint initialized.
- A short `README` explaining the layout and the rebuild command.

Deliver that slice, then stop and report before continuing to Part I.

---

## 13. `TODO(author)` — decisions to confirm before/at kickoff

- **Primary book output.** Interactive HTML (Verso's strength) as primary, PDF as
  secondary? Or PDF-first?
- **Blueprint depth.** Full leanblueprint LaTeX + dependency graph from day one, or a
  lightweight `PROGRESS.md` first with the blueprint added at Part I?
- **Repo/CI host & license.** Where it lives and under what license.
- **Citation style.** BibTeX + a chosen style (e.g. author–year), and whether to render a
  full bibliography page in the book.
- **Reading-map scope.** Stay strictly math-first, or also carry a parallel physicist's
  track (Griffiths / Sakurai / Shankar / Zwiebach) for cross-reference?
- **Coverage ambition.** How far into Tier 5+ to commit now — cap at NRQM + quantum
  information, or explicitly aim toward QFT over the long run?
- **Other fields to add.** Beyond quantum mechanics, which further areas of physics to
  bring into the same verified-and-illustrated treatment (as companion tracks or sibling
  books), and in what order. Candidate fields:
  - special relativity;
  - general relativity;
  - classical mechanics (Lagrangian and Hamiltonian);
  - classical electromagnetism and classical field theory;
  - thermodynamics and statistical mechanics;
  - relativistic quantum mechanics (the Dirac equation), as the bridge to fields;
  - quantum field theory, gauge theory, and the Standard Model;
  - condensed matter and many-body physics;
  - cosmology.
  This is a list of physical theories to cover, not of mathematical prerequisites.
