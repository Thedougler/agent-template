# SPEC-Driven Development Overview

This directory contains specifications for features and functionality in this project.

## What is a SPEC?

A SPEC (Specification) is a detailed document that:
- Originates from user intent, issues, or prompts
- Defines clear requirements and acceptance criteria
- Guides implementation through the entire development lifecycle
- Serves as a contract between intent and implementation

## SPEC Lifecycle

1. **Draft** - Initial spec creation from user intent
2. **Approved** - Spec reviewed and approved for implementation
3. **In Progress** - Implementation underway
4. **Implemented** - Code written and committed
5. **Tested** - Tests created and passing
6. **Reviewed** - Code review completed
7. **Complete** - All acceptance criteria met

## Creating a New SPEC

1. Copy `SPEC_TEMPLATE.md` to a new file: `SPEC-<number>-<short-description>.md`
2. Fill in all sections based on user intent
3. Have the plan-agent create tasks from the spec
4. Link the spec to a GitHub issue for tracking

## SPEC Structure

Each spec should include:
- Clear requirements (functional and non-functional)
- Testable acceptance criteria
- Dependencies and constraints
- Implementation plan with tasks
- Testing strategy
- Risk assessment

## Best Practices

- Keep specs focused on a single feature or change
- Write acceptance criteria that can be objectively verified
- Update the spec as requirements evolve
- Link related specs and tasks
- Track changes in the change log
- Archive completed specs for reference

## Integration with Agents

- **plan-agent** - Creates tasks from specs
- **implement-agent** - Implements code based on specs
- **test-agent** - Validates implementation against specs
- **review-agent** - Reviews code for spec compliance
- **refactor-agent** - Improves code while maintaining spec requirements
