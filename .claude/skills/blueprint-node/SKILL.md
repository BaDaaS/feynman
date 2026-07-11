---
name: blueprint-node
description: >-
  Add or edit a leanblueprint node in blueprint/src/content.tex that ties a result
  to a real Lean declaration (or flags it as frontier), then build the blueprint
  PDF / web dependency graph and run the declaration check. Use when extending the
  blueprint that tracks proven-vs-frontier.
---

# Add a blueprint node

The blueprint is the project's map of what is proven vs frontier. Every node ties
to the single source of truth in `QuantumBook/`.

## Node conventions (in `blueprint/src/content.tex`)

- Proven result:
  ```
  \begin{theorem}[Human name]
    \label{thm:my-result}
    \lean{QuantumBook.<Part>.<declName>}
    \leanok
    \uses{thm:prerequisite-label}
    Statement in LaTeX math.
  \end{theorem}
  \begin{proof}\leanok\uses{...} One-line sketch. \end{proof}
  ```
- Frontier result (not yet in Mathlib): NO `\lean{}` and NO `\leanok`; use
  `\notready` and `\uses{...}`. Add a `\begin{remark}` explaining what Mathlib
  lacks. This is how the verified/frontier line (invariant 2) is drawn in the graph.
- `\lean{Name}` must be the EXACT fully-qualified declaration name; the checker
  verifies it exists.
- `\uses{labels}` records dependency edges (proven -> proven, and proven ->
  frontier to show a generalization).

## Build and verify

- Declaration check (checkdecls-equivalent; no extra Lean dep, see ADR-0007):
  `make check-blueprint` (runs `tools/check-blueprint-decls.sh`, which `#check`s
  every `\lean{}` name against the built library). This MUST pass.
- PDF: `make blueprint-pdf` (xelatex directly; `latexmk` is absent). New theorem-
  like environments must be declared in `blueprint/src/macros/common.tex`
  (theorem, proposition, lemma, corollary, definition, remark are defined).
- Web dependency graph: `make blueprint-web` (needs the tools venv on PATH and
  `graphviz`/`dot`). Output in `blueprint/web/`.

## Keep in lockstep

- Mirror the node in `PROGRESS.md` (status table + sorry ledger) and `SCOPE.md`.
- Generated artifacts (`blueprint/web/`, `blueprint/print/`, `blueprint/lean_decls`,
  `*.paux`) are git-ignored; only the `src/` sources are tracked.
