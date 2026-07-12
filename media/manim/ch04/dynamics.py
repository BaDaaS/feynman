# SPDX-License-Identifier: CC-BY-SA-4.0
"""ManimCE scene for Part I: unitary evolution conserves total probability.

Faithful to QuantumBook/FiniteDim/Dynamics.lean: the evolution shown is an actual
unitary (a rotation of the qubit state vector, U(t) = exp(-i t Z) style, here a
real rotation on the Bloch great circle), and the point of the animation is that
the state vector's length is invariant, so the total Born probability stays 1.
Labels are plain text (ADR-0006).

Render (from media/):
    uv run manim -qm manim/ch04/dynamics.py UnitaryConservesNormScene
"""

from __future__ import annotations

import numpy as np
from manim import (
    BLUE,
    DOWN,
    RIGHT,
    UP,
    WHITE,
    YELLOW,
    Arrow,
    Circle,
    Create,
    FadeIn,
    FadeOut,
    ORIGIN,
    Scene,
    Text,
    ValueTracker,
    VGroup,
    Write,
    always_redraw,
)

_RADIUS = 2.0  # the state is a unit vector; drawn at this on-screen radius.


class UnitaryConservesNormScene(Scene):
    """A unitary rotates the state but preserves its length (total probability).

    depicts: QuantumBook.FiniteDim.bornProb_sum_unitary
    """

    def construct(self) -> None:
        title = Text(
            "Unitary evolution: length (total probability) is conserved",
            font_size=26,
        ).to_edge(UP)
        self.play(Write(title))

        circle = Circle(radius=_RADIUS, color=WHITE)
        self.play(Create(circle))

        t = ValueTracker(0.0)

        def state_vec() -> Arrow:
            # A genuine unitary (rotation) applied to the initial state (1, 0).
            ang = t.get_value()
            rot = np.array(
                [[np.cos(ang), -np.sin(ang)], [np.sin(ang), np.cos(ang)]]
            )
            v = rot @ np.array([1.0, 0.0])
            return Arrow(
                ORIGIN,
                [_RADIUS * v[0], _RADIUS * v[1], 0.0],
                buff=0,
                color=YELLOW,
                stroke_width=6,
            )

        arrow = always_redraw(state_vec)
        self.play(FadeIn(arrow))

        norm_label = Text(
            "||psi|| = 1  throughout  =>  sum of Born probs = 1",
            font_size=24,
            color=BLUE,
        ).to_edge(DOWN)
        self.play(Write(norm_label))

        self.play(t.animate.set_value(2 * np.pi), run_time=5)
        self.wait(1)
        self.play(FadeOut(VGroup(title, circle, arrow, norm_label)))
