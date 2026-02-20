# Documentation

Full documentation for the Agentic Coding Template.

## Contents

- [Features](Features.md) — Complete breakdown of capabilities, skills, agents, and scripts
- [CONTRIBUTING](../CONTRIBUTING.md) — SPEC-driven development workflow and contribution guide
- [SPEC](../SPEC.md) — Project-level specification and acceptance criteria
- [SECURITY](../SECURITY.md) — Security policy

## Architecture

### Directory Structure

```
├── .github/
│   ├── copilot-instructions.md   # Agent identity, protocol, conventions
│   ├── agents/                   # 3 specialized agents
│   ├── skills/                   # 50+ reusable AI capability modules
│   ├── workflows/                # CI, label sync, auto-label, releases
│   └── ISSUE_TEMPLATE/           # Bug, feature, task templates
├── app/                          # Your application code
├── data/                         # Data files
├── docs/                         # Documentation (you are here)
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

### Skills + Agents + Scripts

The architecture is built on three pillars:

**Skills** (`.github/skills/`) — Reusable AI capability modules. Each skill is a `SKILL.md` file with YAML frontmatter (`name`, `description`) and structured instructions. Over 50 skills are included covering frontend, backend, AI/ML, testing, and more. See [Features](Features.md) for the full catalog.

**Agents** (`.github/agents/`) — Specialized agents that handle focused tasks to reduce token usage:

| Agent              | Purpose                             |
| ------------------ | ----------------------------------- |
| @Context7-Expert   | Live library docs via Context7 MCP  |
| @Universal Janitor | Tech debt and dead code elimination |
| @Playwright Tester | E2E test generation and execution   |

**Scripts** (`scripts/`) — Idempotent shell scripts that auto-detect the project stack:

| Script               | Purpose                                    |
| -------------------- | ------------------------------------------ |
| `./run.sh`           | Entry point — auto-bootstraps on first use |
| `scripts/setup.sh`   | Environment bootstrap (deps, hooks, .env)  |
| `scripts/lint.sh`    | Check-only linting                         |
| `scripts/fix.sh`     | Auto-fix formatting                        |
| `scripts/quality.sh` | Full quality gate (lint + tests)           |

### The Agentic Loop

Every task follows the **Mandatory Completion Protocol**:

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

### SPEC-Driven Development

The methodology that keeps the agent aligned with intent:

1. **Spec** — `specs/SPEC-###-description.md` (Overview, Requirements, Acceptance Criteria)
2. **Plan** — `tasks/TASK-###-#-description.md` with dependencies
3. **Implement** — One task at a time, atomic commits referencing task IDs
4. **Test** — Validate against acceptance criteria (target 80%+ coverage)
5. **Review** — Spec compliance, security, quality
6. **PR** — Link spec/issue, list tasks, include test results

See [CONTRIBUTING](../CONTRIBUTING.md) for the full workflow.

### Tracking Files

| File           | Purpose                                         | Automation                              |
| -------------- | ----------------------------------------------- | --------------------------------------- |
| `ROADMAP.md`   | Milestones and strategic goals                  | Manual                                  |
| `TODO.md`      | Active tasks linked to GitHub Issues            | `todo-sync` removes closed-issue items  |
| `CHANGELOG.md` | Release history from Conventional Commits       | `changelog` workflow generates on tags  |
