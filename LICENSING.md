# Licensing

This repository is **dual-licensed** (see `DECISIONS.md` ADR-0005):

| Part                                            | License          | File           |
| ----------------------------------------------- | ---------------- | -------------- |
| Lean code, build scripts, tooling               | Apache-2.0       | `LICENSE-CODE` |
| Book prose, ASCII diagrams                       | CC-BY-SA-4.0     | `LICENSE-BOOK` |

Concretely:

- **Apache-2.0** (`SPDX-License-Identifier: Apache-2.0`) covers everything under
  `QuantumBook/`, `tools/`, and the build scripts (`Makefile`, `book/Main.lean`).
- **CC-BY-SA-4.0** (`SPDX-License-Identifier: CC-BY-SA-4.0`) covers the prose:
  `book/Chapters/**`, the LaTeX in `blueprint/`, and the human-readable prose in
  `references/`.

The canonical license texts (`LICENSE-CODE`, `LICENSE-BOOK`) are the verbatim
Apache Software Foundation and Creative Commons documents. When a single file
mixes code and prose (a Verso chapter is a `.lean` file that is mostly prose),
the file carries the license of its dominant content and an SPDX header states
which.

Third-party works (Mathlib, Verso, cited literature) keep their own
licenses; we depend on and cite them, and never copy substantial copyrighted
text into the book (prompt.md invariant 7).
