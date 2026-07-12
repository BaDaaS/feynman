<!-- SPDX-License-Identifier: CC-BY-SA-4.0 -->

# Sources directory: where the field lives

A curated, verified directory of the quantum-mechanics *ecosystem* - not the
textbooks and courses (those are in [`reading-map.md`](reading-map.md)), but the
places the living field is written, recorded, argued, and formalized: journals and
preprint servers, the canonical papers, video lecture courses, YouTube channels,
blogs, individual researchers, and community/formalization resources.

Every link is verified per invariant 7 (resolve, do not fabricate). Items that
could not be confirmed are marked `[unverified]`; YouTube items blocked by a
consent-wall from automated checks are marked `[partially verified]`. Liveness
rots; re-check periodically. Curation is math-first: it favors the rigorous,
foundational, and formal end of the field.

Bibliographic entries for the papers/books cited here live in
[`bibliography.bib`](bibliography.bib).

---

## 1. Foundational / canonical papers

The primary-source canon, in rough historical order. Full bibliographic data
(verified DOIs) is in `bibliography.bib` under the cited key; the historical
narrative is in [`../course/history.md`](../course/history.md).

- **Matrix mechanics** - Heisenberg (1925) `[Heisenberg1925]`; Born, Heisenberg &
  Jordan, the "three-man paper" (1926) `[BornHeisenbergJordan1926]`. The
  noncommutative algebra of observables and the canonical commutation relation.
- **Wave mechanics** - Schrodinger (1926) `[Schrodinger1926]`. Quantization as an
  eigenvalue problem; the analyst's entry.
- **The probability rule** - Born (1926) `[Born1926]`. The interpretation of the
  amplitude; the one probabilistic postulate.
- **Axiomatization** - Dirac, _Principles_ (1930) `[Dirac1958]`; von Neumann,
  _Mathematical Foundations_ (1932) `[VonNeumann2018]`. Transformation theory and
  the Hilbert-space formulation (including the unbounded spectral theorem - still
  our Part IV frontier).
- **Symmetry** - Wigner (1931) `[Wigner1931]`. Symmetries as unitary/antiunitary
  representations; the origin of the representation-theoretic view.
- **Entanglement and completeness** - Einstein, Podolsky & Rosen (1935)
  `[EPR1935]`; Schrodinger (1935) `[Schrodinger1935]`, which names entanglement.
- **No-go theorems and nonlocality** - Gleason (1957) `[Gleason1957]` (the Born
  rule from projections); Bell (1964) `[Bell1964]` `[free]` and CHSH (1969)
  `[CHSH1969]` (the testable inequality); Kochen & Specker (1967)
  `[KochenSpecker1967]` (contextuality).
- **Geometry and phase** - Aharonov & Bohm (1959) `[AharonovBohm1959]`; Berry
  (1984) `[Berry1984]` and Simon (1983) `[Simon1983]` (the geometric phase as
  holonomy).
- **Categorical quantum mechanics** - Abramsky & Coecke (2004)
  `[AbramskyCoecke2004]` `[free]`; Baez & Stay, "Rosetta Stone" (2011)
  `[BaezStay2011]` `[free]`.
- **Formalization** - Dedecker & Loreaux, "The continuous functional calculus in
  Lean" (2025) `[DedeckerLoreaux2025]` `[free]`. The nearest prior art to this
  project's spectral-theoretic layer.

---

## 2. Journals, publishers, and preprint servers

- arXiv (quant-ph and math-ph) -- [arxiv.org](https://arxiv.org/) /
  [quant-ph recent](https://arxiv.org/list/quant-ph/recent) -- Free preprint
  server; quant-ph is the primary firehose for new quantum results and math-ph is
  where operator-algebra, spectral-theory, and rigorous-QM papers land.
- SciRate -- [scirate.com](https://scirate.com/) -- Community ranking layer over
  arXiv quant-ph; a fast way to see which recent preprints the quantum community
  is reading.
- Quantum -- [quantum-journal.org](https://quantum-journal.org/) -- Non-profit,
  fully open-access, community-run journal for quantum science; rigorous and free
  to read, so no paywall stands between you and the literature.
- PRX Quantum -- [journals.aps.org/prxquantum](https://journals.aps.org/prxquantum/)
  -- APS open-access (CC-BY) flagship for quantum information science; selective,
  free to read.
- Physical Review A -- [journals.aps.org/pra](https://journals.aps.org/pra/) --
  APS journal of record for atomic, molecular, optical, and quantum science
  (paywalled); where much foundational QM work is archived.
- Physical Review Letters -- [journals.aps.org/prl](https://journals.aps.org/prl/)
  -- APS flagship letters journal; short high-impact results, including landmark
  QM and quantum-information papers. Paywalled.
- Reviews of Modern Physics -- [journals.aps.org/rmp](https://journals.aps.org/rmp/)
  -- APS's authoritative long-form review venue since 1929; the best entry point
  for a rigorous survey before the primary literature. Paywalled.
- Communications in Mathematical Physics --
  [link.springer.com/journal/220](https://link.springer.com/journal/220) --
  Springer; the leading venue for mathematically rigorous physics (constructive
  QFT, operator algebras, rigorous statistical mechanics). Paywalled/hybrid.
- Letters in Mathematical Physics --
  [link.springer.com/journal/11005](https://link.springer.com/journal/11005) --
  Springer; shorter rigorous results (quantum groups, deformation quantization,
  integrable systems). Paywalled/hybrid.
- Journal of Mathematical Physics --
  [pubs.aip.org/aip/jmp](https://pubs.aip.org/aip/jmp) -- AIP; the original
  mathematical-physics journal (since 1960), broad coverage of the mathematical
  methods underpinning QM. Paywalled (green OA self-archiving).
- Annales Henri Poincare --
  [link.springer.com/journal/23](https://link.springer.com/journal/23) --
  Springer; rigorous theoretical and mathematical physics (spectral theory,
  many-body QM, QFT). Paywalled/hybrid.
- Reviews in Mathematical Physics --
  [worldscientific.com/worldscinet/rmp](https://www.worldscientific.com/worldscinet/rmp)
  -- World Scientific; review-style mathematical physics (spectral theory,
  operator algebras, index theory). Paywalled.
- Foundations of Physics --
  [link.springer.com/journal/10701](https://link.springer.com/journal/10701) --
  Springer; conceptual and foundational QM (measurement, interpretations, quantum
  logic). Paywalled/hybrid.
- Nature Physics -- [nature.com/nphys](https://www.nature.com/nphys/) and Nature
  [nature.com](https://www.nature.com/) -- Springer Nature; where the
  highest-profile QM / quantum-information breakthroughs appear. Paywalled.
- INSPIRE-HEP -- [inspirehep.net](https://inspirehep.net/) -- Free HEP-focused
  literature database with excellent citation graphs and BibTeX export; strong for
  the field-theory and mathematical-physics side of QM.
- zbMATH Open -- [zbmath.org](https://zbmath.org/) -- Free (open since 2021)
  reviewing database for the mathematics literature with MSC classification; ideal
  for tracking the math-ph and functional-analysis results a rigorous QM book
  cites.
- Semantic Scholar -- [semanticscholar.org](https://www.semanticscholar.org/) --
  Free AI-assisted search with citation context and a clean API; good for tracing
  how a QM result propagated.
- Google Scholar -- [scholar.google.com](https://scholar.google.com/) -- Free
  broad academic search with "cited by" and version links; the widest net for a
  specific theorem, review, or thesis.
- Perimeter Institute PIRSA -- [pirsa.org](https://pirsa.org/) -- Free archive of
  recorded seminars, courses, and lectures in quantum foundations, quantum
  information, and quantum gravity; primary-source talks by working researchers.

## 3. Video lecture courses (rigorous / university)

- MIT OCW 8.04 / 8.05 / 8.06 (Zwiebach et al.) --
  [8.04](https://ocw.mit.edu/courses/8-04-quantum-physics-i-spring-2016/) /
  [8.05](https://ocw.mit.edu/courses/8-05-quantum-physics-ii-fall-2013/) /
  [8.06](https://ocw.mit.edu/courses/8-06-quantum-physics-iii-spring-2018/) -- The
  three-semester MIT sequence; 8.05 is the linear-algebra / Dirac-notation core, the
  central math-first route.
- MITx 8.05x / 8.06x (graded online versions) --
  [8.05x](https://mitxonline.mit.edu/courses/course-v1:MITxT+8.05x/) /
  [8.06x](https://mitxonline.mit.edu/courses/course-v1:MITxT+8.06x/) -- Self-paced
  graded counterparts to 8.05/8.06.
- Frederic Schuller, "Lectures on Quantum Theory" (playlist) --
  [YouTube](https://www.youtube.com/playlist?list=PLPH7f_7ZlzxQVx5jRjbfRGEzWY_upS5K6)
  -- `[partially verified]` 21 lectures building QM from Hilbert spaces,
  self-adjoint operators, and spectral theory; the most mathematically rigorous QM
  lecture series on YouTube.
- Frederic Schuller, "Geometrical Anatomy of Theoretical Physics" (playlist) --
  [YouTube](https://www.youtube.com/playlist?list=PLPH7f_7ZlzxTi6kS4vCmv4ZKm9u8g5yic)
  -- `[partially verified]` 28 lectures on the differential-geometry and bundle
  machinery behind physics; the math backbone for the geometry route (Part III).
- Tobias J. Osborne -- [channel](https://www.youtube.com/@tobiasjosborne) and
  ["Advanced Quantum Theory"](https://www.youtube.com/playlist?list=PLDfPUNusx1Eo60qx3Od2KLUL4b7VDPo9F)
  -- `[partially verified]` Full recorded Hannover graduate courses in advanced /
  mathematical QM, quantum information theory, and QFT; formalism-heavy. (His QIT
  and Foundations courses are on the same
  [Playlists tab](https://www.youtube.com/@tobiasjosborne/playlists).)
- Leonard Susskind, "The Theoretical Minimum: Quantum Mechanics" (Stanford) --
  [theoreticalminimum.com](https://theoreticalminimum.com/courses/quantum-mechanics/2012/winter)
  -- Full lecture course; a lower-math-bar but conceptually careful on-ramp.
- Perimeter Scholars International (PSI) -- offered lectures --
  [perimeterinstitute.ca](https://perimeterinstitute.ca/training/masters-program/psi-offered-lectures)
  -- Master's-level theoretical-physics courses (Quantum Theory, math physics), each
  recorded to PIRSA ([pirsa.org](https://pirsa.org/)).
- V. Balakrishnan, "Quantum Physics" (NPTEL / IIT Madras) --
  [nptel.ac.in/courses/122106034](https://nptel.ac.in/courses/122106034) (also on
  [YouTube](https://www.youtube.com/playlist?list=PL0F530F3BAF8C6FCC),
  `[partially verified]`) -- 31-lecture rigorous single-lecturer QM series.

## 4. YouTube channels (explanation, intuition, news)

- 3Blue1Brown (Grant Sanderson) --
  [@3blue1brown](https://www.youtube.com/@3blue1brown) -- Animation-driven
  math/physics explainers; the visual-intuition reference.
- PBS Space Time -- [@pbsspacetime](https://www.youtube.com/@pbsspacetime) --
  `[partially verified]` Higher-rigor pop-sci deep-dives on QM, QFT, cosmology.
- Sean Carroll -- [@seancarroll](https://www.youtube.com/@seancarroll) and the
  [Mindscape podcast](https://www.preposterousuniverse.com/podcast/) --
  `[partially verified]` Lectures and interviews on QM foundations and Many-Worlds.
- Sabine Hossenfelder --
  [@sabinehossenfelder](https://www.youtube.com/@sabinehossenfelder) --
  `[partially verified]` Physics news and skeptical takes on foundations and hype.
- minutephysics (Henry Reich) --
  [@minutephysics](https://www.youtube.com/@minutephysics) -- `[partially verified]`
  Short whiteboard-animation intuition primers.
- Physics Explained --
  [channel](https://www.youtube.com/channel/UCIZ5ZOeiXYbmKTl_85ghNPw) --
  `[partially verified]` Long-form, math-heavy derivations; high signal for a
  mathematician.
- Angela Collier (acollierastro) --
  [@acollierastro](https://www.youtube.com/@acollierastro) -- Theoretical
  physicist's essay-style, anti-hype videos on physics and academic culture.
- Welch Labs --
  [channel](https://www.youtube.com/channel/UConVfxXodg78Tzh5nNu85Ew) --
  `[partially verified]` Visual, historically framed math/physics series.
- Qiskit (IBM Quantum) -- [@qiskit](https://www.youtube.com/@qiskit) --
  `[partially verified]` Quantum-computing tutorials; the applied / QI angle.
- Looking Glass Universe (Mithuna Yoganathan) --
  [channel](https://www.youtube.com/user/LookingGlassUniverse) --
  `[partially verified]` Quantum-focused, math-friendly explainers careful about
  what QM does and does not say.
- ViaScience -- [channel](https://www.youtube.com/user/viascience) --
  `[partially verified]` A ~31-part lecture-style QM series with real math.

## 5. Blogs and long-form writing

- Scott Aaronson, "Shtetl-Optimized" --
  [scottaaronson.blog](https://scottaaronson.blog/) -- Quantum computing and
  complexity from a leading theorist; the reference antidote to "a quantum computer
  tries all answers at once" folklore.
- John Baez, "Azimuth" --
  [johncarlosbaez.wordpress.com](https://johncarlosbaez.wordpress.com/) --
  Mathematical physics with a categorical bent (octonions, quantization, networks);
  the math behind the physics made explicit.
- The "n-Category Cafe" --
  [golem.ph.utexas.edu/category](https://golem.ph.utexas.edu/category/) -- Group
  blog (Baez, Leinster, Shulman, ...) on higher category theory, monoidal
  categories, and their use in quantum theory. Advanced.
- Peter Woit, "Not Even Wrong" --
  [math.columbia.edu/~woit/wordpress](https://www.math.columbia.edu/~woit/wordpress/)
  -- A mathematician's commentary, heavy on representation theory and the geometry
  underlying QM/QFT.
- Terence Tao, "What's new" -- [terrytao.wordpress.com](https://terrytao.wordpress.com/)
  -- Research and expository posts; occasional spectral-theory and analysis
  foundations relevant to rigorous QM, always carefully written.
- Quanta Magazine -- [quantamagazine.org](https://www.quantamagazine.org/) --
  High-quality, fact-checked science journalism (physics, math, CS); for
  orientation and context, not a primary technical source.
- Sabine Hossenfelder, "Backreaction" --
  [backreaction.blogspot.com](http://backreaction.blogspot.com/) -- Physics and
  quantum-foundations commentary; opinionated, useful as a foil.
- Gil Kalai, "Combinatorics and more" --
  [gilkalai.wordpress.com](https://gilkalai.wordpress.com/) -- Combinatorics plus
  his well-known quantum-computing-skeptic threads on noise and fault tolerance.
- Dave Bacon, "The Quantum Pontiff" --
  [dabacon.org/pontiff](https://dabacon.org/pontiff/) -- Long-running
  quantum-computing blog (companion Substack at
  [pontiff.substack.com](https://pontiff.substack.com/)).
- Michael Nielsen -- [michaelnielsen.org](https://michaelnielsen.org/) -- Homepage
  of the Nielsen & Chuang co-author; essays on quantum computing, learning, and
  open science.
- Tobias J. Osborne, research notes --
  [tjoresearchnotes.wordpress.com](https://tjoresearchnotes.wordpress.com/) --
  Open-notebook blog on quantum information, condensed matter, and mathematical
  physics, with lecture material.
- Kevin Buzzard, "Xena Project" --
  [xenaproject.wordpress.com](https://xenaproject.wordpress.com/) -- Formalizing
  mathematics in Lean; the practicalities of machine-checkable rigor and
  AI-assisted proving.

## 6. Researchers to follow (by area)

Each links to a verified institutional homepage (or Google Scholar where no
personal page exists).

**Mathematical QM / spectral theory**

- Barry Simon (Schrodinger operators, spectral theory) --
  [math.caltech.edu/simon](http://math.caltech.edu/simon/simon.html)
- Valter Moretti (mathematical foundations of QM, operator algebras) --
  [sites.google.com/unitn.it/valter-moretti](https://sites.google.com/unitn.it/valter-moretti/home)
- Klaas Landsman (mathematical foundations of quantum theory) --
  [math.ru.nl/~landsman](https://www.math.ru.nl/~landsman/)
- Gerald Teschl (spectral theory of Schrodinger operators) --
  [mat.univie.ac.at/~gerald](https://www.mat.univie.ac.at/~gerald/)

**Operator algebras / AQFT**

- Detlev Buchholz (algebraic QFT) --
  [Google Scholar](https://scholar.google.de/citations?hl=en&user=dDsuXIQAAAAJ)
- Klaus Fredenhagen (perturbative/algebraic QFT) --
  [physik.uni-hamburg.de](https://www.physik.uni-hamburg.de/en/th2/ag-fredenhagen.html)
- Christopher Fewster (rigorous QFT in curved spacetime, measurement) --
  [york.ac.uk](https://www.york.ac.uk/maths/people/chris-fewster/)
- Roberto Longo (operator algebras and QFT, conformal nets) --
  [mat.uniroma2.it/longo](https://www.mat.uniroma2.it/longo/)

**Categorical / diagrammatic QM**

- Samson Abramsky (categorical quantum mechanics) --
  [cs.ox.ac.uk/people/samson.abramsky](https://www.cs.ox.ac.uk/people/samson.abramsky/)
- Bob Coecke (categorical QM, ZX-calculus) --
  [cs.ox.ac.uk/people/bob.coecke](https://www.cs.ox.ac.uk/people/bob.coecke/)
- Chris Heunen (categorical quantum foundations) --
  [homepages.inf.ed.ac.uk/cheunen](https://homepages.inf.ed.ac.uk/cheunen/)
- Jamie Vicary (higher category theory, TQFT) --
  [cl.cam.ac.uk/~jv258](https://www.cl.cam.ac.uk/~jv258/)
- Peter Selinger (categorical semantics, quantum programming languages) --
  [mathstat.dal.ca/~selinger](https://www.mathstat.dal.ca/~selinger/)
- John Baez (categorical/mathematical physics) --
  [math.ucr.edu/home/baez](https://math.ucr.edu/home/baez/)

**Foundations**

- Lucien Hardy (operational reconstructions, indefinite causality) --
  [perimeterinstitute.ca](https://perimeterinstitute.ca/people/lucien-hardy)
- Robert Spekkens (epistemic models, contextuality) --
  [rwspekkens.com](https://www.rwspekkens.com/)
- Howard Wiseman (quantum measurement, steering) --
  [howardwiseman.me](https://howardwiseman.me/)
- Renato Renner (quantum information, foundations) --
  [qit.ethz.ch](https://qit.ethz.ch/people/person-detail.html?persid=59275)
- Adan Cabello (contextuality, Bell inequalities) --
  [personal.us.es/adan](https://personal.us.es/adan/home.htm)

**Geometry / quantization**

- Alan Weinstein (symplectic/Poisson geometry, quantization) --
  [math.berkeley.edu/~alanw](https://math.berkeley.edu/~alanw/)
- Nicholas Woodhouse (geometric quantization, twistor theory) --
  [maths.ox.ac.uk](https://www.maths.ox.ac.uk/people/nick.woodhouse)

**Quantum information**

- John Preskill (quantum computing, error correction) --
  [preskill.caltech.edu](https://www.preskill.caltech.edu/)
- John Watrous (theory of quantum information) --
  [jhwatrous.github.io](https://jhwatrous.github.io/)
- Mark Wilde (quantum Shannon theory, entropy) --
  [markwilde.com](https://www.markwilde.com/)
- Andreas Winter (quantum Shannon theory, resource theories) --
  [webs.uab.cat/giq](https://webs.uab.cat/giq/member/andreas-winter/)
- Steven Flammia (error correction, learning quantum systems) --
  [sflammia.github.io](https://sflammia.github.io/)

**Formalization / Lean**

- Kevin Buzzard (formalized mathematics in Lean) --
  [ma.imperial.ac.uk/~buzzard](https://www.ma.imperial.ac.uk/~buzzard/)
- Patrick Massot (geometry, Lean/Mathlib, leanblueprint) --
  [imo.universite-paris-saclay.fr/~patrick.massot](https://www.imo.universite-paris-saclay.fr/~patrick.massot/)
- Mathlib / Lean community --
  [leanprover-community.github.io](https://leanprover-community.github.io/)

## 7. Communities, tools, and formalization

- Lean community Zulip --
  [leanprover.zulipchat.com](https://leanprover.zulipchat.com/) -- The live chat
  where Lean/Mathlib development happens; the fastest place to ask "does Mathlib
  have X?" and get a rigorous answer. Its "Is there code for X?" and maths streams
  are the standard first stop before formalizing a QM result yourself.
- Mathlib4 --
  [github.com/leanprover-community/mathlib4](https://github.com/leanprover-community/mathlib4)
  and [docs](https://leanprover-community.github.io/mathlib4_docs/) -- The Lean 4
  mathematical library (analysis, Hilbert spaces, operator theory) any verified-QM
  formalization builds on; use the docs to find exact declaration names.
- PhysLean (physlib) --
  [github.com/leanprover-community/physlib](https://github.com/leanprover-community/physlib)
  -- Community project formalizing physics in Lean 4; the March 2026 merger of
  PhysLean and Lean-QuantumInfo, and the natural home for verified QM work.
- Lean-QuantumInfo --
  [github.com/Timeroot/Lean-QuantumInfo](https://github.com/Timeroot/Lean-QuantumInfo)
  -- Lean 4 formalization of quantum/classical information theory (the Generalized
  Quantum Stein's Lemma); now folded into PhysLean but a useful reference codebase.
- leanblueprint --
  [github.com/PatrickMassot/leanblueprint](https://github.com/PatrickMassot/leanblueprint)
  -- The plasTeX plugin for formalization "blueprints" linking informal math to Lean
  declarations; this project's proven-vs-frontier tracker.
- nLab -- [ncatlab.org](https://ncatlab.org/) -- Collaborative higher-structures
  wiki; especially strong for categorical quantum mechanics and monoidal categories.
- MathOverflow -- [mathoverflow.net](https://mathoverflow.net/) -- Research-level
  mathematics Q&A; the place to ask precise questions about the functional analysis
  behind QM.
- Physics Stack Exchange --
  [physics.stackexchange.com](https://physics.stackexchange.com/) -- Q&A on physics
  including conceptual and computational QM; good for conventions and standard
  results.
- Quantum Computing Stack Exchange --
  [quantumcomputing.stackexchange.com](https://quantumcomputing.stackexchange.com/)
  -- `[unverified]` Q&A on quantum computing and information. Site follows the
  standard Stack Exchange pattern but the domain blocks automated checks, so it was
  not independently confirmed.
- Stanford Encyclopedia of Philosophy --
  [plato.stanford.edu](https://plato.stanford.edu/) -- Peer-reviewed, free; its QM
  entries (measurement problem, interpretations, Bell's theorem) are rigorous
  references for the foundations track.
- IBM Quantum Learning --
  [quantum.cloud.ibm.com/learning](https://quantum.cloud.ibm.com/learning) -- IBM's
  free course platform that succeeds the old qiskit.org/textbook; Watrous's "Basics
  of Quantum Information" is a rigorous linear-algebra-first treatment.
- Quantum Country -- [quantum.country](https://quantum.country/) -- Free
  spaced-repetition ("mnemonic medium") essays by Matuschak and Nielsen; a
  linear-algebra-based introduction designed to make the material stick.
