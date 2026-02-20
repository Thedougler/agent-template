# Agentic Coding Template

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![GitHub Issues](https://img.shields.io/github/issues/Thedougler/agent-template)](https://github.com/Thedougler/agent-template/issues)
[![GitHub Stars](https://img.shields.io/github/stars/Thedougler/agent-template)](https://github.com/Thedougler/agent-template/stargazers)

A **repository template** that turns GitHub Copilot into a self-improving, spec-driven development partner. Clone it, run it, and let the agent build your project — while continuously evaluating and improving its own work.

> **This is a tech demo.** It shows what's possible when you give an AI agent the right infrastructure: structured methodology, quality gates, self-reflection loops, and a curated skill library. It's also a **functional template** you can fork to start real projects immediately.

---

## Table of Contents

- [Highlights](#highlights)
- [Quick Start](#quick-start)
- [How It Works](#how-it-works)
- [Repository Structure](#repository-structure)
- [Documentation](#documentation)
- [Contributing](#contributing)
- [License](#license)

## Highlights

- **Self-Improvement** — Mandatory Completion Protocol forces the agent to self-evaluate after every task
- **SPEC-Driven Development** — Requirements captured _before_ code, verified _after_
- **50+ Skills** — Modular AI capabilities loaded on demand ([full list](docs/Features.md))
- **3 Specialized Agents** — Context7-Expert, Universal Janitor, Playwright Tester
- **Quality Gates** — `scripts/quality.sh` + CI enforce standards the agent cannot skip
- **Self-Bootstrapping** — Missing a skill? The agent searches [prompts.chat](https://prompts.chat) and installs it at runtime
- **GitHub-Native** — Issues, PRs, labels, milestones, and workflows — managed by the agent
- **Stack-Agnostic** — Auto-detects Node, Python, or any stack on first run

## Quick Start

```bash
# 1. Use this template (or clone)
gh repo create my-project --template Thedougler/agent-template

# 2. Run — auto-bootstraps on first use
./run.sh

# 3. Open in VS Code with GitHub Copilot and start building
code .
```

## How It Works

Every task the agent performs follows the **Mandatory Completion Protocol**:

```
Step 0 — Do the work       → Complete the user's request
Step 1 — Self-reflect      → Fix scripts, expand vague prompts, add missing tests
Step 2 — Commit clean      → Run quality.sh → commit with Conventional Commits
```

This creates a **continuous improvement flywheel**: every task also improves the infrastructure for the next task. The agent follows [SPEC-driven development](docs/Features.md) — specs define intent, tasks break down work, and PRs gate quality.

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
├── scripts/                      # Setup, lint, fix, quality scripts
├── specs/                        # Specification documents
├── tasks/                        # Implementation task breakdowns
├── tests/                        # Test suites
├── run.sh                        # Main entry point
└── SPEC.md                       # Project-level specification
```

## Documentation

| Document                                  | Description                                                    |
| ----------------------------------------- | -------------------------------------------------------------- |
| **[Full Documentation](docs/README.md)**  | Architecture, agents, scripts, and the agentic loop            |
| **[Features & Skills](docs/Features.md)** | Complete breakdown of all 50+ skills, agents, and capabilities |
| **[Contributing](CONTRIBUTING.md)**       | SPEC-driven development workflow and contribution guide        |
| **[Project Spec](SPEC.md)**               | Project-level specification and acceptance criteria            |
| **[Security](SECURITY.md)**               | Security policy                                                |

## Contributing

Contributions are welcome! This project follows a SPEC-driven development workflow. See [CONTRIBUTING.md](CONTRIBUTING.md) for details on:

- Creating specs and tasks
- Using the available agents
- Submitting pull requests

## License

This project is licensed under the [MIT License](LICENSE).
