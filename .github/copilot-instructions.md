# Copilot Instructions — agent-template

## What This Repo Is

A **SPEC-driven development template** — not a runnable application. It provides a workflow framework where GitHub Copilot custom agents plan, implement, test, review, and refactor code autonomously based on formal specifications. There is no source code to build; the deliverables are specs, tasks, agent configs, and CI workflows.

## SPEC-Driven Workflow (Core Mental Model)

Every change follows this pipeline — never skip steps:

```
Issue → SPEC (specs/SPEC-###-desc.md) → Tasks (tasks/TASK-###-#-desc.md) → Code → Tests → Review → PR → Merge
```

- **Specs** capture user intent, requirements, and acceptance criteria. Use [specs/SPEC_TEMPLATE.md](specs/SPEC_TEMPLATE.md).
- **Tasks** are discrete work units derived from a spec. Use [tasks/TASK_TEMPLATE.md](tasks/TASK_TEMPLATE.md).
- Naming: `SPEC-001-feature-name.md`, `TASK-001-1-subtask-name.md` (spec number + sequence).
- Status lifecycle — Specs: `Draft → Approved → In Progress → Implemented → Tested → Reviewed → Complete`. Tasks: `Todo → In Progress → Testing → Review → Done`.
- Link every PR to a spec (`SPEC-###`) or issue (`Closes #N`). CI enforces this via [spec-validation.yml](.github/workflows/spec-validation.yml).

## Five Custom Agents

Agents live in `.github/agents/` as markdown files with YAML frontmatter. Each has a specific role:

| Agent | File | Role |
|-------|------|------|
| plan-agent | `plan-agent.agent.md` | Analyzes specs → creates task files in `tasks/` |
| implement-agent | `implement-agent.agent.md` | Reads spec+task → writes code |
| test-agent | `test-agent.agent.md` | Creates tests from acceptance criteria |
| review-agent | `review-agent.agent.md` | Reviews code against spec requirements |
| refactor-agent | `refactor-agent.agent.md` | Improves code quality, preserves tests |

Invoke with `@agent-name` in VS Code Copilot Chat. All agents use the **context7** MCP server for up-to-date documentation.

## Scripts — Token-Efficient Common Operations

Use `scripts/` instead of manually reading templates, computing numbers, or grepping for status. Agents **must** prefer these over equivalent multi-step file operations.

| Script | Purpose | Example |
|--------|---------|---------|
| `./scripts/new-spec.sh <desc>` | Create spec from template with auto-numbered ID | `./scripts/new-spec.sh user-auth` |
| `./scripts/new-task.sh <spec#> <desc>` | Create task linked to spec, auto-sequenced | `./scripts/new-task.sh 001 setup-database` |
| `./scripts/set-status.sh <file> <status>` | Update `**Status:**` in any spec/task file | `./scripts/set-status.sh specs/SPEC-001-*.md "In Progress"` |
| `./scripts/status.sh [spec#]` | Show status dashboard of all specs and tasks | `./scripts/status.sh` or `./scripts/status.sh 001` |
| `./scripts/validate.sh` | Pre-PR check: structure, spec format, whitespace | `./scripts/validate.sh` |

**Why this matters:** Each script replaces 3-5 agent tool calls (read template, scan directory, compute next number, write file, verify). Always run `./scripts/validate.sh` before opening a PR.

## Key Directories

- `specs/` — Specification documents (requirements, acceptance criteria)
- `tasks/` — Task breakdowns linked to specs
- `scripts/` — Shell helpers for scaffolding and validation (see table above)
- `.github/agents/` — Agent definition files (markdown + YAML frontmatter)
- `.github/skills/` — Auto-discovered skills that teach Copilot domain patterns (see `spec-driven-development/SKILL.md`)
- `.github/workflows/` — CI: structure validation (`ci.yml`), spec format/linking (`spec-validation.yml`), task tracking (`task-tracking.yml`)
- `.github/ISSUE_TEMPLATE/` — Issue templates: feature-spec, bug-report, task
- `.vscode/mcp.json` — MCP server config (context7, filesystem, github)

## Conventions

- **Commit messages**: Include task ID — `feat: implement auth login (TASK-001-2)`
- **Spec/task files**: All sections from templates are required; optional sections can be omitted only if truly N/A
- **Acceptance criteria**: Must be testable checkbox items (`- [ ] Criterion`)
- **Task effort**: Small (< 2h), Medium (2-8h), Large (> 8h) — break Large tasks further
- **Markdown linting**: Configured in `.markdownlint.json` — line length (MD013) and HTML (MD033) rules are disabled
- **PR template**: Use [PULL_REQUEST_TEMPLATE.md](.github/PULL_REQUEST_TEMPLATE.md) — link spec, list tasks, verify acceptance criteria

## Repo Organization & Maintenance

- **One spec per feature/bug** — don't combine unrelated work in a single spec
- **Never commit directly to `main`** — all changes go through the SPEC → Task → PR pipeline
- **Keep templates canonical** — modify `SPEC_TEMPLATE.md` / `TASK_TEMPLATE.md` for structural changes; don't diverge in individual files
- **Archive completed work** — mark specs as `Complete` and tasks as `Done`; don't delete them (they form the audit trail)
- **Run `./scripts/validate.sh` before every PR** — catches structure/format issues CI will flag
- **Run `./scripts/status.sh` at session start** — orient yourself on what's in-flight vs. done before picking up work
- **Completed specs stay in `specs/`** — the flat file list is the source of truth; avoid subdirectories unless the repo grows past ~50 specs

## Project Structure Best Practices

When agents add source code to implement specs, follow these patterns for maintainability and reliability.

### Source Code Layout

Place application code in a top-level `src/` directory (or language-idiomatic equivalent like a package name). Keep a clear separation:

```
src/              # Application source code
tests/            # Test files — mirror src/ structure (test_<module>.py, <module>.test.ts)
docs/             # Project docs (distinct from specs/)
specs/            # Specifications (workflow artifacts)
tasks/            # Task tracking (workflow artifacts)
scripts/          # Automation helpers
```

### Code Quality Standards

- **Single Responsibility** — one module/class per concern; functions < 50 lines, classes < 300 lines
- **Meaningful names** — self-documenting; avoid abbreviations; match domain language from the spec
- **Error handling** — fail early with clear messages; never swallow exceptions silently; raise domain-specific errors (not generic `Exception`)
- **No magic values** — extract constants with descriptive names (`MINIMUM_AGE = 18`, not bare `18`)
- **Type safety** — use type hints (Python), TypeScript over JavaScript, or equivalent for your language
- **No dead code** — remove commented-out code and unused imports; version control is the archive

### Testing Strategy

Tests validate spec acceptance criteria — every criterion maps to at least one test.

- **Unit tests** — fast (< 100ms each), no external dependencies, 80%+ coverage target
- **Integration tests** — test component boundaries and real dependencies
- **Test naming** — `test_should_<expected>_when_<condition>` (describes behavior, not implementation)
- **Structure** — Arrange/Act/Assert pattern; one assertion concept per test
- **Fixtures** — shared setup in `conftest.py` / test helpers; avoid duplication across test files

### Dependency & Configuration Management

- **Pin dependency versions** — use lock files (`poetry.lock`, `package-lock.json`) for reproducibility
- **No secrets in code** — use environment variables or external secret managers; never commit credentials
- **Separate config from code** — use `.env` files (gitignored), ConfigMaps, or dedicated config modules
- **Standard library first** — only add external dependencies when they provide substantial value over stdlib

### Reliability Patterns

- **Idempotent operations** — operations safe to retry without side effects
- **Graceful degradation** — handle downstream failures without crashing; provide fallbacks where possible
- **Input validation at boundaries** — validate all external input (API params, file contents, user input) at entry points
- **Logging over printing** — use structured logging (`logging` module, not `print()`) with appropriate levels
- **Small, atomic commits** — each commit should compile/run independently; reference task ID in message

## Autonomous Agent Workflow

When agents work autonomously, follow this sequence to minimize wasted tokens:

1. **Orient** — `./scripts/status.sh` to see current state
2. **Create** — `./scripts/new-spec.sh` or `./scripts/new-task.sh` (never manually copy templates)
3. **Implement** — read the spec + task, write code, commit with task ID
4. **Update status** — `./scripts/set-status.sh` after each phase transition
5. **Validate** — `./scripts/validate.sh` before marking work complete
6. **Review** — cross-check acceptance criteria checkboxes against implementation

Agents should avoid re-reading files they've already seen in the same session. Prefer running a script over performing the equivalent multi-step file operations.

## CI Checks

Three workflows run on PRs:

1. **ci.yml** — Markdown lint, trailing whitespace, validates required dirs (`specs/`, `tasks/`, `.github/agents/`) and files exist
2. **spec-validation.yml** — Ensures PRs link to issues/specs, validates spec format (required sections present)
3. **task-tracking.yml** — Tracks task completion status

## MCP Servers (`.vscode/mcp.json`)

- **context7** (`@context7/mcp-server`) — Query for latest API docs and best practices before making technology decisions
- **filesystem** — Local file read/write
- **github** — Issue/PR management (requires `GITHUB_TOKEN`)

## When Creating New Content

- New spec: `./scripts/new-spec.sh <description>` (auto-numbers, applies template)
- New task: `./scripts/new-task.sh <spec#> <description>` (auto-sequences, links to spec)
- New agent: create `.github/agents/<name>.agent.md` with YAML frontmatter (`name`, `description`, `tools`, `infer`, `metadata`)
- New skill: create `.github/skills/<name>/SKILL.md` with YAML frontmatter (`name`, `description`, `tags`, `version`)
