# Agentic Coding Template

A **repository template** that turns GitHub Copilot into a self-improving, spec-driven development partner. Clone it, run it, and let the agent build your project — while continuously evaluating and improving its own work.

> **This is a tech demo.** It shows what's possible when you give an AI agent the right infrastructure: structured methodology, quality gates, self-reflection loops, and a curated skill library. It's also a **functional template** you can fork to start real projects immediately.

## What Makes This Different

| Capability | How It Works |
|-----------|-------------|
| **Self-Improvement** | Mandatory Completion Protocol forces the agent to self-evaluate after every task — fixing scripts, expanding vague prompts, condensing verbose instructions |
| **SPEC-Driven Development** | Requirements and acceptance criteria are captured *before* code is written, then verified *after* |
| **Ralph Loops** | Iterative plan → implement → test → review → refine cycles via the `orchestrate` skill |
| **Quality Gates** | `scripts/quality.sh` + CI workflow enforce standards the agent cannot skip |
| **50+ Skills** | Modular AI capabilities from frontend design to SQL optimization, loaded on demand |
| **Self-Bootstrapping** | Missing a skill? The agent searches [prompts.chat](https://prompts.chat) and installs it at runtime |
| **GitHub-Native** | Issues, PRs, labels, milestones, and workflows — managed by the agent, not despite it |

## Quick Start

```bash
# 1. Use this template (or clone)
gh repo create my-project --template Thedougler/agent-template

# 2. Run — auto-bootstraps on first use
./run.sh

# 3. Open in VS Code with GitHub Copilot and start building
code .
```

## Repository Structure

```
├── .github/
│   ├── copilot-instructions.md   # Agent identity, protocol, conventions
│   ├── agents/                   # 3 specialized agents
│   ├── skills/                   # 50+ reusable AI capability modules
│   ├── workflows/                # CI, label sync, auto-label, releases
│   └── ISSUE_TEMPLATE/           # Bug, feature, task templates
├── app/                          # Your application code
├── data/                         # Data files
├── docs/                         # Documentation
├── prompts/                      # Custom prompts
├── scripts/
│   ├── setup.sh                  # Idempotent environment bootstrap
│   ├── lint.sh                   # Check-only linting
│   ├── fix.sh                    # Auto-fix formatting
│   └── quality.sh                # Full quality suite (lint + tests)
├── specs/                        # Specification documents
├── tasks/                        # Implementation task breakdowns
├── tests/                        # Test suites
├── run.sh                        # Main entry point
├── SPEC.md                       # Project-level specification
└── CONTRIBUTING.md               # SPEC-driven workflow guide
```

## Agents

Specialized agents reduce token usage by handling focused tasks via `runSubagent`:

| Agent | Purpose | When to Use |
|-------|---------|-------------|
| **@Context7-Expert** | Fetches live library docs via Context7 MCP | Any library/framework question — never relies on training data |
| **@Universal Janitor** | Eliminates tech debt, dead code, unused deps | Cleanup and simplification passes |
| **@Playwright Tester** | Explores sites then generates Playwright tests | E2E and integration testing |

## Key Skills

The template ships with 50+ skills. Here are the ones that power the core agentic loop:

| Skill | What It Does |
|-------|-------------|
| `orchestrate` | Manages the plan → code → review ralph loop |
| `agentic-eval` | Self-critique, reflection loops, rubric-based scoring |
| `spec-driven-development` | SPEC methodology: plan → implement → test → review |
| `git-commit` | Conventional Commits with intelligent staging |
| `refactor` | Surgical code improvement without behavior changes |
| `skill-lookup` | Discovers and installs new skills from prompts.chat |
| `feature-design-assistant` | Collaborative feature design through dialogue |
| `task-coordination-strategies` | Multi-agent task decomposition and dependency management |

## Scripts

All scripts are idempotent, use `set -euo pipefail`, and auto-detect the project stack:

| Script | Purpose |
|--------|---------|
| `./run.sh` | Entry point — auto-runs `setup.sh` on first use |
| `scripts/setup.sh` | Bootstrap: `.env`, pre-commit, npm/pip/uv deps |
| `scripts/lint.sh` | Check-only: pre-commit hooks + markdownlint |
| `scripts/fix.sh` | Auto-fix: formatting and style issues |
| `scripts/quality.sh` | Full gate: lint + tests — runs before every commit |

## The Agentic Loop

Every task the agent performs follows the **Mandatory Completion Protocol**:

```
Step 0 — Do the work
         Complete the user's actual request.

Step 1 — Self-reflect & improve
         Did scripts break? Fix them.
         Were prompts too vague? Expand them.
         Were instructions too verbose? Condense them.
         Missing tests? Add them.

Step 2 — Commit clean
         Run quality.sh → fix issues → commit with Conventional Commits.
```

This creates a **continuous improvement flywheel**: every task the agent completes also improves the infrastructure for the next task.

## SPEC-Driven Development

The methodology that keeps the agent aligned with intent:

1. **Spec** — Define what to build in `specs/SPEC-###-description.md`
2. **Plan** — Break it into tasks in `tasks/TASK-###-#-description.md`
3. **Implement** — One task at a time, atomic commits
4. **Test** — Validate against acceptance criteria
5. **Review** — Spec compliance + code quality
6. **PR** — Link spec, list tasks, include test results

Templates for both specs and tasks are included. See [CONTRIBUTING.md](CONTRIBUTING.md) for the full workflow.

## Customization

This template is **stack-agnostic**. When you add your first `package.json` or `pyproject.toml`, the scripts auto-detect it and install dependencies. Pre-commit hooks for language-specific linters (ruff, shellcheck, markdownlint) are pre-configured but commented out — uncomment what you need in `.pre-commit-config.yaml`.

The agent will also self-adapt: if it encounters a missing skill, it searches for and installs one. If a script breaks, it fixes it. If an instruction is too vague, it expands it.

## License

[MIT](LICENSE)
