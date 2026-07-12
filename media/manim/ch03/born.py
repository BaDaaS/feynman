# SPDX-License-Identifier: CC-BY-SA-4.0
"""ManimCE scene for Part I: the Born rule as a probability distribution.

Faithful to QuantumBook/FiniteDim/Born.lean: the two bars are the actual Born
probabilities |<0|psi>|^2 and |<1|psi>|^2 of a concrete qubit state psi in the
sigma_z eigenbasis, computed with numpy; they sum to 1 (Parseval). Labels are
plain text (ADR-0006).

Render (from media/):
    uv run manim -qm manim/ch03/born.py BornDistributionScene
"""

from __future__ import annotations

import numpy as np
from manim import (
    BLUE,
    DOWN,
    GREEN,
    LEFT,
    RIGHT,
    UP,
    WHITE,
    YELLOW,
    Create,
    FadeIn,
    FadeOut,
    Line,
    Rectangle,
    Scene,
    Text,
    VGroup,
    Write,
)

# A concrete qubit state on the Bloch great circle, and its Born probabilities in
# the computational (sigma_z eigen) basis.
_THETA = np.pi / 3
_PSI = np.array([np.cos(_THETA / 2), np.sin(_THETA / 2)], dtype=complex)
_BASIS = [np.array([1, 0], dtype=complex), np.array([0, 1], dtype=complex)]
_P = [abs(np.vdot(e, _PSI)) ** 2 for e in _BASIS]  # sums to 1


class BornDistributionScene(Scene):
    """Born probabilities of a qubit state in the sigma_z basis sum to 1.

    depicts: QuantumBook.FiniteDim.bornProb_sum_eq_one
    """

    def construct(self) -> None:
        title = Text("Born rule: probabilities sum to 1", font_size=32).to_edge(UP)
        self.play(Write(title))

        # A baseline and a "probability = 1" reference line.
        base = Line(LEFT * 4, RIGHT * 4, color=WHITE).shift(DOWN * 2.5)
        one_line = Line(
            LEFT * 4, RIGHT * 4, color=YELLOW
        ).shift(DOWN * 2.5 + UP * 4.0)
        one_label = Text("p = 1", font_size=22, color=YELLOW).next_to(
            one_line, RIGHT
        )
        self.play(Create(base), Create(one_line), FadeIn(one_label))

        max_h = 4.0
        colors = [GREEN, BLUE]
        labels = ["p(0) = |<0|psi>|^2", "p(1) = |<1|psi>|^2"]
        bars = VGroup()
        texts = VGroup()
        for k, (p, col, lab) in enumerate(zip(_P, colors, labels)):
            bar = Rectangle(width=1.4, height=max_h * p, color=col, fill_opacity=0.7)
            bar.move_to(base.get_center() + LEFT * 2.0 + RIGHT * 4.0 * k)
            bar.align_to(base, DOWN)
            val = Text(f"{lab} = {p:.2f}", font_size=20, color=col).next_to(
                bar, UP, buff=0.1
            )
            bars.add(bar)
            texts.add(val)
        self.play(*[Create(b) for b in bars], *[Write(t) for t in texts])

        total = Text(
            f"p(0) + p(1) = {_P[0]:.2f} + {_P[1]:.2f} = {sum(_P):.2f}",
            font_size=26,
            color=WHITE,
        ).to_edge(DOWN)
        self.play(Write(total))
        self.wait(2)
        self.play(
            FadeOut(VGroup(title, base, one_line, one_label, bars, texts, total))
        )
