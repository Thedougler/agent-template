# Copilot Instructions — agent-template

## What This Repo Is

A **SPEC-driven development template** — not a runnable application. It provides a workflow framework where GitHub Copilot custom agents plan, implement, test, and review code autonomously based on formal specifications. There is no source code to build; the deliverables are specs, tasks, agent configs, and CI workflows.

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

## Custom Agents

Agents live in `.github/agents/` as markdown files with YAML frontmatter. Each has a specific role:

| Agent | File | Role |
|-------|------|------|
| ADR Generator | `adr-generator.agent.md` | Creates Architectural Decision Records in `docs/adr/` |
| Context7 Expert | `context7.agent.md` | Fetches live documentation via Context7 MCP server |
| Custom Agent Foundry | `custom-agent-foundry.agent.md` | Designs and creates custom VS Code Copilot agents |
| Expert React Frontend Engineer | `expert-react-frontend-engineer.agent.md` | React 19.2 frontend specialist (components, hooks, testing) |
| GitHub Actions Expert | `github-actions-expert.agent.md` | Secure CI/CD workflow creation and hardening |
| Janitor | `janitor.agent.md` | Cleanup, simplification, and tech debt removal |
| Planner | `planner.agent.md` | Generates read-only implementation plans (no code changes) |
| Playwright Tester | `playwright-tester.agent.md` | Playwright test generation and iterative debugging |
| Specification | `specification.agent.md` | Creates AI-ready specification documents |
| Tech Debt Remediation Plan | `tech-debt-remediation-plan.agent.md` | Analysis-only remediation plans with metrics |

Invoke with `@agent-name` in VS Code Copilot Chat. Several agents use the **context7** MCP server for up-to-date documentation.

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

### Spec Separation for Focus

Each spec should represent **one cohesive change** with a clear boundary. If a spec grows beyond 3-5 tasks or touches multiple unrelated systems, split it.

**Split by concern, not by size:**

| Instead of | Split into |
|------------|-----------|
| `SPEC-002-user-system.md` (auth + profile + permissions) | `SPEC-002-user-auth.md`, `SPEC-003-user-profile.md`, `SPEC-004-rbac-permissions.md` |
| `SPEC-005-api-and-frontend.md` | `SPEC-005-api-endpoints.md`, `SPEC-006-frontend-views.md` (link via Dependencies) |
| `SPEC-007-refactor-and-feature.md` | `SPEC-007-refactor-data-layer.md`, `SPEC-008-new-feature.md` (refactor first, feature depends on it) |

**When to keep a spec unified:**
- All tasks share the same acceptance criteria (e.g., a single API endpoint with tests and docs)
- Splitting would create specs with only 1 task each — that's over-fragmentation

**Cross-referencing related specs:**
- Use the **Dependencies** section to link specs that must be implemented in order
- Use the **Related Spec** field in tasks to connect work across specs
- When one spec depends on another, finish the dependency first or mark tasks as blocked

**Staying focused during implementation:**
- Work on **one spec at a time** — complete its full lifecycle (tasks → code → tests → review) before starting the next
- Within a spec, complete tasks in dependency order — don't jump between unrelated tasks
- If you discover new scope during implementation, create a new spec for it rather than expanding the current one — add a note in the current spec's Change Log referencing the new spec

## Project Structure Best Practices

When agents add source code to implement specs, follow these patterns for maintainability and reliability.

### Source Code Layout

Choose the layout that matches your project's service architecture. The SPEC-driven workflow directories (`specs/`, `tasks/`, `scripts/`) stay at the root in all cases.

#### Single Service (API or CLI)

One deployable unit — backend API, CLI tool, library, etc.

```
src/                  # Application source (or language-idiomatic: pkg/, app/, lib/)
  models/             # Domain models / data classes
  services/           # Business logic
  api/                # HTTP routes / controllers (if applicable)
  utils/              # Shared helpers
tests/                # Mirror src/ structure (test_<module>.py, <module>.test.ts)
  unit/
  integration/
Dockerfile            # Single service container
docs/                 # Project documentation
specs/                # SPEC-driven workflow
tasks/
scripts/
```

Key rules:
- **One entry point** — `src/main.py`, `src/index.ts`, or equivalent. Keep it thin (wiring only).
- **Layers don't skip** — routes call services, services call models. Never import routes from models.
- **Config at the root** — `pyproject.toml`, `package.json`, `Dockerfile`, `.env.example` live at repo root.

#### Multi-Service (Frontend + Backend)

Separate deployable units in one repo (monorepo). Each service is self-contained with its own dependencies, tests, and Dockerfile.

```
frontend/             # Client application (React, Vue, etc.)
  src/
  tests/
  package.json
  Dockerfile
backend/              # API server (FastAPI, Express, etc.)
  src/
  tests/
  pyproject.toml      # or package.json
  Dockerfile
shared/               # Code shared across services (types, contracts, utils) — optional
docker-compose.yml    # Orchestrates all services locally
docs/
specs/                # SPEC-driven workflow (shared across services)
tasks/
scripts/
```

Key rules:
- **Independent deployability** — each service has its own `Dockerfile`, dependency manifest, and test suite. Never import directly between `frontend/` and `backend/`.
- **Shared contracts, not shared code** — if services need shared types, use `shared/` for API contracts (OpenAPI schema, TypeScript types, Protobuf). Minimize `shared/` surface area.
- **One `docker-compose.yml`** — defines all services, databases, and message brokers for local development. Each service declares its own ports and environment variables.
- **Specs span services** — a single spec may produce tasks across `frontend/` and `backend/`. Use task descriptions to specify which service a task targets (e.g., `TASK-002-1-backend-auth-endpoint`, `TASK-002-2-frontend-login-page`).
- **CI per service** — extend `ci.yml` to test each service independently. Use path filters so backend changes don't trigger frontend tests.

#### Choosing Between Layouts

- Start with **single service** unless you have a clear reason to separate (different languages, independent deployment cadence, separate teams).
- Promote to **multi-service** when a component needs its own release cycle, scaling profile, or technology stack.
- Never mix service code in `src/` — if you have a frontend and a backend, use the multi-service layout from the start.

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

## CI & Automation

Workflows in `.github/workflows/`:

| Workflow | Trigger | Purpose |
|----------|---------|--------|
| `ci.yml` | Push/PR to main | Markdown lint, calls `validate-repo.yml` reusable workflow |
| `spec-validation.yml` | PR open/sync | Ensures PRs link to issues/specs; calls `validate-repo.yml` for spec format |
| `task-tracking.yml` | PR merge | Updates task status when PRs referencing TASK IDs are merged |
| `validate-repo.yml` | Called by others | **Reusable** — structure checks, spec format, trailing whitespace. Template consumers extend this. |
| `release.yml` | Tag `v*` | Creates GitHub Release with completed specs and commit log |
| `label-sync.yml` | Push to main (labels.yml changed) | Syncs `.github/labels.yml` definitions to the repo |
| `auto-label.yml` | PR open/sync | Auto-labels PRs based on changed paths (`.github/labeler.yml`) |

**Dependabot** (`.github/dependabot.yml`) keeps GitHub Actions versions up to date weekly. Extend it when adding application dependencies.

## Labels & Milestones

**Labels** are defined in `.github/labels.yml` and auto-synced. Categories:

- **Type**: `feature`, `bug`, `enhancement`, `documentation`, `ci`, `dependencies`
- **Priority**: `priority:high`, `priority:medium`, `priority:low`
- **Effort**: `effort:small` (< 2h), `effort:medium` (2-8h), `effort:large` (> 8h)
- **Agent**: `agent:planner`, `agent:specification`, `agent:react`, `agent:actions`, `agent:playwright`, `agent:janitor`
- **Status**: `status:blocked`, `status:in-progress`, `status:needs-review`

PRs are auto-labeled by path via `.github/labeler.yml` (specs/ → `spec`, tasks/ → `task`, etc.).

**Milestones** group specs/issues by release or iteration. Use them to:
- Assign spec issues to a milestone when planning a release
- Track completion percentage in the GitHub Issues UI
- Reference in release notes (`release.yml` generates notes from completed specs)

## Releases

Tag-driven via `release.yml`. To release:

```bash
git tag v1.0.0 && git push origin v1.0.0
```

The workflow collects completed specs and generates release notes automatically. Pre-release tags (e.g., `v1.0.0-beta.1`) are marked as pre-release.

## MCP Servers (`.vscode/mcp.json`)

- **context7** (`@context7/mcp-server`) — Query for latest API docs and best practices before making technology decisions
- **filesystem** — Local file read/write
- **github** — Issue/PR management (requires `GITHUB_TOKEN`)

## When Creating New Content

- New spec: `./scripts/new-spec.sh <description>` (auto-numbers, applies template)
- New task: `./scripts/new-task.sh <spec#> <description>` (auto-sequences, links to spec)
- New agent: create `.github/agents/<name>.agent.md` with YAML frontmatter (`name`, `description`, `tools`, `infer`, `metadata`)
- New skill: create `.github/skills/<name>/SKILL.md` with YAML frontmatter (`name`, `description`, `tags`, `version`)
