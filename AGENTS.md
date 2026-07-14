# AGENTS.md

Operating reference for AI agents and contributors working in this repository.
It collects the build, verification, and authoring details an agent needs; the
human-facing overview stays in [`README.md`](README.md).

Deeper references:

- [`prompt.md`](prompt.md) - the full project constitution (mission, invariants,
  architecture, the working loop). When anything here is ambiguous, it governs.
- [`DECISIONS.md`](DECISIONS.md) - ADR-style log of design decisions.
- [`PROGRESS.md`](PROGRESS.md) / [`SCOPE.md`](SCOPE.md) - depth (frontier) and
  breadth (coverage) ledgers.
- `.claude/skills/` - encoded workflows: `lean-proof-loop`, `verso-chapter`,
  `blueprint-node`, `add-concept`.

## Hard invariants (never violate)

- Every mathematical claim is exactly one of: (1) a fully proven Lean theorem
  with **no `sorry`**; (2) a `sorry` **explicitly flagged as frontier** (not yet
  in Mathlib) and tracked as a blueprint node; (3) a clearly marked
  informal/physical remark that makes no formal claim. There is no fourth
  category and no hidden `sorry`. Finite-dimensional results must be fully proven.
- `QuantumBook/` is the single source of truth; `book/` narrates it. Book
  chapters reference real declarations via Verso `{docstring ...}`, so prose
  cannot drift from the proofs.
- Never fabricate a citation. Every reference must resolve to a verified
  canonical/archived URL, DOI, or arXiv ID; mark anything unverifiable
  `[unverified]`. Cite and paraphrase; do not reproduce substantial copyrighted
  text.

## Toolchain (pinned; see `DECISIONS.md` ADR-0001)

| Component     | Version                    | Pinned in        |
| ------------- | -------------------------- | ---------------- |
| Lean          | `leanprover/lean4:v4.31.0` | `lean-toolchain` |
| Mathlib       | `v4.31.0`                  | `lakefile.toml`  |
| Verso         | `v4.31.0`                  | `lakefile.toml`  |
| leanblueprint | latest (PyPI)              | `tools/.venv`    |

## Setup and build (from a clean checkout)

System prerequisites (provisioned via your platform package manager):
`elan`/`lake` (Lean), `uv` (Python), a TeX install with `xelatex`, and
`graphviz` (`dot`). On macOS: `brew install graphviz` plus a MacTeX/BasicTeX
install for `xelatex`.

```sh
lake update      # first clone only: resolve the Lean dependency graph
make setup       # fetch the Mathlib olean cache + create the tools venv
make all         # build every artifact (proofs, book HTML+PDF, blueprint)
make check       # verify only (proofs + no-sorry + blueprint decl check)
```

**Never let Mathlib compile from source.** `make setup` runs `lake exe cache get`
(via `make setup-lean`); if `lake build` starts building `Mathlib.*` modules, the
olean cache was not fetched - stop and run `make setup-lean` first. A from-source
Mathlib build takes an hour or more and is almost never necessary.

`make help` lists all targets. Individual layers: `make proofs`, `make book`,
`make blueprint`.

### Outputs

- Interactive HTML book: `build/book/html-multi/index.html`
- Book LaTeX/PDF source: `build/book/tex/`
- Blueprint PDF: `blueprint/print/print.pdf`; web dep-graph:
  `blueprint/web/index.html`

## Verification gates (run before declaring work done or committing)

- `make verify-no-sorry` runs `lake build --wfail` (fails on any `sorry`). A
  green `lake build` alone is not proof of completeness.
- `make check-blueprint` (`tools/check-blueprint-decls.sh`) verifies every
  blueprint `\lean{}` node names a real declaration in the built library.
- Axiom hygiene: `#print axioms <name>` must report only the benign standard
  axioms (`propext`, `Classical.choice`, `Quot.sound`); `sorryAx` or a custom
  axiom is a red flag.
- `make check-links` runs the `lychee` link checker and fails on dead links. Run
  it whenever you add or edit URLs. CI installs a pinned `lychee` and runs the
  same target; a few bot-hostile hosts are excluded in the Makefile.

## Authoring a book chapter (Verso `Manual` genre)

- Add `book/Chapters/<Name>.lean` (module `Chapters.<Name>`), then wire it in
  **two** places: an `import` + `{include 0 Chapters.<Name>}` in
  `book/Book.lean`, and the module name in the `Book` lib `globs` in
  `lakefile.toml`. Imports across `Chapters.*` only resolve if the module is in
  the globs.
- Verso markup gotchas that break the build (all learned the hard way):
  - Escape a literal `[` and `]` in prose as `\[` `\]`, or Verso parses the
    bracketed text as a link target.
  - Escape a literal `*` as `\*` (e.g. `C\*-algebra`), or it opens emphasis; a
    parse failure here also makes the doc elaborate to `sorry`.
  - Percent-encode `(` `)` inside link URLs (`%28` `%29`); a literal `)` closes
    the link early.
  - Use a single `*word*` for emphasis and `_word_` for titles; `**word**`
    triggers a linter hint.
- Reference declarations with `{docstring QuantumBook.<...>.<name>}` - it renders
  the real signature and **fails the build if the name is wrong** (this is the
  anti-drift mechanism).
- Build to verify: `make book-exe` (compiles the chapters; first build compiles
  Verso from source and is slow, later builds are fast), then `make book-html`.
- See the `verso-chapter` and `add-concept` skills for the full workflow.

## House style

- ASCII abstraction diagrams use only portable ASCII (`- | + > v ^ / \`), with
  the arrow vocabulary in `prompt.md` section 6; note the formal referent beneath
  (`-- depicts: QuantumBook.<name>`). Author names and foreign words are
  transliterated to ASCII in reference lists and prose (e.g. "Schrodinger").
- New source files carry an SPDX header naming their license (Apache-2.0 for Lean
  code and tooling, CC-BY-SA-4.0 for book prose); see `LICENSING.md`.
- CI invokes Makefile targets, not raw tool commands: if CI needs a new check,
  add the target first, then call it.
