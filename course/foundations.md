<!-- SPDX-License-Identifier: CC-BY-SA-4.0 -->

# The foundations track

This track treats what the formalism does *not* settle: what a measurement is,
what the state represents, and which of these questions are theorems and which are
interpretation. The course's discipline is strict here. A claim is either

- a theorem (Bell, Gleason, Kochen-Specker, no-cloning) - proven or formalizable;
  or
- an interpretive position - a clearly labeled category-3 remark that makes no
  formal claim.

The value of this track for a mathematician is to see exactly where the theorems
stop and the philosophy begins, and to refuse to blur the two. Read it alongside
the Stanford Encyclopedia entries (verified in the reading map) and Landsman's
open-access *Foundations of Quantum Theory* [`Landsman2017`].

## 1. The measurement problem, stated precisely

The postulates contain two rules for how a state changes:

1. Between measurements, unitary evolution: $\psi \mapsto U(t)\psi$, deterministic
   and reversible (M1.5).
2. At a measurement, projection ("collapse"): $\psi \mapsto P_\lambda\psi /
   \|P_\lambda\psi\|$ with probability $\|P_\lambda\psi\|^2$ (M1.3), stochastic and
   irreversible.

A measuring apparatus is itself a quantum system. If rule 1 is universal, then
system + apparatus evolve unitarily into an entangled superposition of
"pointer-reads-$\lambda$" states (M1.6), and rule 2 never triggers. If rule 2 is
fundamental, what physical process selects when it applies, and which basis? This
is the measurement problem: the two rules are not obviously consistent, and the
theory does not say where the cut between "system" and "observer" lies.

- Formalizable content: the unitary "premeasurement" that entangles system and
  apparatus is ordinary finite-dimensional linear algebra (M1.6) and can be
  proven. The *problem* is that this proof and rule 2 coexist uneasily; that
  tension is conceptual (category 3), not a contradiction in the mathematics.

Exercise (C): state the measurement problem using only M1.5 and M1.3, with no
interpretive words ("observer", "collapse", "world"). Identify which single
postulate each interpretation below alters.

## 2. What the theorems rule out

Before choosing an interpretation, know the constraints. These are the
mathematically load-bearing results, and all are strong formalization targets
because they are finite-dimensional.

- **Bell / CHSH** [`Bell1964`, `CHSH1969`] (M5.1): no local hidden-variable theory
  reproduces the quantum correlations of an entangled pair. Any interpretation
  that restores classical determinism must be nonlocal (or must deny counterfactual
  definiteness). This is a theorem about statistics, confirmed experimentally.
- **Gleason** [`Gleason1957`] (M5.2): in dimension $\geq 3$, the Born rule is the
  *only* probability assignment on projections that is additive on orthogonal
  families. Probabilities are not an extra postulate one is free to reshape.
- **Kochen-Specker** [`KochenSpecker1967`] (M5.2): in dimension $\geq 3$, one
  cannot assign definite $\{0,1\}$ values to all projections consistently with the
  functional relations. Observables cannot all have pre-existing, context-
  independent values (contextuality).
- **No-cloning** (M1.7): linearity forbids copying an unknown state - a one-line
  theorem with cryptographic consequences.

Together these say: hidden variables, if any, must be contextual and nonlocal, and
the probability rule is forced. This sharply narrows the interpretive field before
any philosophy is done.

## 3. A fair map of interpretations (category 3)

The following are interpretive positions. None is asserted by the course; each is
described by *which postulate it modifies*, which is the mathematician's useful
handle. Treated even-handedly, weighted by argument rather than popularity.

- **Copenhagen / standard**: keeps both rules; treats the measurement cut as
  pragmatic and the state as a catalogue of predictions, not a physical object.
  Modifies: nothing formally; declines to explain rule 2.
- **Everett / many-worlds**: keeps rule 1 as universal; denies rule 2 as a physical
  process (apparent collapse is branching). Modifies: removes the projection
  postulate; must recover the Born rule (an active research problem - decision-
  theoretic and self-locating-uncertainty derivations).
- **Bohmian mechanics**: adds definite particle positions guided by the
  wavefunction; recovers the statistics via equilibrium. Modifies: adds hidden
  variables (positions); is explicitly nonlocal, consistent with Bell.
- **Objective collapse (GRW, CSL)**: modifies rule 1 itself with a stochastic
  nonlinear term so macroscopic superpositions collapse spontaneously. Modifies:
  the dynamics; makes empirically distinct predictions (a virtue).
- **QBism / epistemic views**: read the state as an agent's degrees of belief;
  the Born rule as a coherence norm. Modifies: the ontic status of the state, not
  the mathematics.

The honest summary: the mathematics is interpretation-neutral; the theorems of
section 2 constrain but do not select; the choice turns on what one is willing to
add (variables), remove (collapse), or modify (dynamics).

## 4. Decoherence: what it does and does not solve

Decoherence is *not* an interpretation; it is a theorem-grade consequence of rule
1 applied to a system coupled to an environment. Tracing out the environment (M1.7)
rapidly diagonalizes the system's reduced density operator in a robust "pointer"
basis (einselection). This explains:

- why interference between macroscopically distinct states is unobservable in
  practice, and
- why a preferred (pointer) basis emerges dynamically.

It does *not* explain:

- why a single outcome occurs (it produces an improper mixture, not a selection).

So decoherence dissolves the *preferred-basis* part of the measurement problem
with mathematics (formalizable via partial trace), and leaves the *single-outcome*
part to interpretation. Marking this boundary precisely is the point.

Exercise (A): for a qubit dephasing model, compute the reduced state as a function
of time and exhibit einselection of the $\sigma_z$ basis. Exercise (C): explain why
the resulting mixture is "improper" and why that matters for the measurement
problem.

## 5. Reading and viewing

- K. Landsman, *Foundations of Quantum Theory* [`Landsman2017`] (open access) - the
  rigorous, current reference tying the theorems to the foundations.
- Stanford Encyclopedia of Philosophy: "Bell's Theorem", "Quantum Mechanics"
  (interpretations), "Philosophical Issues in Quantum Theory" - careful, sourced
  surveys (see the reading map for the verified links).
- Primary theorems: [`Bell1964`] (free), [`Gleason1957`], [`KochenSpecker1967`].

The foundations track is deliberately the one place the course speaks in
category-3 remarks at length. Everywhere else, if it can be proven, it is.
