# Roadmap

> **Purpose**: High-level milestones and strategic goals. Agents read this for project direction without needing full spec details.
>
> **Rules**: Keep entries brief. Link to specs/issues for details — don't duplicate them here.
> Sync milestones to [GitHub Milestones](../../milestones) when they're committed to.

## Current Milestone

### v1.0 — Template Foundation

> **Target**: TBD
> **GitHub Milestone**: —

- [x] Core agent infrastructure (copilot-instructions, skills, agents)
- [x] SPEC-driven development methodology
- [x] Quality gate scripts (setup, lint, fix, quality)
- [x] CI/CD workflows (ci, release, label-sync, auto-label)
- [x] 50+ skills library with self-bootstrapping
- [x] 3 specialized agents (Context7, Janitor, Playwright)
- [ ] First community contribution

## Planned

### v1.1 — Quality & Polish

> **Target**: TBD

- [ ] Retroactive skill audit (run skill-judge on all installed skills)
- [ ] Skill versioning (track install date and source)
- [ ] Architecture Decision Records (ADRs)
- [ ] Agent performance metrics tracking

### v1.2 — Developer Experience

> **Target**: TBD

- [ ] Interactive project wizard (`run.sh` prompts for stack choice)
- [ ] Pre-built stack templates (Python/FastAPI, Node/Express, etc.)
- [ ] VS Code tasks/launch configs for common operations

## Completed

_Milestones move here when all items are checked off._

---

## How to Use This File

**Agents**: Read the Current Milestone and Planned sections to understand project direction. Don't spend tokens reading Completed milestones unless asked.

**Humans**: Add new milestones under Planned. Move them to Current when work begins. Check off items as they ship. Archive to Completed when done.

**Automation**: The `changelog` workflow generates release notes from commits. This file tracks _intent_; CHANGELOG.md tracks _history_.
