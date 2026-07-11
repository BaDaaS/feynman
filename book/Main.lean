/-
SPDX-License-Identifier: Apache-2.0
Executable entry point that renders the book. The build target passes options on
the command line: `--with-html-multi` for the HTML site, `--with-tex` for the
LaTeX/PDF path (see the Makefile). `destination`, `sourceLink`, and `issueLink`
default here and can be overridden on the command line.
-/
import VersoManual
import Book

open Verso.Genre.Manual

/-- Render configuration: output directory and links back to the source repo. -/
def config : RenderConfig := {
  destination := "build/book"
  sourceLink := some "https://github.com/badaas/feynman"
  issueLink := some "https://github.com/badaas/feynman/issues"
}

def main (args : List String) : IO UInt32 :=
  manualMain (%doc Book) (options := args) (config := config)
