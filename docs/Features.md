# Features

Detailed breakdown of every capability the Agentic Coding Template provides.

## Self-Improvement Protocol

Every task the agent performs ends with a **Mandatory Completion Protocol** — a structured self-evaluation that fixes problems before they compound:

| Step | Action | Detail |
| ---- | ------ | ------ |
| **0** | Do the work | Complete the user's actual request |
| **1** | Self-reflect | Fix broken scripts, expand vague prompts, condense verbose instructions, add missing tests |
| **2** | Commit clean | Run `quality.sh`, fix issues, commit with Conventional Commits |

This creates a **continuous improvement flywheel**: every task also improves the infrastructure for the next task.

## SPEC-Driven Development

Requirements and acceptance criteria are captured _before_ code is written, then verified _after_:

1. **Spec** — Define what to build in `specs/SPEC-###-description.md`
2. **Plan** — Break it into tasks in `tasks/TASK-###-#-description.md`
3. **Implement** — One task at a time, atomic commits
4. **Test** — Validate against acceptance criteria
5. **Review** — Spec compliance + code quality
6. **PR** — Link spec, list tasks, include test results

Templates for both specs and tasks are included. See [CONTRIBUTING.md](../CONTRIBUTING.md) for the full workflow.

## Agents

Specialized agents reduce token usage by handling focused tasks:

### @Context7-Expert

Fetches live library documentation via the Context7 MCP server. Use this for any library or framework question — the agent pulls current docs rather than relying on training data.

### @Universal Janitor

Eliminates tech debt, dead code, and unused dependencies. Run this during cleanup and simplification passes to keep the codebase lean.

### @Playwright Tester

Explores websites and generates Playwright test suites. Use for end-to-end and integration testing of web applications.

## Skills Library (50+)

Modular AI capability modules loaded on demand from `.github/skills/`. Each skill is a `SKILL.md` with YAML frontmatter and structured instructions.

### Core Agentic Skills

| Skill | What It Does |
| ----- | ------------ |
| `orchestrate` | Manages the plan → code → review loop (Ralph loops) |
| `agentic-eval` | Self-critique, reflection loops, rubric-based scoring |
| `spec-driven-development` | Full SPEC methodology lifecycle |
| `git-commit` | Conventional Commits with intelligent staging |
| `refactor` | Surgical code improvement without behavior changes |
| `skill-lookup` | Discovers and installs new skills from [prompts.chat](https://prompts.chat) |
| `feature-design-assistant` | Collaborative feature design through dialogue |
| `task-coordination-strategies` | Multi-agent task decomposition and dependency management |

### Frontend & Design

| Skill | What It Does |
| ----- | ------------ |
| `frontend-design` | Production-grade UI with high design quality |
| `tailwindcss-development` | Tailwind CSS v4 utilities and patterns |
| `tailwind-patterns` | Responsive layouts, cards, navigation, forms |
| `responsive-design` | Container queries, fluid typography, CSS Grid |
| `alpinejs` | AlpineJS best practices and patterns |
| `htmx-expert` | Server-driven HTMX UI architecture |
| `pwa-manifest-generator` | Progressive Web App manifest generation |

### Backend & Data

| Skill | What It Does |
| ----- | ------------ |
| `python-pro` | Modern Python 3.12+ with async, uv, ruff, pydantic |
| `fastapi-templates` | Production-ready FastAPI project scaffolding |
| `django-verification` | Django verification loop: migrations, tests, security |
| `sql-optimization-patterns` | Query optimization, indexing, EXPLAIN analysis |

### AI & Machine Learning

| Skill | What It Does |
| ----- | ------------ |
| `ai-engineer` | Production LLM apps and advanced RAG systems |
| `embedding-strategies` | Embedding model selection and chunking strategies |
| `multimodal-models` | CLIP, Whisper, Stable Diffusion, speech-to-text |
| `on-device-ai` | Browser AI with WebGPU, Transformers.js, ONNX |
| `openrouter-sdk-patterns` | OpenRouter integration patterns |

### Testing & Quality

| Skill | What It Does |
| ----- | ------------ |
| `playwright-skill` | Complete browser automation and test scripting |
| `webapp-testing` | Local web app testing with Playwright |
| `web-design-reviewer` | Visual inspection and design issue detection |
| `chrome-devtools` | Browser debugging and performance analysis |

### Mobile

| Skill | What It Does |
| ----- | ------------ |
| `mobile-design` | Mobile-first design for iOS and Android |
| `mobile-android-design` | Material Design 3 and Jetpack Compose |

### Self-Bootstrapping

Missing a skill? The agent uses the `skill-lookup` skill to search [prompts.chat](https://prompts.chat) and install new capabilities at runtime. No manual intervention needed.

## Scripts

All scripts are idempotent, use `set -euo pipefail`, and auto-detect the project stack:

| Script | Purpose |
| ------ | ------- |
| `./run.sh` | Entry point — auto-runs `setup.sh` on first use |
| `scripts/setup.sh` | Bootstrap: `.env`, pre-commit, npm/pip/uv deps |
| `scripts/lint.sh` | Check-only: pre-commit hooks + markdownlint |
| `scripts/fix.sh` | Auto-fix: formatting and style issues |
| `scripts/quality.sh` | Full gate: lint + tests — runs before every commit |

### Stack Auto-Detection

`scripts/setup.sh` detects the stack automatically:

- `package.json` → `npm install`
- `pyproject.toml` → `uv sync` (preferred) or `pip install -e ".[dev]"`
- Always installs `pre-commit` hooks if `.pre-commit-config.yaml` exists

## GitHub-Native Workflows

The template includes GitHub Actions workflows and configuration for:

- **CI** — Runs quality checks on pull requests
- **Label Sync** — Keeps labels consistent via `labels.yml`
- **Auto-Label** — Automatically labels PRs based on changed paths via `labeler.yml`
- **Releases** — Automated release workflow
- **Issue Templates** — Bug report, feature request, and task templates
- **PR Template** — Structured pull request format

## Customization

This template is **stack-agnostic**. When you add your first `package.json` or `pyproject.toml`, the scripts auto-detect it and install dependencies. Pre-commit hooks for language-specific linters (ruff, shellcheck, markdownlint) are pre-configured but commented out — uncomment what you need in `.pre-commit-config.yaml`.

The agent will also self-adapt: if it encounters a missing skill, it searches for and installs one. If a script breaks, it fixes it. If an instruction is too vague, it expands it.
