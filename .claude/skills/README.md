<!-- SPDX-License-Identifier: Apache-2.0 -->

# Project skills

Claude Code skills that encode this repository's repeatable workflows and its hard
invariants (`prompt.md` §2, §5, §9). They keep long-horizon, multi-session work
consistent. Invoke a skill by name (e.g. `/add-concept`).

- **add-concept** - the flagship loop: drive one new concept through all four
  layers (Lean proof, Verso chapter, Manim scene, provenance) and the blueprint,
  preserving the verified/frontier discipline. Orchestrates the others.
- **lean-proof-loop** - search Mathlib (v4.31.0) for existing results, verify decl
  names before use, prove or frontier-flag, and gate on no-sorry + an axiom check.
- **verso-chapter** - author a Verso chapter coupled to the proofs via
  `{docstring}`, with a portable-ASCII diagram and a sources block.
- **manim-scene** - add a ManimCE scene faithful to the formal object, plus a
  narration entry.
- **blueprint-node** - add/lint a blueprint node (proven `\leanok` or frontier
  `\notready`) and run the declaration check.

Keep these in lockstep with `DECISIONS.md` and the Makefile targets they cite; a
stale skill is a bug (see ADR-0010).
