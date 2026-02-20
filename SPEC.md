# SPEC-000: Agentic Coding Template

> **Status**: Complete
> **Author**: @Thedougler
> **Created**: 2026-02-20

## Overview

A stack-agnostic repository template that bootstraps AI-agent-driven software development. The template provides the infrastructure — skills, agents, scripts, specs, and workflows — so that a GitHub Copilot agent can self-improve, self-evaluate, and iteratively develop a project from an empty scaffold to a production-ready codebase.

This is both a **functional starting point** for real projects and a **tech demo** of what agentic coding looks like when done right.

## User Intent

Developers want to start a new project and immediately benefit from:

1. An AI agent that follows a structured development methodology (SPEC-driven)
2. Self-improvement loops (agentic self-evaluation, Ralph loops, prompt refinement)
3. Quality gates that the agent enforces on itself (linting, testing, CI)
4. A curated library of reusable skills the agent can invoke as needed
5. GitHub-native workflows (Issues, PRs, labels, milestones) managed by the agent
6. Zero manual setup — the template self-bootstraps on first run

## Requirements

### Functional

1. The template MUST provide a `run.sh` entry point that auto-bootstraps the environment on first use
2. The template MUST include idempotent setup, lint, fix, and quality scripts
3. The template MUST include a `copilot-instructions.md` that defines agent identity, completion protocol, and project conventions
4. The template MUST include a Mandatory Completion Protocol (Step 0: do the work → Step 1: self-reflect → Step 2: commit clean)
5. The template MUST include the SPEC-driven development methodology with spec and task templates
6. The template MUST include at least 3 specialized agents (documentation lookup, code cleanup, testing)
7. The template MUST include a curated skill library with 50+ reusable AI capability modules
8. The template MUST include GitHub Actions workflows for label sync, auto-labeling, and releases
9. The template MUST include issue templates and PR templates for GitHub-native project management
10. The template SHOULD include a CI workflow that runs quality checks on pull requests
11. The template SHOULD include pre-commit hooks for baseline code quality

### Non-Functional

- **Portability**: Must work on macOS, Linux, and Windows (WSL) with no stack-specific assumptions
- **Idempotency**: All scripts must be safe to re-run without side effects
- **Extensibility**: Skills, agents, and workflows must be addable without modifying core files
- **Token Efficiency**: Agent instructions must be dense and precise — verbose prompts waste tokens and degrade performance
- **Self-Healing**: When scripts break, the agent's first priority is fixing them, not working around them

## Acceptance Criteria

- [x] `./run.sh` bootstraps a fresh clone with no manual intervention
- [x] `scripts/setup.sh` detects and installs dependencies for Python (uv/pip) and Node (npm)
- [x] `scripts/lint.sh` runs pre-commit hooks and markdownlint
- [x] `scripts/fix.sh` auto-corrects formatting issues
- [x] `scripts/quality.sh` runs the full lint + test suite
- [x] `.github/copilot-instructions.md` defines agent identity and Mandatory Completion Protocol
- [x] SPEC and TASK templates exist in `specs/` and `tasks/`
- [x] 3 agents defined: Context7-Expert, Universal Janitor, Playwright Tester
- [x] 50+ skills available in `.github/skills/`
- [x] GitHub Actions: label-sync, auto-label, release workflows present
- [x] Issue templates: bug report, feature request, task
- [x] PR template with checklist
- [x] CI workflow runs quality checks on PRs
- [x] Pre-commit hooks enforce baseline quality (trailing whitespace, YAML/JSON validation, merge conflict detection, private key detection)
- [x] `.env.example`, `.editorconfig`, `.gitattributes`, `.gitignore` configured
- [x] README documents the template's value, structure, and usage

## Architecture

```
agent-template/
├── .github/
│   ├── copilot-instructions.md    # Agent brain — identity + protocol + conventions
│   ├── agents/                    # Specialized agent definitions
│   ├── skills/                    # 50+ reusable AI capability modules
│   ├── workflows/                 # CI, label sync, releases
│   ├── ISSUE_TEMPLATE/            # Bug, feature, task templates
│   └── PULL_REQUEST_TEMPLATE.md   # PR checklist
├── app/                           # Your application code (empty scaffold)
├── data/                          # Data files (empty scaffold)
├── docs/                          # Documentation (empty scaffold)
├── prompts/                       # Custom prompts (empty scaffold)
├── scripts/                       # setup, lint, fix, quality
├── specs/                         # Specification documents
├── tasks/                         # Implementation task breakdowns
├── tests/                         # Test suites (empty scaffold)
├── run.sh                         # Main entry point
├── SPEC.md                        # This file — project-level specification
├── CONTRIBUTING.md                # SPEC-driven workflow guide
└── README.md                      # Template documentation
```

### Key Patterns

| Pattern | Implementation | Purpose |
|---------|---------------|---------|
| **Ralph Loop** | `orchestrate` skill | Plan → implement → test → review → refine cycle |
| **Self-Evaluation** | `agentic-eval` skill + Mandatory Completion Protocol | Agent critiques own output before committing |
| **SPEC-Driven Development** | `spec-driven-development` skill + templates | Captures intent, requirements, and acceptance criteria before coding |
| **Skill System** | `.github/skills/*/SKILL.md` | Modular, discoverable AI capabilities loaded on demand |
| **Quality Gates** | `scripts/quality.sh` + CI workflow | Automated enforcement of code standards |
| **Self-Bootstrapping** | `skill-lookup` skill | Agent discovers and installs missing capabilities at runtime |

## Out of Scope

- Application code — the template provides infrastructure only; `app/` starts empty
- Language-specific tooling — added by the agent when a stack is chosen
- Deployment pipelines — added per-project based on target platform
- Authentication/secrets management beyond `.env.example` patterns

## References

- [CONTRIBUTING.md](CONTRIBUTING.md) — Developer workflow guide
- [.github/copilot-instructions.md](.github/copilot-instructions.md) — Agent configuration
- [prompts.chat](https://prompts.chat) — Skill registry for discovering new capabilities
