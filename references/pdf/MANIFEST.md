# Reference PDF Manifest

These PDFs are downloaded locally for the author's own format-conversion and
study work. They are NOT committed to the public repository: `.gitignore`
excludes `references/pdf/*.pdf` (and `*.PDF`). Only open-access, arXiv, or
free author-provided copies were fetched, per the copyright rule for this
project. Copyrighted books and paywalled journal articles were NOT downloaded;
they must be obtained through institutional access (library subscription,
purchase, or interlibrary loan) using the DOI or ISBN recorded below. No
paywall was bypassed.

Each downloaded file was verified as a genuine `PDF document` (via `file`) and
is larger than 50 KB. Downloads were performed with:

    curl -fsSL --max-time 120 -A "Mozilla/5.0" -o <outfile> "<url>"

Fetched: 2026-07-11.

## Downloaded (open access / free)

| bibtex key         | title                                                          | source URL | local file | size |
| ------------------ | -------------------------------------------------------------- | ---------- | ---------- | ---- |
| Woit2017           | Quantum Theory, Groups and Representations: An Introduction     | https://www.math.columbia.edu/~woit/QM/qmbook.pdf | Woit2017.pdf | 2.3M (2363459 B) |
| Teschl2014         | Mathematical Methods in Quantum Mechanics                       | https://www.mat.univie.ac.at/~gerald/ftp/book-schroe/schroe2.pdf | Teschl2014.pdf | 1.7M (1784971 B) |
| BatesWeinstein1997 | Lectures on the Geometry of Quantization                       | https://math.berkeley.edu/~alanw/GofQ.pdf | BatesWeinstein1997.pdf | 720K (736250 B) |
| Landsman2017       | Foundations of Quantum Theory (open access, CC BY)             | https://link.springer.com/content/pdf/10.1007/978-3-319-51777-3.pdf | Landsman2017.pdf | 7.9M (7593084 B) |
| AbramskyCoecke2004 | A categorical semantics of quantum protocols (arXiv)           | https://arxiv.org/pdf/quant-ph/0402130 | AbramskyCoecke2004.pdf | 304K (310873 B) |
| BaezStay2011       | Physics, Topology, Logic and Computation: A Rosetta Stone (arXiv) | https://arxiv.org/pdf/0903.0340 | BaezStay2011.pdf | 848K (865663 B) |
| Wilde2017          | Quantum Information Theory (arXiv, "From Classical to Quantum Shannon Theory") | https://arxiv.org/pdf/1106.1445 | Wilde2017.pdf | 8.7M (8835985 B) |
| DedeckerLoreaux2025 | The continuous functional calculus in Lean (arXiv)            | https://arxiv.org/pdf/2501.15639 | DedeckerLoreaux2025.pdf | 608K (620465 B) |
| Watrous2018        | The Theory of Quantum Information (free author copy, single full-book PDF) | https://cs.uwaterloo.ca/~watrous/TQI/TQI.pdf | Watrous2018.pdf | 3.0M (2459123 B) |
| PreskillPh219      | Quantum Computation, Ph219/CS219 lecture notes (chapter-split; first 4 chapters) | https://preskill.caltech.edu/ph219/ | PreskillPh219-ch01.pdf, PreskillPh219-ch02.pdf, PreskillPh219-ch03.pdf, PreskillPh219-ch04.pdf | 256K + 368K + 424K + 416K |

Notes:

- Watrous2018 is available on the author's page as a single full-book PDF
  (`TQI.pdf`); that single file was downloaded (not the per-chapter split).
- PreskillPh219 is chapter-split on the course page. The first four chapter
  lecture-note PDFs were downloaded:
  - ch01: http://www.preskill.caltech.edu/ph229/notes/chap1.pdf
  - ch02: http://www.preskill.caltech.edu/ph219/chap2_15.pdf
  - ch03: http://www.preskill.caltech.edu/ph219/chap3_15.pdf
  - ch04: http://www.preskill.caltech.edu/ph229/notes/chap4_01.pdf

## Not downloaded (institutional access required)

Copyrighted books and paywalled journal articles. Obtain via institutional
access using the identifier below.

| bibtex key              | title                                                                 | DOI or ISBN | note |
| ----------------------- | --------------------------------------------------------------------- | ----------- | ---- |
| Heisenberg1925          | Uber quantentheoretische Umdeutung kinematischer und mechanischer Beziehungen | DOI 10.1007/BF01328377 | Paywalled journal (Z. Phys.) |
| BornHeisenbergJordan1926 | Zur Quantenmechanik. II                                              | DOI 10.1007/BF01379806 | Paywalled journal (Z. Phys.) |
| Schrodinger1926         | Quantisierung als Eigenwertproblem (Erste Mitteilung)                 | DOI 10.1002/andp.19263840404 | Paywalled journal (Ann. Phys.) |
| Born1926                | Zur Quantenmechanik der Stossvorgange                                 | DOI 10.1007/BF01397477 | Paywalled journal (Z. Phys.) |
| Dirac1958               | The Principles of Quantum Mechanics (4th ed.)                         | ISBN 978-0-19-852011-5 | Copyrighted book |
| VonNeumann2018          | Mathematical Foundations of Quantum Mechanics                         | DOI 10.1515/9781400889921 (ISBN 978-0-691-17856-1) | Copyrighted book |
| Wigner1931              | Gruppentheorie und ihre Anwendung auf die Quantenmechanik der Atomspektren | ISBN 978-0-12-750550-3 (Eng. transl.) | Copyrighted book; no DOI |
| EPR1935                 | Can Quantum-Mechanical Description of Physical Reality Be Considered Complete? | DOI 10.1103/PhysRev.47.777 | Paywalled journal (Phys. Rev.) |
| Schrodinger1935         | Die gegenwartige Situation in der Quantenmechanik                     | DOI 10.1007/BF01491891 | Paywalled journal (Naturwissenschaften) |
| CHSH1969                | Proposed Experiment to Test Local Hidden-Variable Theories            | DOI 10.1103/PhysRevLett.23.880 | Paywalled journal (Phys. Rev. Lett.) |
| Gleason1957             | Measures on the Closed Subspaces of a Hilbert Space                   | DOI 10.1512/iumj.1957.6.56050 | Paywalled journal (J. Math. Mech.) |
| KochenSpecker1967       | The Problem of Hidden Variables in Quantum Mechanics                  | DOI 10.1512/iumj.1968.17.17004 | Paywalled journal (J. Math. Mech.) |
| AharonovBohm1959        | Significance of Electromagnetic Potentials in the Quantum Theory      | DOI 10.1103/PhysRev.115.485 | Paywalled journal (Phys. Rev.) |
| Berry1984               | Quantal phase factors accompanying adiabatic changes                 | DOI 10.1098/rspa.1984.0023 | Paywalled journal (Proc. R. Soc. A) |
| Simon1983               | Holonomy, the Quantum Adiabatic Theorem, and Berry's Phase           | DOI 10.1103/PhysRevLett.51.2167 | Paywalled journal (Phys. Rev. Lett.) |
| Hall2013QTM             | Quantum Theory for Mathematicians                                    | DOI 10.1007/978-1-4614-7116-5 (ISBN 978-1-4614-7115-8) | Copyrighted book |
| Takhtajan2008           | Quantum Mechanics for Mathematicians                                 | ISBN 978-0-8218-4630-8 | Copyrighted book (AMS GSM 95) |
| ReedSimon1              | Methods of Modern Mathematical Physics I: Functional Analysis         | ISBN 978-0-12-585050-6 | Copyrighted book |
| ReedSimon2              | Methods of Modern Mathematical Physics II: Fourier Analysis, Self-Adjointness | ISBN 978-0-12-585002-5 | Copyrighted book |
| ReedSimon3              | Methods of Modern Mathematical Physics III: Scattering Theory         | ISBN 978-0-12-585003-2 | Copyrighted book |
| ReedSimon4              | Methods of Modern Mathematical Physics IV: Analysis of Operators      | ISBN 978-0-12-585004-9 | Copyrighted book |
| Moretti2017             | Spectral Theory and Quantum Mechanics (2nd ed.)                       | DOI 10.1007/978-3-319-70706-8 | Copyrighted book |
| Strocchi2008            | An Introduction to the Mathematical Structure of Quantum Mechanics    | DOI 10.1142/7038 (ISBN 978-981-283-522-2) | Copyrighted book |
| BratteliRobinson1       | Operator Algebras and Quantum Statistical Mechanics 1                 | DOI 10.1007/978-3-662-02520-8 | Copyrighted book |
| BratteliRobinson2       | Operator Algebras and Quantum Statistical Mechanics 2                 | DOI 10.1007/978-3-662-03444-6 | Copyrighted book |
| Haag1996                | Local Quantum Physics: Fields, Particles, Algebras (2nd ed.)          | DOI 10.1007/978-3-642-61458-3 | Copyrighted book |
| Emch1972                | Algebraic Methods in Statistical Mechanics and Quantum Field Theory   | ISBN 978-0-486-47209-6 | Copyrighted book (Dover reprint) |
| HallLie2015             | Lie Groups, Lie Algebras, and Representations (2nd ed.)               | DOI 10.1007/978-3-319-13467-3 | Copyrighted book |
| Sternberg1994           | Group Theory and Physics                                             | ISBN 978-0-521-24870-5 | Copyrighted book |
| Woodhouse1992           | Geometric Quantization (2nd ed.)                                     | ISBN 978-0-19-850270-8 | Copyrighted book |
| GuilleminSternberg1984  | Symplectic Techniques in Physics                                    | ISBN 978-0-521-24866-8 | Copyrighted book |
| Kirillov2004            | Lectures on the Orbit Method                                         | DOI 10.1090/gsm/064 | Copyrighted book (AMS GSM 64) |
| NielsenChuang2010       | Quantum Computation and Quantum Information (10th Anniv. ed.)         | DOI 10.1017/CBO9780511976667 (ISBN 978-1-107-00217-3) | Copyrighted book |
| CoeckeKissinger2017     | Picturing Quantum Processes                                         | DOI 10.1017/9781316219317 (ISBN 978-1-107-10422-8) | Copyrighted book |
| HeunenVicary2019        | Categories for Quantum Theory: An Introduction                       | DOI 10.1093/oso/9780198739623.001.0001 (ISBN 978-0-19-873962-3) | Copyrighted book |

## Failed / needs manual retrieval

| bibtex key | title                            | attempted URL | reason |
| ---------- | -------------------------------- | ------------- | ------ |
| Bell1964   | On the Einstein Podolsky Rosen paradox | https://journals.aps.org/ppf/pdf/10.1103/PhysicsPhysiqueFizika.1.195 | HTTP 403 from the APS server. The article is open access (DOI 10.1103/PhysicsPhysiqueFizika.1.195); retrieve manually from the APS page. No bypass attempted. |
