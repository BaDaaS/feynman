---
name: verso-chapter
description: >-
  Author or extend a Verso book chapter in book/Chapters/ that stays coupled to
  the Lean proofs (via {docstring}), carries a portable-ASCII abstraction diagram,
  and renders to HTML and TeX. Use when adding/editing the narrated book layer.
---

# Author a Verso chapter (Manual genre)

The book is a Verso `Manual`. Chapters are Lean files that MUST reference real
declarations, so prose cannot drift from proofs.

## Structure

- One chapter per file: `book/Chapters/ChNN_Name.lean`, module
  `Chapters.ChNN_Name`.
- Header:
  ```
  import VersoManual
  import QuantumBook.<the module whose decls you cite>
  open Verso.Genre Manual
  #doc (Manual) "Chapter Title" =>
  %%%
  shortTitle := "Short"
  %%%
  ```
- Wire it up: add `{include 0 Chapters.ChNN_Name}` in `book/Book.lean`, and add the
  module name to the `Book` lib `globs` in `lakefile.toml` (imports across the
  `Chapters.*` namespace only resolve if the module is in the lib's globs).

## Couple prose to proofs

- Reference a declaration with `{docstring QuantumBook.Foundations.<name>}` - it
  renders the real signature + docstring and FAILS the build if the name is wrong.
  This is the anti-drift mechanism; use it for every theorem you discuss.
- Type-checked code examples go in a ` ```lean ` block.
- Sections use `#`, `##` headings inside the `#doc`.

## Markup gotchas

- Emphasis/bold is a SINGLE `*word*`; `**word**` triggers the
  `linter.verso.markup.emph` hint. Keep it single.
- The chapter is CC-BY-SA content: start the file with a
  `SPDX-License-Identifier: CC-BY-SA-4.0` comment.

## ASCII abstraction diagram (house style, prompt.md §6)

- Portable ASCII only: `- | + > v ^ / \`. No box-drawing Unicode.
- Arrow vocabulary: `-->` map, `==>` isomorphism, `>->` inclusion/mono, `-->>`
  surjection, `~~>` informal/physical (not proven).
- Put it in a plain ` ``` ` code block, and note the formal referent beneath:
  `-- depicts: QuantumBook.Foundations.<name>`.

## Every chapter ends with "Sources & further reading"

A curated, annotated block (one line on why each source is worth it), with links
verified per invariant 7. Cross-reference `references/reading-map.md` and
`references/sources.md`.

## Build / verify

- `make book-html` renders `build/book/html-multi/index.html`.
- `make book-tex` renders `build/book/tex/` (the PDF path).
- Confirm the coupling: `grep -rl "<your decl name>" build/book/html-multi/`.
- First build compiles Verso from source (slow); rebuilds are fast.
