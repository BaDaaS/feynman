# SPDX-License-Identifier: CC-BY-SA-4.0
"""ManimCE scene for Part I: observables have real expectation values.

Faithful to QuantumBook/FiniteDim/Observable.lean: the expectation is
<x, A x> for a self-adjoint A, and the animation samples the actual expectation
of the Pauli-Z observable over the Bloch circle (numpy), showing the value is
always real (it stays on the real line). Labels are plain text (ADR-0006).

Render (from media/):
    uv run manim -qm manim/ch02/observable.py ExpectationRealScene
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
    Axes,
    Create,
    Dot,
    FadeIn,
    FadeOut,
    Scene,
    Text,
    ValueTracker,
    VGroup,
    Write,
    always_redraw,
)

# The Pauli-Z observable; self-adjoint, so <psi, Z psi> is real for every state.
SIGMA_Z = np.array([[1, 0], [0, -1]], dtype=complex)


def expectation_z(theta: float) -> complex:
    """<psi, Z psi> for the Bloch state psi(theta) = (cos, sin) on the great
    circle through |0>, |1>. Self-adjointness forces the imaginary part to 0."""
    psi = np.array([np.cos(theta / 2), np.sin(theta / 2)], dtype=complex)
    return np.vdot(psi, SIGMA_Z @ psi)


class ExpectationRealScene(Scene):
    """<x, A x> stays on the real axis as the state varies (A = sigma_z).

    depicts: QuantumBook.FiniteDim.expectation_isReal
    """

    def construct(self) -> None:
        title = Text(
            "Self-adjoint => expectation is real", font_size=30
        ).to_edge(UP)
        self.play(Write(title))

        plane = Axes(
            x_range=[-1.5, 1.5, 0.5],
            y_range=[-1.5, 1.5, 0.5],
            x_length=6,
            y_length=6,
            tips=False,
        )
        re = Text("Re", font_size=22).next_to(plane.x_axis, RIGHT)
        im = Text("Im", font_size=22).next_to(plane.y_axis, UP)
        self.play(Create(plane), FadeIn(re), FadeIn(im))

        theta = ValueTracker(0.0)

        def make_dot() -> Dot:
            val = expectation_z(theta.get_value())
            return Dot(plane.c2p(val.real, val.imag), color=YELLOW, radius=0.09)

        dot = always_redraw(make_dot)
        label = Text(
            "<psi, sigma_z psi>  (imaginary part = 0)",
            font_size=24,
            color=BLUE,
        ).to_edge(DOWN)
        self.play(FadeIn(dot), Write(label))

        # Sweep the state; the expectation slides along the real axis, never off it.
        self.play(theta.animate.set_value(np.pi), run_time=3)
        self.play(theta.animate.set_value(2 * np.pi), run_time=3)
        self.wait(1)
        self.play(FadeOut(VGroup(title, plane, re, im, dot, label)))
