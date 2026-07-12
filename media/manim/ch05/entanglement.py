# SPDX-License-Identifier: CC-BY-SA-4.0
"""ManimCE scene for Part I: the Bell state is entangled.

Faithful to QuantumBook/FiniteDim/Entanglement.lean: a pure product state has a
rank-1 coefficient matrix (an outer product), while the Bell state's coefficient
matrix is the identity (rank 2). The scene contrasts the two coefficient matrices,
which is exactly the argument in the Lean proof. Labels are plain text (ADR-0006).

Render (from media/):
    uv run manim -qm manim/ch05/entanglement.py EntanglementRankScene
"""

from __future__ import annotations

import numpy as np
from manim import (
    BLUE,
    DOWN,
    GREEN,
    UP,
    WHITE,
    Create,
    FadeIn,
    FadeOut,
    Scene,
    Text,
    VGroup,
    Write,
)

# Coefficient matrices: a product state (rank 1) vs the Bell state (rank 2).
_PRODUCT = np.outer([1.0, 0.0], [1.0, 0.0])  # |00>, a product: rank 1
_BELL = np.array([[1.0, 0.0], [0.0, 1.0]]) / np.sqrt(2)  # rank 2


def _matrix_mobject(mat: np.ndarray, title: str, color) -> VGroup:
    rows = []
    for r in mat:
        rows.append("  ".join(f"{x:+.2f}" for x in r))
    body = Text("\n".join(rows), font_size=28, color=color, line_spacing=1.2)
    head = Text(title, font_size=24, color=WHITE).next_to(body, UP, buff=0.3)
    rank = int(np.linalg.matrix_rank(mat, tol=1e-9))
    tag = Text(f"rank = {rank}", font_size=22, color=color).next_to(
        body, DOWN, buff=0.3
    )
    return VGroup(head, body, tag)


class EntanglementRankScene(Scene):
    """Product state = rank-1 coefficient matrix; Bell state = rank 2.

    depicts: QuantumBook.FiniteDim.bellState_isEntangled
    """

    def construct(self) -> None:
        title = Text(
            "Entanglement = excess rank of the coefficient matrix", font_size=28
        ).to_edge(UP)
        self.play(Write(title))

        prod = _matrix_mobject(_PRODUCT, "product |0>|0>", GREEN).shift(
            3.2 * np.array([-1.0, 0.0, 0.0])
        )
        bell = _matrix_mobject(_BELL, "Bell state", BLUE).shift(
            3.2 * np.array([1.0, 0.0, 0.0])
        )
        self.play(FadeIn(prod))
        self.play(FadeIn(bell))

        note = Text(
            "rank 1 = outer product = a (x) c;   rank 2 = no factorization",
            font_size=24,
            color=WHITE,
        ).to_edge(DOWN)
        self.play(Write(note))
        self.wait(2)
        self.play(FadeOut(VGroup(title, prod, bell, note)))
