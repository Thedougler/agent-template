# Contributing to SPEC-Driven Development

Thank you for contributing! This project follows a SPEC-driven development workflow using GitHub Copilot custom agents.

## 🎯 Quick Start

1. Find or create an issue describing what you want to work on
2. Create a spec from the issue (or reference an existing spec)
3. Break the spec into tasks (use plan-agent)
4. Implement tasks (use implement-agent)
5. Test your implementation (use test-agent)
6. Get a review (use review-agent)
7. Submit a PR linking the spec and tasks

## 📋 Creating a Spec

### From a GitHub Issue

1. **Create an issue** using one of the templates:
   - Feature Spec - for new features
   - Bug Report - for bug fixes
   - Task - for specific implementation tasks

2. **Fill in all required fields**:
   - User intent - what problem are you solving?
   - Requirements - what must the solution do?
   - Acceptance criteria - how will you know it's done?

3. **Label appropriately**:
   - `spec` - marks this as a specification
   - `feature`, `bug`, `enhancement` - type of change
   - `high-priority`, `low-priority` - urgency

### From a Spec File

1. **Copy the template**:
   ```bash
   cp specs/SPEC_TEMPLATE.md specs/SPEC-XXX-your-feature.md
   ```

2. **Fill in all sections**:
   - Overview - brief description
   - User Intent - original request
   - Requirements - functional and non-functional
   - Acceptance Criteria - testable conditions
   - Constraints - limitations
   - Dependencies - what this relies on

3. **Link to an issue**:
   Create a GitHub issue and reference the spec file

## 🔨 Implementation Workflow

### 1. Plan Tasks (plan-agent)

Use the plan-agent to break down your spec:

```
@plan-agent Read SPEC-001 and create implementation tasks
```

The agent will:
- Analyze the spec requirements
- Identify logical task boundaries
- Create task files in `tasks/`
- Document dependencies
- Estimate effort

### 2. Implement Code (implement-agent)

Work on one task at a time:

```
@implement-agent Implement TASK-001-1 following the spec requirements
```

The agent will:
- Read the spec and task file
- Understand acceptance criteria
- Write focused, minimal code
- Follow existing patterns
- Add necessary documentation

#### Best Practices

- **One task at a time** - stay focused
- **Commit often** - small, atomic commits
- **Reference task IDs** - in commit messages
- **Update task status** - as you progress
- **Follow conventions** - match existing code style

### 3. Test Implementation (test-agent)

Validate your changes:

```
@test-agent Create tests for TASK-001-1 that verify the spec acceptance criteria
```

The agent will:
- Create unit tests for functions
- Create integration tests for workflows
- Test edge cases
- Run tests and report coverage
- Identify untested code paths

#### Testing Standards

- **Unit tests** - for all functions/methods
- **Integration tests** - for component interactions
- **Coverage target** - aim for 80%+ coverage
- **All tests pass** - before submitting PR
- **Fast tests** - optimize for quick feedback

### 4. Review Code (review-agent)

Before submitting your PR:

```
@review-agent Review my changes against SPEC-001
```

The agent will:
- Check spec compliance
- Evaluate code quality
- Identify security issues
- Verify test coverage
- Suggest improvements

#### Self-Review Checklist

- [ ] All acceptance criteria met
- [ ] Tests pass and cover new code
- [ ] Documentation updated
- [ ] No security vulnerabilities
- [ ] Follows project conventions
- [ ] No breaking changes (or documented)
- [ ] Backward compatible

### 5. Refactor (refactor-agent) - Optional

If code needs improvement:

```
@refactor-agent Improve the code quality for TASK-001-1 while keeping tests passing
```

The agent will:
- Identify improvement opportunities
- Refactor incrementally
- Maintain all functionality
- Keep tests passing
- Update documentation

## 📤 Submitting a Pull Request

### PR Requirements

1. **Link to spec/issue**:
   ```markdown
   Closes #123
   Related Spec: SPEC-001
   ```

2. **List completed tasks**:
   ```markdown
   - [x] TASK-001-1 - Database setup
   - [x] TASK-001-2 - API endpoints
   ```

3. **Describe changes**:
   - What was implemented
   - How it was implemented
   - Why this approach was chosen

4. **Verify acceptance criteria**:
   - Check off each criterion from the spec
   - Provide evidence (test results, screenshots)

5. **Include test results**:
   ```
   All tests passing (47/47)
   Coverage: 85%
   ```

### PR Template

Use the provided template (`.github/PULL_REQUEST_TEMPLATE.md`) which includes:
- Related issue/spec
- Type of change
- Implementation details
- Testing information
- Acceptance criteria verification
- Code review checklist

## 🔄 Review Process

### For PR Authors

1. **Self-review first** - use review-agent
2. **Address CI failures** - before requesting review
3. **Respond to feedback** - constructively
4. **Update based on reviews** - quickly
5. **Request re-review** - when ready

### For Reviewers

1. **Check spec compliance** - does it match requirements?
2. **Verify tests** - are they comprehensive?
3. **Review code quality** - is it maintainable?
4. **Check security** - any vulnerabilities?
5. **Validate documentation** - is it complete?
6. **Approve or request changes** - with clear feedback

Use review-agent to assist:
```
@review-agent Review PR #123 for spec compliance and code quality
```

## 🏗️ Project Structure Guidelines

### Specs Directory (`specs/`)

- **Naming**: `SPEC-###-short-description.md`
- **Format**: Follow `SPEC_TEMPLATE.md`
- **Status**: Update as spec progresses
- **Archive**: Keep completed specs for reference

### Tasks Directory (`tasks/`)

- **Naming**: `TASK-###-#-short-description.md`
- **Format**: Follow `TASK_TEMPLATE.md`
- **Dependencies**: Document clearly
- **Status**: Update frequently

### Agent Configurations (`.github/agents/`)

- **Format**: Valid JSON
- **Required fields**: name, description, instructions
- **Purpose**: Define agent behavior
- **Do not modify** unless updating agent capabilities

## 🔒 Security

- **No secrets** in code or specs
- **Validate inputs** in all functions
- **Handle errors** gracefully
- **Review dependencies** for vulnerabilities
- **Follow security best practices** for your language

Use review-agent to check:
```
@review-agent Check for security vulnerabilities in my changes
```

## 📏 Code Standards

### General Principles

1. **Clarity over cleverness** - write obvious code
2. **Small functions** - single responsibility
3. **Meaningful names** - self-documenting
4. **DRY** - don't repeat yourself
5. **YAGNI** - you ain't gonna need it
6. **Test-driven** - write tests early

### Language-Specific

- **Python**: Follow PEP 8
- **JavaScript**: Use ESLint config
- **Go**: Use gofmt
- **Rust**: Use rustfmt
- (Add your languages here)

### Documentation

- **README** for setup and usage
- **Inline comments** for complex logic
- **Function docstrings** for APIs
- **Specs** for requirements
- **Tasks** for implementation details

## 🐛 Reporting Bugs

Use the Bug Report template:

1. Describe the bug clearly
2. Provide reproduction steps
3. Include expected vs actual behavior
4. Add relevant logs/errors
5. Specify environment details

## 💡 Suggesting Features

Use the Feature Spec template:

1. Describe user intent
2. List requirements
3. Define acceptance criteria
4. Note any constraints
5. Identify dependencies

## 🚀 Release Process

1. **All specs implemented** and verified
2. **All tests passing** on main branch
3. **CI green** on main branch
4. **Tag release** with version number
5. **Generate release notes** linking specs
6. **Deploy** according to project needs

## ❓ Questions?

- **Check documentation** in `specs/` and `tasks/`
- **Search existing issues** for answers
- **Open a discussion** for general questions
- **Use agent help** for workflow questions

## 🙏 Thank You!

Your contributions make this project better. By following this SPEC-driven workflow, we maintain quality, traceability, and alignment with user needs.

**Happy coding with agents! 🤖**
