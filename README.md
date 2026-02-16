# Agent Template - SPEC-Driven Development

An agentic coding repository template built around SPEC-driven development, using GitHub Copilot custom agents running locally in VS Code to plan, implement, test, review, and refactor autonomously.

## 🎯 Overview

This template enables a complete **SPEC-driven development workflow** where:

- **Specs originate from user intent**, issues, or prompts
- **Flow through tracked tasks** for implementation
- **Iteratively self-evaluate** via tests and review agents
- **Standard GitHub features** (issues, PRs, CI, releases) enforce traceability
- **Autonomous agents** handle planning, implementation, testing, review, and refactoring

## 🤖 Custom Agents

Five specialized agents work together through the development lifecycle:

### 1. Plan Agent (`plan-agent`)
- Analyzes specs and user intent
- Breaks down requirements into actionable tasks
- Creates implementation plans with dependencies
- Identifies risks and estimates effort

### 2. Implement Agent (`implement-agent`)
- Writes code based on specs and tasks
- Follows existing patterns and conventions
- Creates/updates tests for new functionality
- Ensures spec compliance

### 3. Test Agent (`test-agent`)
- Creates comprehensive test suites
- Validates implementation against specs
- Reports coverage and quality metrics
- Identifies edge cases and missing tests

### 4. Review Agent (`review-agent`)
- Reviews code changes against specs
- Evaluates code quality and maintainability
- Checks for security vulnerabilities
- Validates test coverage and documentation

### 5. Refactor Agent (`refactor-agent`)
- Improves code quality while preserving functionality
- Reduces duplication and complexity
- Optimizes performance where needed
- Maintains backward compatibility

## 📋 SPEC-Driven Development Workflow

```
User Intent/Issue → SPEC → Tasks → Implementation → Tests → Review → Merge → Release
                      ↑                                ↓
                      └────────── Iterative Feedback ─────────┘
```

### Step-by-Step Process

1. **Create a Spec**
   - Start with a GitHub issue using the Feature Spec or Bug Report template
   - Document user intent, requirements, and acceptance criteria
   - Store in `specs/` directory with format: `SPEC-###-description.md`

2. **Plan Tasks**
   - Plan-agent analyzes the spec
   - Breaks down into discrete tasks
   - Creates task files in `tasks/` directory
   - Identifies dependencies and sequencing

3. **Implement**
   - Implement-agent writes code for each task
   - Follows spec requirements exactly
   - Updates task status as work progresses
   - Links commits to task IDs

4. **Test**
   - Test-agent creates and runs tests
   - Validates against spec acceptance criteria
   - Reports coverage and identifies gaps
   - All tests must pass before review

5. **Review**
   - Review-agent evaluates code quality
   - Checks spec compliance
   - Identifies security issues
   - Provides constructive feedback

6. **Refactor** (if needed)
   - Refactor-agent improves code quality
   - Maintains all functionality and tests
   - Optimizes for maintainability
   - Re-validates with test suite

7. **Merge and Release**
   - Create PR linking spec and tasks
   - CI validates structure and tests
   - Merge to main branch
   - Track in release notes

## 🚀 Getting Started

### Using This Template

1. **Click "Use this template"** to create your repository
2. **Clone your new repository** locally
3. **Configure VS Code** with GitHub Copilot
4. **Load custom agents** from `.github/agents/`

### Creating Your First Spec

1. **Open a new issue** using the "Feature Spec" template
2. Fill in:
   - User intent (what you want to accomplish)
   - Requirements (functional and non-functional)
   - Acceptance criteria (how you'll know it's done)
3. Label with `spec` and `feature`
4. The issue becomes your spec document

### Working with Agents in VS Code

1. **Open GitHub Copilot** in VS Code
2. **Select an agent** based on your task:
   - Use **plan-agent** to break down a spec into tasks
   - Use **implement-agent** to write code for a task
   - Use **test-agent** to create/run tests
   - Use **review-agent** to review changes
   - Use **refactor-agent** to improve code quality

3. **Reference specs and tasks** in your prompts:
   ```
   @plan-agent Create tasks for SPEC-001
   @implement-agent Implement TASK-001-1
   @test-agent Test the implementation in SPEC-001
   @review-agent Review changes for spec compliance
   ```

## 📁 Repository Structure

```
.
├── .github/
│   ├── agents/              # Custom agent configurations
│   │   ├── plan-agent.json
│   │   ├── implement-agent.json
│   │   ├── test-agent.json
│   │   ├── review-agent.json
│   │   └── refactor-agent.json
│   ├── workflows/           # CI/CD pipelines
│   │   ├── ci.yml
│   │   ├── spec-validation.yml
│   │   └── task-tracking.yml
│   ├── ISSUE_TEMPLATE/      # Issue templates for specs
│   │   ├── feature-spec.yml
│   │   ├── bug-report.yml
│   │   └── task.yml
│   └── PULL_REQUEST_TEMPLATE.md
├── specs/                   # Specification documents
│   ├── README.md
│   └── SPEC_TEMPLATE.md
├── tasks/                   # Task definitions
│   ├── README.md
│   └── TASK_TEMPLATE.md
├── CONTRIBUTING.md          # Contribution guidelines
└── README.md               # This file
```

## 🔄 Continuous Integration

Automated workflows validate:

- **Spec format and completeness** - All specs have required sections
- **Task linking** - PRs link to specs and tasks
- **Code quality** - Linting and formatting
- **Repository structure** - Required directories and files exist
- **Agent configurations** - JSON syntax and required fields

## 📚 Documentation

- [Specs README](specs/README.md) - How to create and manage specs
- [Tasks README](tasks/README.md) - How to create and track tasks
- [CONTRIBUTING.md](CONTRIBUTING.md) - Contribution guidelines

## 🎯 Key Principles

1. **Spec-First Development**
   - Every change starts with a spec
   - Specs capture user intent and requirements
   - Implementation follows the spec exactly

2. **Task-Based Workflow**
   - Specs break down into discrete tasks
   - Each task has clear acceptance criteria
   - Tasks track progress to completion

3. **Agent Collaboration**
   - Agents work autonomously within their roles
   - Iterative feedback loops improve quality
   - Human oversight at key decision points

4. **Traceability**
   - Issues → Specs → Tasks → Commits → PRs → Releases
   - Every change links back to user intent
   - Full audit trail of decisions

5. **Continuous Validation**
   - Tests validate against spec requirements
   - Reviews ensure quality and compliance
   - CI enforces standards automatically

## 🤝 Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines on:
- Creating specs and tasks
- Working with agents
- Code review process
- Release management

## 📄 License

This template is available for use under your chosen license.

## 🙋 Support

- **Documentation**: Check the `specs/` and `tasks/` README files
- **Issues**: Use the issue templates to report problems or request features
- **Discussions**: Share ideas and ask questions in GitHub Discussions

---

**Built for SPEC-driven development with GitHub Copilot custom agents**
