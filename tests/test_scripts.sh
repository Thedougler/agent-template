#!/usr/bin/env bash
# tests/test_scripts.sh — Smoke tests for template scripts.
# Validates that all scripts exist, are executable, pass syntax checks,
# and produce expected behavior on a clean repo.
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$REPO_ROOT"

PASS=0
FAIL=0

pass() { echo "  ✅ $1"; PASS=$((PASS + 1)); }
fail() { echo "  ❌ $1"; FAIL=$((FAIL + 1)); }

echo "═══ Script Smoke Tests ═══"

# ── 1. Required scripts exist ────────────────────────────────────
echo ""
echo "── Existence ──"
for script in run.sh scripts/setup.sh scripts/lint.sh scripts/fix.sh scripts/quality.sh; do
  if [ -f "$script" ]; then
    pass "$script exists"
  else
    fail "$script missing"
  fi
done

# ── 2. Scripts are executable or at least have shebangs ──────────
echo ""
echo "── Shebangs ──"
for script in run.sh scripts/setup.sh scripts/lint.sh scripts/fix.sh scripts/quality.sh; do
  if [ -f "$script" ] && head -1 "$script" | grep -q '^#!/'; then
    pass "$script has shebang"
  else
    fail "$script missing shebang"
  fi
done

# ── 3. Syntax validation (bash -n) ──────────────────────────────
echo ""
echo "── Syntax ──"
for script in run.sh scripts/setup.sh scripts/lint.sh scripts/fix.sh scripts/quality.sh; do
  if [ -f "$script" ] && bash -n "$script" 2>/dev/null; then
    pass "$script syntax OK"
  else
    fail "$script syntax error"
  fi
done

# ── 4. Scripts use strict mode ───────────────────────────────────
echo ""
echo "── Strict mode (set -euo pipefail) ──"
for script in run.sh scripts/setup.sh scripts/lint.sh scripts/fix.sh scripts/quality.sh; do
  if [ -f "$script" ] && grep -q 'set -euo pipefail' "$script"; then
    pass "$script uses strict mode"
  else
    fail "$script missing strict mode"
  fi
done

# ── 5. Required config files exist ───────────────────────────────
echo ""
echo "── Config files ──"
for config in .env.example .pre-commit-config.yaml .editorconfig .gitignore .markdownlint.json; do
  if [ -f "$config" ]; then
    pass "$config exists"
  else
    fail "$config missing"
  fi
done

# ── 6. Required directories exist ────────────────────────────────
echo ""
echo "── Directories ──"
for dir in app data docs prompts scripts specs tasks tests .github/agents .github/skills .github/workflows; do
  if [ -d "$dir" ]; then
    pass "$dir/ exists"
  else
    fail "$dir/ missing"
  fi
done

# ── 7. Key project files exist ───────────────────────────────────
echo ""
echo "── Project files ──"
for file in README.md CONTRIBUTING.md SPEC.md LICENSE ROADMAP.md TODO.md CHANGELOG.md .github/copilot-instructions.md; do
  if [ -f "$file" ]; then
    pass "$file exists"
  else
    fail "$file missing"
  fi
done

# ── 8. SPEC.md is not empty ──────────────────────────────────────
echo ""
echo "── Content checks ──"
if [ -f SPEC.md ] && [ -s SPEC.md ]; then
  pass "SPEC.md has content"
else
  fail "SPEC.md is empty"
fi

if [ -f .github/copilot-instructions.md ] && grep -q 'Step 1' .github/copilot-instructions.md; then
  pass "copilot-instructions.md has Mandatory Completion Protocol"
else
  fail "copilot-instructions.md missing Mandatory Completion Protocol"
fi

# ── 9. At least 1 agent exists ───────────────────────────────────
AGENT_COUNT=$(find .github/agents -name '*.agent.md' 2>/dev/null | wc -l | tr -d ' ')
if [ "$AGENT_COUNT" -ge 1 ]; then
  pass "$AGENT_COUNT agent(s) found"
else
  fail "No agents found in .github/agents/"
fi

# ── 10. Skills directory is populated ─────────────────────────────
SKILL_COUNT=$(find .github/skills -name 'SKILL.md' 2>/dev/null | wc -l | tr -d ' ')
if [ "$SKILL_COUNT" -ge 10 ]; then
  pass "$SKILL_COUNT skills found"
else
  fail "Only $SKILL_COUNT skills found (expected 10+)"
fi

# ── 11. Required workflows exist ─────────────────────────────────
echo ""
echo "── Workflows ──"
for wf in ci.yml release.yml label-sync.yml auto-label.yml changelog.yml todo-sync.yml; do
  if [ -f ".github/workflows/$wf" ]; then
    pass "$wf workflow exists"
  else
    fail "$wf workflow missing"
  fi
done

# ── 12. TODO.md has marker structure ──────────────────────────────
echo ""
echo "── Tracking files ──"
if grep -q '<!-- todo-start -->' TODO.md && grep -q '<!-- todo-end -->' TODO.md; then
  pass "TODO.md has todo markers"
else
  fail "TODO.md missing todo-start/todo-end markers"
fi

if grep -q '<!-- changelog-start -->' CHANGELOG.md; then
  pass "CHANGELOG.md has changelog marker"
else
  fail "CHANGELOG.md missing changelog-start marker"
fi

# ── 13. Issue templates are YAML ──────────────────────────────────
echo ""
echo "── Issue templates ──"
for tmpl in bug_report.yml feature_request.yml task.yml; do
  if [ -f ".github/ISSUE_TEMPLATE/$tmpl" ]; then
    pass "$tmpl exists"
  else
    fail "$tmpl missing"
  fi
done

# ── Summary ──────────────────────────────────────────────────────
echo ""
TOTAL=$((PASS + FAIL))
echo "═══ Results: $PASS/$TOTAL passed, $FAIL failed ═══"

if [ $FAIL -gt 0 ]; then
  exit 1
fi
