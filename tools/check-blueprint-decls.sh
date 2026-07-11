#!/usr/bin/env bash
# checkdecls-equivalent: verify every \lean{Name} referenced in the blueprint is
# a real declaration in the built QuantumBook library. This is what ties blueprint
# nodes to the single source of truth (prompt.md invariant 3). We use
# `lake env lean` with `#check` rather than the `checkdecls` executable so no extra
# Lean dependency is required (see DECISIONS.md ADR-0007).
set -euo pipefail

cd "$(dirname "$0")/.."

# Skip LaTeX comment lines (starting with %) so example \lean{} in docs is ignored.
names=$(grep -rh --include='*.tex' -vE '^[[:space:]]*%' blueprint/src \
  | grep -oE '\\lean\{[^}]+\}' \
  | sed -E 's/\\lean\{([^}]+)\}/\1/' | sort -u)

if [ -z "$names" ]; then
  echo "No \\lean{} declarations found in blueprint/src."
  exit 0
fi

tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT
f="$tmp/CheckBlueprintDecls.lean"
{
  echo "import QuantumBook"
  while IFS= read -r n; do
    [ -n "$n" ] && echo "#check @$n"
  done <<< "$names"
} > "$f"

echo "Checking blueprint declarations against the built QuantumBook library:"
echo "$names" | awk '{print "  - " $0}'

if lake env lean "$f" >/dev/null; then
  echo "OK: all blueprint \\lean{} declarations exist."
else
  echo "FAIL: one or more blueprint \\lean{} declarations do not exist." >&2
  exit 1
fi
