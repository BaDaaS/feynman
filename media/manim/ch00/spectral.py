# SPDX-License-Identifier: CC-BY-SA-4.0
"""ManimCE scenes for Part 0: the finite-dimensional spectral theorem.

Faithful to the formal object in `QuantumBook/Foundations/Spectral.lean`:
the Hermitian matrix animated here is a concrete 2x2 Hermitian matrix, and the
directions shown ARE its eigenvectors. The eigenvalues drawn are its actual
(real) eigenvalues, computed with numpy the same way the Lean theorem asserts.
See the depicts-tags on each scene.

Labels use plain text (Pango), not LaTeX, so the scenes render from a clean
environment with no TeX packages. To upgrade the labels to typeset math
(MathTex), install the TeX pieces manim needs and switch Text -> MathTex:
    sudo tlmgr install standalone dvisvgm preview doublestroke
See DECISIONS.md ADR-0006.

Render (from the `media/` directory):
    uv run manim -qm manim/ch00/spectral.py SpectralDecompositionScene
"""

from __future__ import annotations

import numpy as np
from manim import (
    BLUE,
    DOWN,
    GREEN,
    ORIGIN,
    RIGHT,
    UP,
    WHITE,
    YELLOW,
    Arrow,
    Axes,
    Create,
    FadeIn,
    FadeOut,
    Scene,
    Text,
    Transform,
    VGroup,
    Write,
)

# A concrete Hermitian 2x2 matrix A = [[2, 1],[1, 2]] (real-symmetric, hence
# Hermitian). Its spectral data, computed the same way the Lean theorem asserts:
#   eigenvalues 1 and 3, eigenvectors (1,-1)/sqrt2 and (1,1)/sqrt2.
# depicts: QuantumBook.Foundations.hermitian_spectral_decomposition
A = np.array([[2.0, 1.0], [1.0, 2.0]])
_EIGVALS, _EIGVECS = np.linalg.eigh(A)  # ascending eigenvalues: [1, 3]


class SpectralDecompositionScene(Scene):
    """A = U D U*: eigenvectors are only stretched, never rotated.

    depicts: QuantumBook.Foundations.hermitian_spectral_decomposition
    """

    def construct(self) -> None:
        title = Text("Spectral theorem:  A = U D U*", font_size=34).to_edge(UP)
        self.play(Write(title))

        axes = Axes(
            x_range=[-3, 3, 1],
            y_range=[-3, 3, 1],
            x_length=6,
            y_length=6,
            tips=False,
        )
        self.play(Create(axes))

        e_lo = _EIGVECS[:, 0]  # eigenvector for lambda = 1
        e_hi = _EIGVECS[:, 1]  # eigenvector for lambda = 3

        def to_point(vec: np.ndarray) -> np.ndarray:
            return axes.c2p(vec[0], vec[1])

        lo_line = Arrow(
            to_point(-e_lo * 2.4), to_point(e_lo * 2.4),
            buff=0, color=BLUE, stroke_width=3,
        )
        hi_line = Arrow(
            to_point(-e_hi * 2.4), to_point(e_hi * 2.4),
            buff=0, color=GREEN, stroke_width=3,
        )
        eig_label = Text(
            "eigenlines: lambda_1 = 1 (blue), lambda_2 = 3 (green)",
            font_size=24,
        ).to_edge(DOWN)
        self.play(Create(lo_line), Create(hi_line), FadeIn(eig_label))

        # An eigenvector is only scaled: e_hi -> 3 * e_hi.
        v = Arrow(ORIGIN, to_point(e_hi), buff=0, color=YELLOW, stroke_width=6)
        self.play(Create(v))
        av = Arrow(
            axes.c2p(0, 0), to_point(_EIGVALS[1] * e_hi),
            buff=0, color=YELLOW, stroke_width=6,
        )
        eq = Text("A e_2 = lambda_2 . e_2", font_size=30).next_to(title, DOWN)
        self.play(Transform(v, av), Write(eq))
        self.wait(1)

        note = Text(
            "eigenvectors are only stretched, never rotated",
            font_size=24, color=WHITE,
        ).to_edge(DOWN)
        self.play(Transform(eig_label, note))
        self.wait(2)
        self.play(
            FadeOut(VGroup(title, axes, lo_line, hi_line, v, eq, eig_label))
        )


class RealSpectrumScene(Scene):
    """Observables have real spectra: eigenvalues lie on the real axis.

    depicts: QuantumBook.Foundations.selfAdjoint_eigenvalue_isReal
    """

    def construct(self) -> None:
        title = Text("Self-adjoint => real eigenvalues", font_size=34).to_edge(UP)
        self.play(Write(title))

        plane = Axes(
            x_range=[-2, 4, 1],
            y_range=[-3, 3, 1],
            x_length=7,
            y_length=6,
            tips=False,
        )
        re = Text("Re", font_size=22).next_to(plane.x_axis, RIGHT)
        im = Text("Im", font_size=22).next_to(plane.y_axis, UP)
        self.play(Create(plane), FadeIn(re), FadeIn(im))

        # The eigenvalues 1 and 3 sit on the real axis: conj(mu) = mu.
        dots = VGroup()
        for lam in _EIGVALS:
            d = Arrow(
                plane.c2p(lam, -0.06), plane.c2p(lam, 0.06),
                buff=0, color=YELLOW, stroke_width=10,
            )
            dots.add(d)
        cond = Text(
            "conj(mu) = mu   <=>   Im(mu) = 0", font_size=30,
        ).to_edge(DOWN)
        self.play(FadeIn(dots), Write(cond))
        self.wait(2)
        self.play(FadeOut(VGroup(title, plane, re, im, dots, cond)))
