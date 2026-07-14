# Build orchestration for the verified, illustrated QM book.
# Every artifact (proofs, book HTML/PDF, blueprint) is produced through a
# target here so local and CI runs are identical (see rules/makefile.md).

SHELL := /usr/bin/env bash
# Tools installed into local venvs / homebrew must be reachable by sub-commands.
export PATH := $(CURDIR)/tools/.venv/bin:/opt/homebrew/bin:$(PATH)

BUILD := build
BOOK_OUT := $(BUILD)/book
BLUEPRINT_SRC := blueprint/src

.PHONY: help
help: ## Ask for help!
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | \
		awk 'BEGIN {FS = ":.*?## "}; \
		{printf "\033[36m%-24s\033[0m %s\n", $$1, $$2}'

# ---------------------------------------------------------------------------
# Setup (run once on a clean checkout; see DECISIONS.md ADR-0008)
# ---------------------------------------------------------------------------

.PHONY: setup
setup: setup-lean setup-tools ## Set up all build environments

.PHONY: setup-lean
setup-lean: ## Fetch the Mathlib olean cache (after `lake update` on first clone)
	lake exe cache get

.PHONY: setup-tools
setup-tools: ## Create the Python tools venv (leanblueprint, plastex)
	uv venv tools/.venv
	uv pip install --python tools/.venv/bin/python leanblueprint

# ---------------------------------------------------------------------------
# The whole artifact
# ---------------------------------------------------------------------------

.PHONY: all
all: proofs book blueprint ## Rebuild every artifact from source

.PHONY: check
check: proofs verify-no-sorry check-blueprint ## Run all verification checks

# ---------------------------------------------------------------------------
# Formal layer (Lean)
# ---------------------------------------------------------------------------

.PHONY: proofs
proofs: ## Build the verified library (QuantumBook)
	lake build QuantumBook

.PHONY: verify-no-sorry
verify-no-sorry: ## Fail if any unexpected `sorry` reaches the build
	lake build QuantumBook --wfail

# ---------------------------------------------------------------------------
# Book layer (Verso) -> HTML and PDF/TeX
# ---------------------------------------------------------------------------

.PHONY: book
book: book-html book-tex ## Build the book (HTML + TeX/PDF path)

.PHONY: book-exe
book-exe: ## Build the book renderer executable
	lake build quantumbook

.PHONY: book-html
book-html: book-exe ## Render the interactive HTML book to build/book
	.lake/build/bin/quantumbook --output $(BOOK_OUT) --with-html-multi

.PHONY: book-tex
book-tex: book-exe ## Render the book's LaTeX (PDF source) to build/book/tex
	.lake/build/bin/quantumbook --output $(BOOK_OUT) --with-tex

# ---------------------------------------------------------------------------
# Blueprint layer (leanblueprint)
# ---------------------------------------------------------------------------

.PHONY: blueprint
blueprint: blueprint-pdf blueprint-web check-blueprint ## Build blueprint PDF + web + check

.PHONY: blueprint-pdf
blueprint-pdf: ## Build the blueprint PDF (xelatex; latexmk is absent, ADR-0007)
	cd $(BLUEPRINT_SRC) && mkdir -p ../print && \
		xelatex -interaction=nonstopmode -halt-on-error -output-directory=../print print.tex && \
		xelatex -interaction=nonstopmode -halt-on-error -output-directory=../print print.tex

.PHONY: blueprint-web
blueprint-web: ## Build the blueprint web dependency graph
	leanblueprint web

.PHONY: check-blueprint
check-blueprint: proofs ## Verify blueprint \lean{} names exist (checkdecls-equivalent)
	tools/check-blueprint-decls.sh

# ---------------------------------------------------------------------------
# Housekeeping
# ---------------------------------------------------------------------------

.PHONY: clean
clean: ## Remove generated artifacts (keeps the Lean/oleans cache)
	rm -rf $(BUILD) blueprint/web blueprint/print
	rm -f $(BLUEPRINT_SRC)/print.pdf

.PHONY: lint-shell
lint-shell: ## Lint shell scripts with shellcheck
	shellcheck tools/*.sh

.PHONY: format-md
format-md: ## Format markdown files
	npx --yes prettier --write "**/*.md" --ignore-path .gitignore || true
