# SPDX-License-Identifier: CC-BY-SA-4.0
"""ManimCE scenes for Part I: the qubit and the Pauli operators.

Faithful to QuantumBook/FiniteDim/Qubit.lean: the eigenvalues drawn (+1, -1) are
the actual eigenvalues of sigmaZ, computed with numpy from the same matrix the
Lean theorems are about, and the X-flip shown is the action of sigmaX on the
computational basis. Labels are plain text (no LaTeX); see DECISIONS.md ADR-0006.

Render (from media/):
    uv run manim -qm manim/ch01/qubit.py BlochPolesScene
"""

from __future__ import annotations

import numpy as np
from manim import (
    BLUE,
    DOWN,
    GREEN,
    RED,
    UP,
    WHITE,
    YELLOW,
    Arrow,
    Circle,
    Create,
    Dot,
    FadeIn,
    FadeOut,
    Indicate,
    ORIGIN,
    Scene,
    Text,
    Transform,
    VGroup,
    Write,
)

# The Pauli operators, exactly as in the Lean file.
SIGMA_X = np.array([[0, 1], [1, 0]], dtype=complex)
SIGMA_Z = np.array([[1, 0], [0, -1]], dtype=complex)
_Z_EIGVALS = np.linalg.eigvalsh(SIGMA_Z)  # [-1, +1]


class BlochPolesScene(Scene):
    """The sigma_z observable: eigenvalues +1 and -1 at the Bloch poles.

    depicts: QuantumBook.FiniteDim.sigmaZ_sq  (an involution has eigenvalues +-1)
    """

    def construct(self) -> None:
        title = Text("sigma_z: two outcomes, +1 and -1", font_size=32).to_edge(UP)
        self.play(Write(title))

        # A 2D slice of the Bloch sphere.
        sphere = Circle(radius=2.0, color=WHITE)
        self.play(Create(sphere))

        north = Dot(sphere.get_top(), color=GREEN)
        south = Dot(sphere.get_bottom(), color=BLUE)
        ket0 = Text("|0>  (eigenvalue +1)", font_size=24, color=GREEN).next_to(
            north, UP
        )
        ket1 = Text("|1>  (eigenvalue -1)", font_size=24, color=BLUE).next_to(
            south, DOWN
        )
        self.play(FadeIn(north), FadeIn(south), Write(ket0), Write(ket1))

        vals = Text(
            f"eig(sigma_z) = {{{int(_Z_EIGVALS[1])}, {int(_Z_EIGVALS[0])}}}",
            font_size=26,
            color=YELLOW,
        ).to_edge(DOWN)
        self.play(Write(vals))
        self.play(Indicate(north), Indicate(south))
        self.wait(2)
        self.play(FadeOut(VGroup(title, sphere, north, south, ket0, ket1, vals)))


class PauliFlipScene(Scene):
    """sigma_x is the bit flip: it swaps |0> and |1>.

    depicts: QuantumBook.FiniteDim.sigmaX  (and sigmaX_sq: two flips = identity)
    """

    def construct(self) -> None:
        title = Text("sigma_x: the bit flip", font_size=32).to_edge(UP)
        self.play(Write(title))

        up_arrow = Arrow(ORIGIN, UP * 2, color=GREEN, buff=0)
        label0 = Text("|0>", font_size=28, color=GREEN).next_to(up_arrow, UP)
        self.play(Create(up_arrow), Write(label0))
        self.wait(1)

        down_arrow = Arrow(ORIGIN, DOWN * 2, color=BLUE, buff=0)
        label1 = Text("|1>", font_size=28, color=BLUE).next_to(down_arrow, DOWN)
        note = Text(
            "sigma_x |0> = |1>,   sigma_x |1> = |0>", font_size=26, color=RED
        ).to_edge(DOWN)
        self.play(
            Transform(up_arrow, down_arrow),
            Transform(label0, label1),
            Write(note),
        )
        self.wait(1)
        # Two flips = identity (sigmaX_sq).
        note2 = Text(
            "two flips = identity  (sigma_x squared = I)",
            font_size=26,
            color=WHITE,
        ).to_edge(DOWN)
        self.play(Transform(note, note2))
        self.wait(2)
        self.play(FadeOut(VGroup(title, up_arrow, label0, note)))
