#!/usr/bin/env bash
# Pre-flight validation — run before committing or opening a PR.
# Checks structure, spec format, and trailing whitespace.
# Usage: ./scripts/validate.sh
set -euo pipefail

ERRORS=0

check() {
  if ! "$@" > /dev/null 2>&1; then
    echo "FAIL: $*" >&2
    ERRORS=$((ERRORS + 1))
  fi
}

echo "--- Structure ---"
for dir in .github/agents .github/workflows .github/ISSUE_TEMPLATE specs tasks; do
  if [ -d "$dir" ]; then
    echo "  OK   $dir/"
  else
    echo "  MISS $dir/" >&2
    ERRORS=$((ERRORS + 1))
  fi
done

for file in README.md specs/README.md specs/SPEC_TEMPLATE.md tasks/README.md tasks/TASK_TEMPLATE.md .github/PULL_REQUEST_TEMPLATE.md; do
  if [ -f "$file" ]; then
    echo "  OK   $file"
  else
    echo "  MISS $file" >&2
    ERRORS=$((ERRORS + 1))
  fi
done

echo "--- Spec format ---"
for spec in specs/SPEC-[0-9]*.md; do
  [ -f "$spec" ] || continue
  MISSING=""
  for section in "## Overview" "## Requirements" "## Acceptance Criteria" "## Status"; do
    grep -q "$section" "$spec" || MISSING="$MISSING $section"
  done
  if [ -z "$MISSING" ]; then
    echo "  OK   $(basename "$spec")"
  else
    echo "  MISS $(basename "$spec"):$MISSING" >&2
    ERRORS=$((ERRORS + 1))
  fi
done

echo "--- Trailing whitespace ---"
if git grep -I --line-number '[[:space:]]$' -- '*.md' '*.yml' '*.yaml' '*.json' 2>/dev/null; then
  echo "  Found trailing whitespace (see above)" >&2
  ERRORS=$((ERRORS + 1))
else
  echo "  OK   No trailing whitespace"
fi

echo ""
if [ "$ERRORS" -gt 0 ]; then
  echo "RESULT: $ERRORS problem(s) found"
  exit 1
else
  echo "RESULT: All checks passed"
fi
