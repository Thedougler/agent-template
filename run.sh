#!/usr/bin/env bash
# run.sh — Main entry point for the project.
# Automatically runs setup if dependencies are not installed.
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")" && pwd)"
cd "$REPO_ROOT"

# Auto-setup on first run
if [ ! -f .env ] || ! command -v pre-commit &>/dev/null; then
  echo "🔧 First run detected — running setup..."
  bash scripts/setup.sh
  echo ""
fi

# ── Your application entry point goes here ────────────────────────
echo "🚀 Ready to go! Edit run.sh to start your application."
