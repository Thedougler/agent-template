# Task Management

This directory contains individual task definitions that implement specifications.

## What is a Task?

A task is a discrete unit of work that:
- Implements part or all of a spec
- Has clear acceptance criteria
- Can be completed independently (or with known dependencies)
- Is tracked through to completion

## Task Workflow

1. **Todo** - Task created, not started
2. **In Progress** - Actively being worked on
3. **Testing** - Implementation complete, tests being written/run
4. **Review** - Code review in progress
5. **Done** - All acceptance criteria met, reviewed, and merged

## Creating a New Task

1. Copy `TASK_TEMPLATE.md` to: `TASK-<spec-id>-<task-number>-<description>.md`
2. Fill in all required fields
3. Link to the parent spec
4. List dependencies on other tasks
5. Update status as work progresses

## Task Naming Convention

Format: `TASK-<SPEC-ID>-<TASK-NUM>-<SHORT-DESC>.md`

Examples:
- `TASK-001-1-setup-database.md`
- `TASK-001-2-create-api-endpoints.md`
- `TASK-002-1-implement-authentication.md`

## Task Dependencies

Tasks can depend on other tasks. Use the Dependencies section to:
- List task IDs that must complete first
- Explain why the dependency exists
- Help plan-agent sequence work correctly

## Best Practices

- Keep tasks small and focused (< 1 day of work)
- Write specific, testable acceptance criteria
- Update status frequently
- Document blockers or issues
- Link to related PRs and commits
- Archive completed tasks

## Integration with GitHub

- Link tasks to PR descriptions
- Reference task IDs in commit messages
- Close tasks when PRs are merged
- Track task progress in GitHub Projects
