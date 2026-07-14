<!-- SPDX-License-Identifier: CC-BY-SA-4.0 -->

# Quantum Theory: A Math-First Reading Map

> Links verified on 2026-07-11 by resolving each DOI (via doi.org / Crossref),
> fetching each arXiv abstract page, and fetching each free author copy to
> confirm it is live and is the claimed work. Link liveness rots; re-check
> periodically. Items marked `[free]` have a confirmed live open copy; items
> marked `[unverified]` could not be confirmed and carry a note on what was
> tried. German titles are given in ASCII transliteration.
>
> For the wider ecosystem - journals, preprint servers, video courses, YouTube
> channels, blogs, researchers to follow, and community/formalization resources -
> see the companion [`sources-directory.md`](sources-directory.md).

## Historical / primary

- Heisenberg, W. "Uber quantentheoretische Umdeutung kinematischer und
  mechanischer Beziehungen." _Zeitschrift fur Physik_ 33 (1925): 879-893.
  [doi:10.1007/BF01328377](https://doi.org/10.1007/BF01328377) -- The paper that
  started matrix mechanics; the origin point every later formalism reorganizes.
- Born, M., Heisenberg, W., Jordan, P. "Zur Quantenmechanik II" (the three-man
  paper). _Zeitschrift fur Physik_ 35 (1926): 557-615.
  [doi:10.1007/BF01379806](https://doi.org/10.1007/BF01379806) -- First systematic
  matrix-mechanics formalism, including commutation relations in general form. The
  commutator generalizes to fields as the equal-time commutation relations (ETCR);
  overviews:
  [Canonical commutation relation](https://en.wikipedia.org/wiki/Canonical_commutation_relation)
  and, for the equal-time field version,
  [Canonical quantization](https://en.wikipedia.org/wiki/Canonical_quantization)
  (Wikipedia).
- Schrodinger, E. "Quantisierung als Eigenwertproblem" (first communication).
  _Annalen der Physik_ 384 (1926): 361-376.
  [doi:10.1002/andp.19263840404](https://doi.org/10.1002/andp.19263840404) --
  Wave mechanics as an eigenvalue problem; the analyst's entry to the theory.
  (Modern continuous volume 384 = old ser. 4, vol. 79.)
- Born, M. "Zur Quantenmechanik der Stossvorgange." _Zeitschrift fur Physik_ 37
  (1926): 863-867. [doi:10.1007/BF01397477](https://doi.org/10.1007/BF01397477) --
  Introduces the probability interpretation of the wavefunction (the Born rule).
- Dirac, P. A. M. _The Principles of Quantum Mechanics._ 4th ed. Oxford: Clarendon
  Press, 1958 (1st ed. 1930). ISBN 978-0-19-852011-5.
  [publisher](https://global.oup.com/academic/product/the-principles-of-quantum-mechanics-9780198520115)
  -- Transformation theory and bra-ket notation from the source; still shapes how
  the subject is written. No legitimate free full text.
- von Neumann, J. _Mathematical Foundations of Quantum Mechanics._ New ed., ed. N.
  A. Wheeler, tr. R. T. Beyer. Princeton Univ. Press, 2018 (German orig. 1932;
  Princeton 1955). [doi:10.1515/9781400889921](https://doi.org/10.1515/9781400889921)
  -- The Hilbert-space axiomatization; the book that made QM a chapter of
  functional analysis.
- Wigner, E. P. _Gruppentheorie und ihre Anwendung auf die Quantenmechanik der
  Atomspektren._ Vieweg, 1931. English tr. J. J. Griffin, Academic Press, 1959,
  ISBN 978-0-12-750550-3. -- Canonical source of Wigner's symmetry theorem; the
  1931 original predates ISBNs, so cite the 1959 translation for a resolvable id.
- Einstein, A., Podolsky, B., Rosen, N. "Can Quantum-Mechanical Description of
  Physical Reality Be Considered Complete?" _Physical Review_ 47 (1935): 777-780.
  [doi:10.1103/PhysRev.47.777](https://doi.org/10.1103/PhysRev.47.777) -- The EPR
  argument that frames every later discussion of nonlocality and completeness.
  Overview:
  [EPR paradox](https://en.wikipedia.org/wiki/Einstein%E2%80%93Podolsky%E2%80%93Rosen_paradox)
  (Wikipedia).
- Schrodinger, E. "Die gegenwartige Situation in der Quantenmechanik." _Die
  Naturwissenschaften_ 23 (1935): 807-812, 823-828, 844-849.
  [doi:10.1007/BF01491891](https://doi.org/10.1007/BF01491891) -- Schrodinger's
  reply to EPR: coins "entanglement" (Verschraenkung) and introduces the cat; the
  conceptual companion to EPR. Overview:
  [Schrodinger's cat](https://en.wikipedia.org/wiki/Schr%C3%B6dinger%27s_cat)
  (Wikipedia).
- Bell, J. S. "On the Einstein Podolsky Rosen paradox." _Physics Physique Fizika_
  1 (1964): 195-200. `[free]`
  [doi:10.1103/PhysicsPhysiqueFizika.1.195](https://doi.org/10.1103/PhysicsPhysiqueFizika.1.195)
  -- Turns EPR into a testable inequality; open access via APS.
- Clauser, J. F., Horne, M. A., Shimony, A., Holt, R. A. "Proposed Experiment to
  Test Local Hidden-Variable Theories." _Physical Review Letters_ 23 (1969):
  880-884. [doi:10.1103/PhysRevLett.23.880](https://doi.org/10.1103/PhysRevLett.23.880)
  -- The CHSH inequality; the experimentally usable form of Bell's theorem.
- Gleason, A. M. "Measures on the Closed Subspaces of a Hilbert Space." _Journal
  of Mathematics and Mechanics_ 6 (1957): 885-893.
  [doi:10.1512/iumj.1957.6.56050](https://doi.org/10.1512/iumj.1957.6.56050) --
  Derives the Born rule from lattice structure; a theorem a mathematician can love.
  (J. Math. Mech. is now the Indiana Univ. Math. J., which hosts the DOI.)
- Kochen, S., Specker, E. P. "The Problem of Hidden Variables in Quantum
  Mechanics." _Journal of Mathematics and Mechanics_ 17 (1967): 59-87.
  [doi:10.1512/iumj.1968.17.17004](https://doi.org/10.1512/iumj.1968.17.17004) --
  Contextuality via a finite combinatorial obstruction; pairs with Gleason.
- Faster-than-light and the no-communication theorem: the quantum nonlocality of
  Bell and CHSH (above) does not permit sending information faster than light,
  because the entangled correlations are non-signaling (the marginal statistics
  are unaffected by a distant measurement). Overviews:
  [Faster-than-light](https://en.wikipedia.org/wiki/Faster-than-light) and
  [Faster-than-light communication](https://en.wikipedia.org/wiki/Faster-than-light_communication)
  (Wikipedia).
- Aharonov, Y., Bohm, D. "Significance of Electromagnetic Potentials in the
  Quantum Theory." _Physical Review_ 115 (1959): 485-491.
  [doi:10.1103/PhysRev.115.485](https://doi.org/10.1103/PhysRev.115.485) -- The
  potential-as-connection effect; the physical seed of the geometric viewpoint.
- Berry, M. V. "Quantal phase factors accompanying adiabatic changes."
  _Proceedings of the Royal Society A_ 392 (1984): 45-57.
  [doi:10.1098/rspa.1984.0023](https://doi.org/10.1098/rspa.1984.0023) -- The
  geometric (Berry) phase; holonomy enters quantum mechanics.
- Simon, B. "Holonomy, the Quantum Adiabatic Theorem, and Berry's Phase."
  _Physical Review Letters_ 51 (1983): 2167-2170.
  [doi:10.1103/PhysRevLett.51.2167](https://doi.org/10.1103/PhysRevLett.51.2167)
  -- Recasts Berry's phase as holonomy of a line bundle; the math-first reading.

## Rigorous mathematical QM

- Hall, B. C. _Quantum Theory for Mathematicians._ Springer GTM 267, 2013.
  [doi:10.1007/978-1-4614-7116-5](https://doi.org/10.1007/978-1-4614-7116-5) --
  The standard bridge text: unbounded operators, spectral theorem, and QM built
  for a reader who wants proofs.
- Takhtajan, L. A. _Quantum Mechanics for Mathematicians._ AMS GSM 95, 2008.
  ISBN 978-0-8218-4630-8. [AMS](https://bookstore.ams.org/gsm-95) -- Compact,
  structural account emphasizing the classical/quantum correspondence and
  path integrals.
- Woit, P. _Quantum Theory, Groups and Representations: An Introduction._ Springer,
  2017. `[free]` [doi:10.1007/978-3-319-64612-1](https://doi.org/10.1007/978-3-319-64612-1)
  -- free author copy: [math.columbia.edu/~woit/QM/qmbook.pdf](https://www.math.columbia.edu/~woit/QM/qmbook.pdf)
  -- QM organized around Lie groups and their representations; the free PDF is an
  evolving "under construction" draft, not byte-identical to the 2017 print.
- Reed, M., Simon, B. _Methods of Modern Mathematical Physics._ Vols. I-IV.
  Academic Press. I: Functional Analysis (rev. 1980, ISBN 978-0-12-585050-6);
  II: Fourier Analysis, Self-Adjointness (1975, 978-0-12-585002-5); III: Scattering
  Theory (1979, 978-0-12-585003-2); IV: Analysis of Operators (1978,
  978-0-12-585004-9). -- The reference for the operator theory QM actually uses;
  cite by volume. No DOIs (pre-DOI era), no URL needed.
- Moretti, V. _Spectral Theory and Quantum Mechanics._ 2nd ed. Springer UNITEXT
  110, 2018. [doi:10.1007/978-3-319-70706-8](https://doi.org/10.1007/978-3-319-70706-8)
  -- Rigorous route from the spectral theorem to the algebraic formulation and
  symmetries. (Use this 2nd-ed DOI; the 1st-ed DOI is a different book.)
- Teschl, G. _Mathematical Methods in Quantum Mechanics._ 2nd ed. AMS GSM 157,
  2014. `[free]` [AMS](https://bookstore.ams.org/gsm-157) -- free author copy:
  [mat.univie.ac.at/~gerald/ftp/book-schroe/](https://www.mat.univie.ac.at/~gerald/ftp/book-schroe/)
  ([PDF](https://www.mat.univie.ac.at/~gerald/ftp/book-schroe/schroe2.pdf)) --
  Self-adjointness and Schrodinger operators, self-contained and free; a great
  first rigorous pass.
- Strocchi, F. _An Introduction to the Mathematical Structure of Quantum
  Mechanics._ 2nd ed. World Scientific, Adv. Ser. Math. Phys. 27, 2008.
  [doi:10.1142/7038](https://doi.org/10.1142/7038) -- Short, sharp C\*-algebraic
  framing of the axioms; good orientation before the big operator-algebra books.
- Landsman, K. _Foundations of Quantum Theory: From Classical Concepts to Operator
  Algebras._ Springer FTP 188, 2017. `[open access]`
  [doi:10.1007/978-3-319-51777-3](https://doi.org/10.1007/978-3-319-51777-3)
  ([OA PDF](https://link.springer.com/content/pdf/10.1007/978-3-319-51777-3.pdf))
  -- Foundations and the classical limit through operator algebras; open access,
  authoritative, and current.

## Operator algebras

- Bratteli, O., Robinson, D. W. _Operator Algebras and Quantum Statistical
  Mechanics 1._ 2nd ed. Springer, 1987.
  [doi:10.1007/978-3-662-02520-8](https://doi.org/10.1007/978-3-662-02520-8) --
  The C\*/W\*-algebra machinery (states, symmetries, decompositions) that algebraic
  QM stands on.
- Bratteli, O., Robinson, D. W. _Operator Algebras and Quantum Statistical
  Mechanics 2._ 2nd ed. Springer, 1997.
  [doi:10.1007/978-3-662-03444-6](https://doi.org/10.1007/978-3-662-03444-6) --
  Equilibrium states and models; KMS states and the dynamics side of the theory.
- Haag, R. _Local Quantum Physics: Fields, Particles, Algebras._ 2nd ed. Springer,
  1996. [doi:10.1007/978-3-642-61458-3](https://doi.org/10.1007/978-3-642-61458-3)
  -- Algebraic QFT from its principal architect; where the operator-algebra program
  meets relativistic physics.
- Emch, G. G. _Algebraic Methods in Statistical Mechanics and Quantum Field
  Theory._ Wiley, 1972; Dover reprint 2009, ISBN 978-0-486-47209-6. -- Early,
  readable synthesis of the algebraic approach; no DOI, cite by ISBN.

## Symmetry & representation theory

- Hall, B. C. _Lie Groups, Lie Algebras, and Representations: An Elementary
  Introduction._ 2nd ed. Springer GTM 222, 2015.
  [doi:10.1007/978-3-319-13467-3](https://doi.org/10.1007/978-3-319-13467-3) --
  The matrix-Lie-group route to representation theory; the companion to Hall's QM
  text.
- Sternberg, S. _Group Theory and Physics._ Cambridge Univ. Press, 1994. ISBN
  978-0-521-24870-5 (pbk 978-0-521-55885-3). -- Symmetry in physics with a
  geometer's eye; strong on crystallography and spectra. No DOI.
- Woit, P. _Quantum Theory, Groups and Representations._ (see Rigorous
  mathematical QM) -- Doubles as a representation-theory-first QM text; serves both
  routes.

## Geometry & quantization

- Woodhouse, N. M. J. _Geometric Quantization._ 2nd ed. Oxford (Clarendon), Oxford
  Math. Monographs, 1992. ISBN 978-0-19-850270-8.
  [Oxford Academic](https://academic.oup.com/book/54006) -- The standard account of
  the geometric-quantization program (prequantization, polarizations). DOI reported
  as 10.1093/oso/9780198536734.001.0001 but not independently resolved; page is live.
- Bates, S., Weinstein, A. _Lectures on the Geometry of Quantization._ Berkeley
  Math. Lecture Notes 8, AMS, 1997. `[free]` ISBN 978-0-8218-0798-9 --
  [math.berkeley.edu/~alanw/GofQ.pdf](https://math.berkeley.edu/~alanw/GofQ.pdf)
  -- Short, lucid, free lecture notes; the gentlest on-ramp to quantization and
  symplectic geometry.
- Guillemin, V., Sternberg, S. _Symplectic Techniques in Physics._ Cambridge Univ.
  Press, 1984. ISBN 978-0-521-24866-8 (pbk 978-0-521-38990-7). -- Moment maps and
  symplectic reduction with physical motivation; a classic. No DOI.
- Kirillov, A. A. _Lectures on the Orbit Method._ AMS GSM 64, 2004.
  [doi:10.1090/gsm/064](https://doi.org/10.1090/gsm/064) -- The orbit method from
  its originator: coadjoint orbits as the geometry behind representations.

## Categorical / diagrammatic QM

- Abramsky, S., Coecke, B. "A categorical semantics of quantum protocols." _Proc.
  19th IEEE Symp. Logic in Computer Science (LiCS'04)_, 2004. `[free]`
  [arXiv:quant-ph/0402130](https://arxiv.org/abs/quant-ph/0402130) -- The paper
  that launched categorical quantum mechanics; compact closed categories as the
  setting for quantum protocols.
- Coecke, B., Kissinger, A. _Picturing Quantum Processes._ Cambridge Univ. Press,
  2017. [doi:10.1017/9781316219317](https://doi.org/10.1017/9781316219317) -- The
  full diagrammatic-reasoning course; string diagrams as a rigorous calculus for QM.
- Heunen, C., Vicary, J. _Categories for Quantum Theory: An Introduction._ Oxford
  Univ. Press, Oxford Grad. Texts in Math. 28, 2019.
  [doi:10.1093/oso/9780198739623.001.0001](https://doi.org/10.1093/oso/9780198739623.001.0001)
  -- The rigorous category-theory text behind the diagrams; dagger and monoidal
  structure done carefully.
- Baez, J. C., Stay, M. "Physics, Topology, Logic and Computation: A Rosetta
  Stone." In _New Structures for Physics_, LNP 813, Springer, 2011, pp. 95-174.
  `[free]` [arXiv:0903.0340](https://arxiv.org/abs/0903.0340) -- Maps the shared
  categorical skeleton of physics, computation, and logic; the conceptual why
  behind the diagrammatic route.

## Quantum information

- Nielsen, M. A., Chuang, I. L. _Quantum Computation and Quantum Information._ 10th
  Anniversary ed. Cambridge Univ. Press, 2010.
  [doi:10.1017/CBO9780511976667](https://doi.org/10.1017/CBO9780511976667) -- The
  field's standard reference; the shared vocabulary for everything downstream.
- Watrous, J. _The Theory of Quantum Information._ Cambridge Univ. Press, 2018.
  `[free]` [doi:10.1017/9781316848142](https://doi.org/10.1017/9781316848142) --
  free author copy: [cs.uwaterloo.ca/~watrous/TQI/](https://cs.uwaterloo.ca/~watrous/TQI/)
  -- The mathematically rigorous treatment (channels, distances, semidefinite
  programming); the math-first QI reference.
- Wilde, M. M. _Quantum Information Theory._ 2nd ed. Cambridge Univ. Press, 2017.
  `[free]` [arXiv:1106.1445](https://arxiv.org/abs/1106.1445) -- Quantum Shannon
  theory in depth; the free arXiv version carries the preprint title "From
  Classical to Quantum Shannon Theory" but is the published 2nd edition.
- Preskill, J. _Quantum Computation_ (Ph219/CS219 lecture notes). Caltech. `[free]`
  [preskill.caltech.edu/ph219](https://preskill.caltech.edu/ph219/ph219_2021-22.html)
  -- The lecture notes a generation learned from; free, current, and complete.
  (Cite the preskill.caltech.edu host; the older theory.caltech.edu alias trips a
  TLS cert warning.)

## Formalization prior art

- Lean-QuantumInfo (Timeroot). "Quantum information theory in Lean 4." MIT license.
  [github.com/Timeroot/Lean-QuantumInfo](https://github.com/Timeroot/Lean-QuantumInfo)
  -- Lean 4 formalization of finite-dimensional QI (entropy, capacity, strong
  subadditivity, a formal Generalized Quantum Stein's Lemma); the closest prior art.
  Now merged into [leanprover-community/physlib](https://github.com/leanprover-community/physlib)
  (PhysLean), which may be the citable current home.
- Dedecker, A., Loreaux, J. "The continuous functional calculus in Lean." 2025.
  `[free]` [arXiv:2501.15639](https://arxiv.org/abs/2501.15639) -- How the CFC (a
  cornerstone for spectral-theoretic QM) was built in Mathlib; the method to reuse.
  (Author is Anatole Dedecker, not "Frederic".)
- Mathlib community. _Mathlib4_ (Lean 4 mathematics library).
  [github.com/leanprover-community/mathlib4](https://github.com/leanprover-community/mathlib4)
  -- docs: [leanprover-community.github.io/mathlib4_docs](https://leanprover-community.github.io/mathlib4_docs/)
  -- The spectral-theory and CFC namespaces you will build the QM layer on top of.
- Massot, P. _leanblueprint._ Apache-2.0.
  [github.com/PatrickMassot/leanblueprint](https://github.com/PatrickMassot/leanblueprint)
  -- The blueprint methodology for planning and tracking a large Lean formalization;
  the process model for this book's proof layer.

## Courses & video (free)

- MIT OCW 8.04 Quantum Physics I (Spring 2013; Adams, Evans, Zwiebach). `[free]`
  [ocw.mit.edu/courses/8-04-quantum-physics-i-spring-2013](https://ocw.mit.edu/courses/8-04-quantum-physics-i-spring-2013/)
  -- Full lecture course with problem sets; the standard modern intro sequence.
- MIT OCW 8.05 Quantum Physics II (Fall 2013; Zwiebach). `[free]`
  [ocw.mit.edu/courses/8-05-quantum-physics-ii-fall-2013](https://ocw.mit.edu/courses/8-05-quantum-physics-ii-fall-2013/)
  -- The formalism-heavy middle course; basis for Zwiebach's 2022 MIT Press text.
- MIT OCW 8.06 Quantum Physics III (Spring 2018; Zwiebach). `[free]`
  [ocw.mit.edu/courses/8-06-quantum-physics-iii-spring-2018](https://ocw.mit.edu/courses/8-06-quantum-physics-iii-spring-2018/)
  -- Perturbation theory, scattering, and applications; completes the sequence.
- Schuller, F. "Lectures on Quantum Theory" (YouTube playlist). `[free]`
  [playlist](https://www.youtube.com/playlist?list=PLPH7f_7ZlzxQVx5jRjbfRGEzWY_upS5K6)
  -- Mathematically rigorous QM lectures (self-adjointness done honestly); a
  math-first favorite. `[partially verified]` playlist ID matches search results;
  YouTube's consent wall blocked a direct content fetch.
- Schuller, F. "Lectures on the Geometrical Anatomy of Theoretical Physics"
  (YouTube playlist). `[free]`
  [playlist](https://www.youtube.com/playlist?list=PLPH7f_7ZlzxTi6kS4vCmv4ZKm9u8g5yic)
  -- Bundles, connections, and the geometry behind gauge theory; the geometry-route
  video companion. `[partially verified]` (same consent-wall caveat).
- 3Blue1Brown (Grant Sanderson). YouTube channel. `[free]`
  [youtube.com/@3blue1brown](https://www.youtube.com/@3blue1brown) -- Reference for
  animation/visual-explanation style. `[partially verified]` canonical handle; a
  direct fetch hit YouTube's consent redirect.
- Stanford Encyclopedia of Philosophy. `[free]` "Bell's Theorem"
  ([plato.stanford.edu/entries/bell-theorem](https://plato.stanford.edu/entries/bell-theorem/)),
  "Quantum Mechanics" (interpretations overview,
  [entries/qm](https://plato.stanford.edu/entries/qm/)), and "Philosophical Issues
  in Quantum Theory" (Myrvold, [entries/qt-issues](https://plato.stanford.edu/entries/qt-issues/)).
  -- Careful, well-sourced surveys of the foundational debates. NOTE: the older
  "Measurement in Quantum Theory" entry is retired; use qt-issues instead.

## Physicist's track (cross-reference)

This is a parallel, physics-first reading track provided only for
cross-reference; the main reading map above stays math-first. These are the
standard "physicist's-track" quantum mechanics texts, ordered roughly from first
course to graduate reference. They emphasize physical intuition, calculation, and
applications rather than the functional-analysis foundations of the math-first
list. The free MIT OpenCourseWare courses 8.04, 8.05, and 8.06 (above) are the
free course counterpart to this track and pair especially well with Zwiebach.

- Griffiths, D. J. & Schroeter, D. F. _Introduction to Quantum Mechanics_, 3rd
  ed., Cambridge University Press, 2018.
  [doi:10.1017/9781316995433](https://doi.org/10.1017/9781316995433) (ISBN
  9781107189638). The standard undergraduate first course: gentle,
  calculation-first, ideal for a reader meeting wavefunctions and the Schrodinger
  equation for the first time.
- Sakurai, J. J. & Napolitano, J. _Modern Quantum Mechanics_, 3rd ed., Cambridge
  University Press, 2020.
  [doi:10.1017/9781108587280](https://doi.org/10.1017/9781108587280) (ISBN
  9781108473224). The standard graduate course: starts from spin and bra-ket
  formalism, for a reader ready for an operator-first, abstract treatment.
- Shankar, R. _Principles of Quantum Mechanics_, 2nd ed., Springer (Plenum Press),
  1994. ISBN 9780306447907. Thorough and self-contained graduate text with a
  strong linear-algebra/formalism build-up and path integrals; good for a reader
  who wants every step spelled out.
- Zwiebach, B. _Mastering Quantum Mechanics: Essentials, Theory, and
  Applications_, MIT Press, 2022.
  [mitpress.mit.edu/9780262046138](https://mitpress.mit.edu/9780262046138/mastering-quantum-mechanics/)
  (ISBN 9780262046138). Comprehensive modern text and the print companion to MIT
  OCW 8.04/8.05/8.06; suits a self-learner who wants the video-course path in book
  form.
- Cohen-Tannoudji, C., Diu, B. & Laloe, F. _Quantum Mechanics_ (3 volumes), 2nd
  ed., Wiley-VCH: Vol. 1 (2019, ISBN 9783527345533), Vol. 2 (2020, ISBN
  9783527345540), Vol. 3 (ISBN 9783527345557). Encyclopedic reference with a
  distinctive chapter-plus-"complements" structure; the book you consult for an
  exhaustive, worked treatment of a specific topic.
- Feynman, R. P., Leighton, R. B. & Sands, M. _The Feynman Lectures on Physics,
  Vol. III: Quantum Mechanics_. `[free]`
  [feynmanlectures.caltech.edu/III_toc.html](https://www.feynmanlectures.caltech.edu/III_toc.html).
  The physicist's intuition, free to read online in the official Caltech edition;
  the amplitude-first narrative is best as a companion for insight rather than a
  problem-driven course.
- Weinberg, S. _Lectures on Quantum Mechanics_, 2nd ed., Cambridge University
  Press, 2015.
  [doi:10.1017/CBO9781316276105](https://doi.org/10.1017/CBO9781316276105) (ISBN
  9781107111660). A master's graduate lectures, modern and opinionated, covering
  topics (interpretations, in-in formalism, Berry phase) most texts omit; for a
  reader who already knows the standard material.
- Ballentine, L. E. _Quantum Mechanics: A Modern Development_, 2nd ed., World
  Scientific, 2014. [doi:10.1142/9038](https://doi.org/10.1142/9038) (ISBN
  9789814578578). Builds QM from the statistical/ensemble interpretation and is
  careful about foundations; for the foundations-aware reader who wants the
  measurement and interpretation questions taken seriously.
