#!/usr/bin/env bash
# scripts/lint.sh — Run all linters (check-only, no auto-fix).
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$REPO_ROOT"

echo "🔍 Running linters..."

EXIT_CODE=0

# ── Pre-commit (all hooks, no auto-fix) ──────────────────────────
if command -v pre-commit &>/dev/null && [ -f .pre-commit-config.yaml ]; then
  echo "── pre-commit ──"
  pre-commit run --all-files || EXIT_CODE=$?
fi

# ── Markdown lint ────────────────────────────────────────────────
if command -v markdownlint &>/dev/null; then
  echo "── markdownlint ──"
  markdownlint '**/*.md' --config .markdownlint.json || EXIT_CODE=$?
fi

# ── Add language-specific linters below ──────────────────────────
# Example:
# if command -v ruff &>/dev/null; then
#   echo "── ruff ──"
#   ruff check . || EXIT_CODE=$?
# fi

if [ $EXIT_CODE -eq 0 ]; then
  echo "✅ All linters passed"
else
  echo "❌ Some linters reported issues (exit code: $EXIT_CODE)"
fi

exit $EXIT_CODE
