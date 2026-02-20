#!/usr/bin/env bash
# scripts/fix.sh — Run all formatters and auto-fixers.
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$REPO_ROOT"

echo "🔧 Running auto-fixers..."

# ── Pre-commit (auto-fix mode) ───────────────────────────────────
if command -v pre-commit &>/dev/null && [ -f .pre-commit-config.yaml ]; then
  echo "── pre-commit (fix) ──"
  pre-commit run --all-files || true
fi

# ── Add language-specific fixers below ───────────────────────────
# Example:
# if command -v ruff &>/dev/null; then
#   echo "── ruff fix ──"
#   ruff check --fix .
#   ruff format .
# fi

echo "✅ Auto-fix complete — review changes before committing."
