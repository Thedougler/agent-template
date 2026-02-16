# Documentation Index

Welcome to the agent-template documentation! This index helps you find what you need.

## 📚 Core Documentation

### Getting Started
- **[Quick Start Guide](QUICK_START.md)** - Get up and running in 5 minutes
- **[Agent Workflow Guide](AGENT_WORKFLOW.md)** - How agents work together
- **[Main README](../README.md)** - Complete overview of the template
- **[Contributing Guide](../CONTRIBUTING.md)** - How to contribute

### Advanced Features
- **[Agent Skills Guide](SKILLS.md)** - Using and creating agent skills
- **[MCP Servers Guide](MCP_SERVERS.md)** - Extending Copilot with MCP servers

### Specifications
- **[Specs README](../specs/README.md)** - How to create and manage specs
- **[Spec Template](../specs/SPEC_TEMPLATE.md)** - Template for new specs
- **[Example Spec](../specs/SPEC-001-example-calculator.md)** - Complete example

### Tasks
- **[Tasks README](../tasks/README.md)** - How to create and track tasks
- **[Task Template](../tasks/TASK_TEMPLATE.md)** - Template for new tasks
- **[Example Task](../tasks/TASK-001-1-create-calculator-structure.md)** - Complete example

## 🤖 Agent Documentation

### Agent Configurations

Agents are now in **markdown format** with YAML frontmatter (`.agent.md`):

1. **[plan-agent.agent.md](../.github/agents/plan-agent.agent.md)** - Planning and task creation
2. **[implement-agent.agent.md](../.github/agents/implement-agent.agent.md)** - Code implementation
3. **[test-agent.agent.md](../.github/agents/test-agent.agent.md)** - Testing and validation
4. **[review-agent.agent.md](../.github/agents/review-agent.agent.md)** - Code review
5. **[refactor-agent.agent.md](../.github/agents/refactor-agent.agent.md)** - Code improvement

**Legacy JSON format** still supported for backward compatibility.

### Agent Efficiency Features

All agents now include:
- ✅ **Self-improvement directives** - Continuously optimize their operation
- ✅ **Token optimization** - Minimize usage while maximizing value
- ✅ **Productivity focus** - Maximize output and release frequency
- ✅ **Latest documentation** - Always use context7 MCP server
- ✅ **Performance metrics** - Track and improve effectiveness

## 🎓 Skills and Extensions

### Agent Skills

Located in `.github/skills/`:

- **[SKILL_TEMPLATE.md](../.github/skills/SKILL_TEMPLATE.md)** - Template for creating skills
- **[spec-driven-development](../.github/skills/spec-driven-development/SKILL.md)** - SPEC methodology skill

Skills are **automatically discovered** and applied by Copilot based on context.

### MCP Servers

Configured in `.vscode/mcp.json`:

- **context7** - Latest documentation for all technologies
- **filesystem** - Local file system access
- **github** - GitHub API integration

Add custom MCP servers to extend Copilot's capabilities.

## 🔧 GitHub Configuration

### Issue Templates
Located in `.github/ISSUE_TEMPLATE/`:

- **[feature-spec.yml](../.github/ISSUE_TEMPLATE/feature-spec.yml)** - For new features
- **[bug-report.yml](../.github/ISSUE_TEMPLATE/bug-report.yml)** - For bug reports
- **[task.yml](../.github/ISSUE_TEMPLATE/task.yml)** - For implementation tasks
- **[config.yml](../.github/ISSUE_TEMPLATE/config.yml)** - Template configuration

### Workflow Files
Located in `.github/workflows/`:

- **[ci.yml](../.github/workflows/ci.yml)** - Continuous integration checks
- **[spec-validation.yml](../.github/workflows/spec-validation.yml)** - Validate specs and linking
- **[task-tracking.yml](../.github/workflows/task-tracking.yml)** - Task status automation

### Pull Request Template
- **[PULL_REQUEST_TEMPLATE.md](../.github/PULL_REQUEST_TEMPLATE.md)** - Template for PRs

## 📖 How to Use This Documentation

### I want to...

**...get started quickly**
→ Read [Quick Start Guide](QUICK_START.md)

**...understand the workflow**
→ Read [Agent Workflow Guide](AGENT_WORKFLOW.md)

**...create a new feature**
1. Read [Specs README](../specs/README.md)
2. Copy [Spec Template](../specs/SPEC_TEMPLATE.md)
3. Use plan-agent to create tasks

**...implement a task**
1. Read the spec and task files
2. Use implement-agent to write code
3. Follow [Contributing Guide](../CONTRIBUTING.md)

**...understand agents**
→ Read [Agent Workflow Guide](AGENT_WORKFLOW.md) and check agent JSON files

**...set up CI/CD**
→ Review workflow files in `.github/workflows/`

**...contribute**
→ Read [Contributing Guide](../CONTRIBUTING.md)

## 🎯 Documentation by Role

### For New Users
1. [Quick Start Guide](QUICK_START.md)
2. [Main README](../README.md)
3. [Example Spec](../specs/SPEC-001-example-calculator.md)

### For Developers
1. [Contributing Guide](../CONTRIBUTING.md)
2. [Agent Workflow Guide](AGENT_WORKFLOW.md)
3. [Specs README](../specs/README.md)
4. [Tasks README](../tasks/README.md)

### For Maintainers
1. [Agent Configurations](../.github/agents/)
2. [Workflow Files](../.github/workflows/)
3. [Issue Templates](../.github/ISSUE_TEMPLATE/)

### For Project Managers
1. [Main README](../README.md)
2. [Specs README](../specs/README.md)
3. [Task Tracking Workflow](../.github/workflows/task-tracking.yml)

## 🔍 Quick Reference

### File Structure
```
agent-template/
├── docs/                    ← You are here
│   ├── README.md           ← This file
│   ├── QUICK_START.md      ← 5-minute guide
│   └── AGENT_WORKFLOW.md   ← Agent details
├── specs/                   ← Specifications
│   ├── README.md
│   ├── SPEC_TEMPLATE.md
│   └── SPEC-001-*.md
├── tasks/                   ← Task definitions
│   ├── README.md
│   ├── TASK_TEMPLATE.md
│   └── TASK-*-*.md
├── .github/
│   ├── agents/             ← Agent configs
│   ├── workflows/          ← CI/CD
│   └── ISSUE_TEMPLATE/     ← Templates
├── README.md               ← Main overview
├── CONTRIBUTING.md         ← Contribution guide
└── LICENSE                 ← MIT License
```

### Key Commands

```bash
# Create new spec
cp specs/SPEC_TEMPLATE.md specs/SPEC-XXX-name.md

# Create new task
cp tasks/TASK_TEMPLATE.md tasks/TASK-XXX-Y-name.md

# View repository structure
tree -L 2 .github/ specs/ tasks/

# Check all markdown files
find . -name "*.md" -type f
```

### Agent Usage

```
@plan-agent Read SPEC-XXX and create tasks
@implement-agent Implement TASK-XXX-Y
@test-agent Test SPEC-XXX acceptance criteria
@review-agent Review changes for SPEC-XXX
@refactor-agent Improve code quality
```

## 📝 Documentation Standards

When contributing to documentation:

1. **Clear and concise** - Get to the point quickly
2. **Examples included** - Show, don't just tell
3. **Up to date** - Keep in sync with code
4. **Well organized** - Use clear headings and structure
5. **Linked properly** - Cross-reference related docs

## 🤝 Contributing to Docs

Found a typo? Have a suggestion? Want to add more examples?

1. Open an issue describing the improvement
2. Submit a PR with your changes
3. Link to the issue in your PR

See [Contributing Guide](../CONTRIBUTING.md) for details.

## 📧 Questions?

- Check this index for relevant docs
- Search existing issues on GitHub
- Open a discussion for general questions
- Open an issue for bugs or feature requests

---

**Happy reading! 📖**
