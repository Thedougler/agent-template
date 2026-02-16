---
name: spec-driven-development
description: Enable Copilot to follow SPEC-driven development methodology for planning, implementing, testing, and reviewing code changes based on specifications.
tags: [planning, specs, tasks, workflow, methodology]
version: 1.0.0
---

# SPEC-Driven Development Skill

This skill teaches Copilot to follow the SPEC-driven development methodology used in this repository.

## Overview

SPEC-driven development is a workflow where:
1. User intent becomes a formal specification (SPEC)
2. Specs break down into discrete, tracked tasks
3. Implementation follows spec requirements exactly
4. Tests validate against spec acceptance criteria
5. Reviews ensure spec compliance and quality
6. Everything is traceable from intent to implementation

## When to Use This Skill

Use this skill when:
- Creating new specifications from user requirements
- Breaking down specs into implementation tasks
- Writing code that must follow a spec
- Creating tests based on spec acceptance criteria
- Reviewing code for spec compliance
- Planning implementation sequences

## SPEC Document Structure

Every spec should include:

### Required Sections
1. **Overview** - Brief description of what the spec accomplishes
2. **User Intent** - Original user request or problem statement
3. **Requirements** - Functional and non-functional requirements
4. **Acceptance Criteria** - Clear, testable conditions for completion
5. **Status** - Current state (Draft, Approved, In Progress, Complete)

### Optional Sections
- **Constraints** - Technical or resource limitations
- **Dependencies** - External dependencies or prerequisite specs
- **Implementation Plan** - High-level approach (filled by plan-agent)
- **Testing Strategy** - Approach to validation
- **Risks and Mitigation** - Potential issues and solutions
- **Timeline** - Estimated completion schedule

### Naming Convention
- Format: `SPEC-###-short-description.md`
- Store in: `specs/` directory
- Example: `specs/SPEC-001-user-authentication.md`

## Task Document Structure

Every task should include:

### Required Sections
1. **Task ID** - Unique identifier (e.g., TASK-001-1)
2. **Related Spec** - Link to parent specification
3. **Description** - What needs to be done
4. **Acceptance Criteria** - Specific conditions for task completion
5. **Status** - Todo, In Progress, Testing, Review, Done

### Optional Sections
- **Dependencies** - Other tasks that must complete first
- **Estimated Effort** - Small (< 2h), Medium (2-8h), Large (> 8h)
- **Implementation Notes** - Technical details or approaches
- **Testing Requirements** - Specific tests needed

### Naming Convention
- Format: `TASK-###-#-short-description.md`
- Store in: `tasks/` directory
- Example: `tasks/TASK-001-1-setup-auth-database.md`

## Workflow Instructions

### Creating a SPEC from User Intent

When given user intent or requirements:

1. **Analyze the intent**
   - Identify the core problem or feature request
   - Understand user goals and constraints
   - Note any implicit requirements

2. **Structure the SPEC**
   - Write a clear overview (1-2 paragraphs)
   - Document user intent verbatim
   - List functional requirements (what it must do)
   - List non-functional requirements (performance, security, etc.)
   - Define testable acceptance criteria

3. **Consider edge cases**
   - What could go wrong?
   - What are the boundaries?
   - How will errors be handled?

4. **Create the file**
   - Use next available SPEC number
   - Follow naming convention
   - Place in `specs/` directory
   - Link to originating issue if applicable

### Breaking Down a SPEC into Tasks

When planning implementation from a spec:

1. **Read the spec thoroughly**
   - Understand all requirements
   - Note acceptance criteria
   - Identify dependencies

2. **Identify task boundaries**
   - Each task should be completable in one work session
   - Tasks should have clear inputs and outputs
   - Tasks should be testable independently when possible

3. **Sequence tasks**
   - What must be built first?
   - What can be done in parallel?
   - What depends on what?

4. **Create task files**
   - Use format: `TASK-<SPEC-ID>-<NUMBER>-description.md`
   - Include all required sections
   - Link back to parent spec
   - Document dependencies clearly

5. **Estimate effort**
   - Small: < 2 hours (simple, well-defined)
   - Medium: 2-8 hours (moderate complexity)
   - Large: > 8 hours (consider breaking down further)

### Implementing Code from a Task

When writing code for a task:

1. **Read both the spec and task**
   - Understand the big picture (spec)
   - Focus on specific requirements (task)

2. **Follow acceptance criteria exactly**
   - Each criterion should be verifiable
   - Don't add features not in the spec
   - Don't skip criteria

3. **Write tests alongside code**
   - Tests validate acceptance criteria
   - Tests should pass when task is complete

4. **Update task status**
   - Mark sections complete as you work
   - Note any blockers or issues
   - Update completion percentage

5. **Link commits to tasks**
   - Include task ID in commit messages
   - Example: "feat: implement auth login (TASK-001-2)"

### Creating Tests from SPEC

When writing tests for a spec:

1. **Map acceptance criteria to tests**
   - Each criterion should have at least one test
   - Tests should be automated when possible

2. **Test types to consider**
   - Unit tests - individual functions
   - Integration tests - component interactions
   - End-to-end tests - complete workflows
   - Edge case tests - boundaries and errors

3. **Test naming**
   - Should describe what is being tested
   - Should indicate expected behavior
   - Example: `test_login_succeeds_with_valid_credentials()`

4. **Coverage goals**
   - Aim for 80%+ code coverage
   - 100% coverage of acceptance criteria
   - All error paths tested

### Reviewing Code for SPEC Compliance

When reviewing code against a spec:

1. **Check acceptance criteria**
   - Is each criterion met?
   - Is there evidence (tests, demos)?

2. **Verify requirements**
   - Functional requirements implemented?
   - Non-functional requirements met?
   - Constraints respected?

3. **Assess quality**
   - Code is maintainable
   - Tests are comprehensive
   - Documentation is complete
   - No security issues

4. **Provide specific feedback**
   - Reference spec sections
   - Cite acceptance criteria
   - Suggest concrete improvements

## Best Practices

### For Specs
- Write specs before coding
- Make acceptance criteria testable
- Keep specs focused (one feature/fix per spec)
- Update specs if requirements change
- Archive completed specs for reference

### For Tasks
- Break down large tasks
- Document dependencies explicitly
- Update status frequently
- Link to related PRs and commits
- Close tasks only when fully reviewed

### For Implementation
- Read the spec first, always
- Follow acceptance criteria exactly
- Write tests as you code
- Update task status as you progress
- Don't skip error handling

### For Testing
- Test acceptance criteria first
- Add edge case tests
- Maintain test coverage
- Tests should be fast
- Tests should be deterministic

### For Reviews
- Check spec compliance first
- Verify all acceptance criteria
- Look for missing edge cases
- Check test coverage
- Provide constructive feedback

## Common Patterns

### Pattern: Feature Spec → Tasks → Implementation

```
1. User requests feature via issue
2. Create SPEC-nnn-feature-name.md
3. Use plan-agent to create tasks
4. For each task:
   a. implement-agent writes code
   b. test-agent creates tests
   c. review-agent checks quality
5. Create PR linking spec and tasks
6. Merge when all criteria met
```

### Pattern: Bug Report → Fix Spec → Implementation

```
1. Bug reported via issue
2. Create SPEC-nnn-bug-fix.md documenting:
   - Current (wrong) behavior
   - Expected (correct) behavior
   - Root cause (if known)
3. Create fix task(s)
4. Implement fix
5. Add regression test
6. Verify fix resolves issue
```

### Pattern: Refactoring with SPEC

```
1. Create SPEC for refactoring goal
2. Document:
   - Current state
   - Desired state
   - Constraints (must maintain behavior)
3. Ensure tests exist and pass
4. Refactor incrementally
5. Tests must keep passing
6. Document improvements
```

## Integration with Agents

This skill works with the repository's custom agents:

- **plan-agent**: Uses this skill to create tasks from specs
- **implement-agent**: Uses this skill to write spec-compliant code
- **test-agent**: Uses this skill to create tests from acceptance criteria
- **review-agent**: Uses this skill to review for spec compliance
- **refactor-agent**: Uses this skill to maintain spec requirements during refactoring

## Templates

### SPEC Template Location
`specs/SPEC_TEMPLATE.md` - Full template with all sections

### Task Template Location
`tasks/TASK_TEMPLATE.md` - Full template with all sections

## Examples

### Example SPEC
See `specs/SPEC-001-example-calculator.md` for a complete example showing:
- Proper structure
- Clear acceptance criteria
- Task breakdown
- Testing strategy

### Example Task
See `tasks/TASK-001-1-create-calculator-structure.md` for:
- Task structure
- Acceptance criteria
- Dependencies
- Testing requirements

## Validation

A spec is complete when:
- All required sections are filled
- Acceptance criteria are clear and testable
- Dependencies are documented
- Status is tracked

A task is complete when:
- All acceptance criteria met
- Tests written and passing
- Code reviewed and approved
- Documentation updated
- Status marked as Done

## Resources

- Full README: `README.md`
- Contributing Guide: `CONTRIBUTING.md`
- Spec Guide: `specs/README.md`
- Task Guide: `tasks/README.md`
- Workflow Documentation: `docs/AGENT_WORKFLOW.md`
