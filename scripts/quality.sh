#!/usr/bin/env bash
# scripts/quality.sh — Run full quality suite: lint + test.
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$REPO_ROOT"

echo "🏗️  Running full quality checks..."

EXIT_CODE=0

# ── Lint ─────────────────────────────────────────────────────────
echo ""
echo "═══ Linting ═══"
bash scripts/lint.sh || EXIT_CODE=$?

# ── Smoke tests (always run — validates template integrity) ──────
echo ""
echo "═══ Smoke Tests ═══"
if [ -f tests/test_scripts.sh ]; then
  bash tests/test_scripts.sh || EXIT_CODE=$?
else
  echo "⚠️  tests/test_scripts.sh not found — skipping smoke tests"
fi

# ── Tests (auto-detect test runner) ──────────────────────────────
echo ""
echo "═══ Tests ═══"
if [ -f pytest.ini ] || { [ -f pyproject.toml ] && grep -q '\[tool\.pytest' pyproject.toml 2>/dev/null; }; then
  pytest --tb=short -q || EXIT_CODE=$?
elif [ -f package.json ] && grep -q '"test"' package.json 2>/dev/null; then
  npm test || EXIT_CODE=$?
elif command -v pytest &>/dev/null && [ -d tests ] && [ "$(find tests -name '*.py' 2>/dev/null | head -1)" ]; then
  pytest --tb=short -q || EXIT_CODE=$?
else
  echo "ℹ️  No test runner detected — skipping tests"
  echo "   Add tests/ with pytest, or a test script in package.json"
fi

echo ""
if [ $EXIT_CODE -eq 0 ]; then
  echo "🎉 All quality checks passed!"
else
  echo "❌ Quality checks failed (exit code: $EXIT_CODE)"
fi

exit $EXIT_CODE
