#!/usr/bin/env bash
# scripts/setup.sh — Bootstrap the development environment.
# Idempotent: safe to re-run at any time.
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$REPO_ROOT"

echo "🔧 Setting up development environment..."

# ── 1. Environment file ────────────────────────────────────────────
if [ ! -f .env ]; then
  if [ -f .env.example ]; then
    cp .env.example .env
    echo "✅ Copied .env.example → .env (edit it with your local values)"
  else
    echo "⚠️  No .env.example found — skipping .env creation"
  fi
else
  echo "✅ .env already exists"
fi

# ── 2. Pre-commit ──────────────────────────────────────────────────
if command -v pre-commit &>/dev/null; then
  echo "✅ pre-commit is already installed"
else
  echo "📦 Installing pre-commit..."
  if command -v brew &>/dev/null; then
    brew install pre-commit
  elif command -v pip3 &>/dev/null; then
    pip3 install --user pre-commit
  elif command -v pip &>/dev/null; then
    pip install --user pre-commit
  else
    echo "❌ Could not install pre-commit — install manually: https://pre-commit.com/#install"
    exit 1
  fi
fi

if [ -f .pre-commit-config.yaml ]; then
  pre-commit install --install-hooks
  echo "✅ Pre-commit hooks installed"
else
  echo "⚠️  No .pre-commit-config.yaml found — skipping hook installation"
fi

# ── 3. Node tooling (optional — only if package.json exists) ──────
if [ -f package.json ]; then
  if command -v npm &>/dev/null; then
    npm install
    echo "✅ Node dependencies installed"
  fi
fi

# ── 4. Python tooling (optional — only if pyproject.toml exists) ──
if [ -f pyproject.toml ]; then
  if command -v uv &>/dev/null; then
    uv sync
    echo "✅ Python dependencies installed (uv)"
  elif command -v pip3 &>/dev/null; then
    pip3 install -e ".[dev]" 2>/dev/null || pip3 install -e .
    echo "✅ Python dependencies installed (pip)"
  fi
fi

echo ""
echo "🎉 Setup complete! Run ./run.sh to start the project."
