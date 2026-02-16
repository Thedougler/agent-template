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

Five specialized agents work together through the development lifecycle, **continuously self-improving** and **optimizing for efficiency**:

### 1. Plan Agent (`plan-agent`)
- Analyzes specs and user intent
- Breaks down requirements into actionable tasks
- Creates implementation plans with dependencies
- Identifies risks and estimates effort
- **Optimizes for rapid iteration and parallel execution**
- **Uses context7 MCP server for latest best practices**

### 2. Implement Agent (`implement-agent`)
- Writes code based on specs and tasks
- Follows existing patterns and conventions
- Creates/updates tests for new functionality
- Ensures spec compliance
- **Maximizes productivity with efficient code**
- **Queries latest documentation via context7**

### 3. Test Agent (`test-agent`)
- Creates comprehensive test suites
- Validates implementation against specs
- Reports coverage and quality metrics
- Identifies edge cases and missing tests
- **Optimizes test suite runtime**
- **Uses current testing frameworks via context7**

### 4. Review Agent (`review-agent`)
- Reviews code changes against specs
- Evaluates code quality and maintainability
- Checks for security vulnerabilities
- Validates test coverage and documentation
- **Provides efficient, prioritized feedback**
- **Verifies against latest security standards via context7**

### 5. Refactor Agent (`refactor-agent`)
- Improves code quality while preserving functionality
- Reduces duplication and complexity
- Optimizes performance where needed
- Maintains backward compatibility
- **Continuously improves codebase efficiency**
- **Applies modern patterns from context7**

### Agent Efficiency Directives

All agents are configured to:
- ✅ **Maximize output and release frequency**
- ✅ **Minimize token usage** while maintaining quality
- ✅ **Continuously self-improve** their operations
- ✅ **Always use latest documentation** via context7 MCP server
- ✅ **Optimize for productivity** and team velocity

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

**→ See [Quick Start Guide](docs/QUICK_START.md) for a 5-minute introduction**

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
│   │   ├── plan-agent.agent.md       # Markdown format (latest)
│   │   ├── implement-agent.agent.md
│   │   ├── test-agent.agent.md
│   │   ├── review-agent.agent.md
│   │   ├── refactor-agent.agent.md
│   │   └── *.json                    # JSON format (legacy)
│   ├── skills/              # Agent Skills for auto-discovery
│   │   ├── SKILL_TEMPLATE.md
│   │   └── spec-driven-development/
│   │       └── SKILL.md
│   ├── workflows/           # CI/CD pipelines
│   │   ├── ci.yml
│   │   ├── spec-validation.yml
│   │   └── task-tracking.yml
│   ├── ISSUE_TEMPLATE/      # Issue templates for specs
│   │   ├── feature-spec.yml
│   │   ├── bug-report.yml
│   │   └── task.yml
│   └── PULL_REQUEST_TEMPLATE.md
├── .vscode/
│   └── mcp.json             # MCP server configuration
├── specs/                   # Specification documents
│   ├── README.md
│   └── SPEC_TEMPLATE.md
├── tasks/                   # Task definitions
│   ├── README.md
│   └── TASK_TEMPLATE.md
├── docs/                    # Documentation
│   ├── README.md            # Documentation index
│   ├── QUICK_START.md       # 5-minute guide
│   ├── AGENT_WORKFLOW.md    # Agent details
│   ├── SKILLS.md            # Agent Skills guide
│   ├── MCP_SERVERS.md       # MCP servers guide
│   └── ARCHITECTURE.md      # System architecture
├── CONTRIBUTING.md          # Contribution guidelines
└── README.md               # This file
```

## 🎓 Advanced Features

### Agent Skills

**Automatic capability enhancement** - Copilot automatically discovers and applies skills based on context:

- **Location**: `.github/skills/`
- **Format**: `SKILL.md` with YAML frontmatter
- **Discovery**: Automatic based on task context
- **Usage**: Applied transparently when relevant

Example: The `spec-driven-development` skill teaches Copilot SPEC-driven methodology automatically.

See [SKILLS.md](docs/SKILLS.md) for complete guide.

### MCP Servers

**Extend Copilot with external tools and data**:

#### Pre-configured Servers

1. **context7** - Latest documentation for technologies
   - Always provides current API docs
   - Returns up-to-date best practices
   - Ensures agents use modern patterns

2. **filesystem** - Local file access
   - Read/write repository files
   - Search codebase
   - Monitor changes

3. **github** - GitHub API integration
   - Create/manage issues and PRs
   - Access workflows
   - Search repositories

#### Configuration

Located in `.vscode/mcp.json` - customize or add servers as needed.

See [MCP_SERVERS.md](docs/MCP_SERVERS.md) for complete guide.

### Custom Agent Format

Agents now use markdown format with YAML frontmatter:

```markdown
---
name: agent-name
description: What the agent does
tools: [filesystem, code_search, mcp]
infer: true
metadata:
  mcp-servers: [context7]
---

# Agent Instructions

Detailed guidance for the agent...
```

Benefits:
- More expressive instructions
- Integrated MCP server configuration
- Efficiency and self-improvement directives
- Backward compatible with JSON format

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
- [Agent Skills Guide](docs/SKILLS.md) - Using and creating agent skills
- [MCP Servers Guide](docs/MCP_SERVERS.md) - Extending Copilot with MCP
- [Agent Workflow](docs/AGENT_WORKFLOW.md) - How agents work together
- [Quick Start](docs/QUICK_START.md) - 5-minute getting started guide
- [Architecture](docs/ARCHITECTURE.md) - System design and components
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
   - **Agents continuously optimize their own performance**

4. **Traceability**
   - Issues → Specs → Tasks → Commits → PRs → Releases
   - Every change links back to user intent
   - Full audit trail of decisions

5. **Continuous Validation**
   - Tests validate against spec requirements
   - Reviews ensure quality and compliance
   - CI enforces standards automatically

6. **Efficiency & Self-Improvement**
   - **Maximize output and release frequency**
   - **Minimize token usage** while maintaining quality
   - **Always use latest documentation** via context7
   - **Continuous improvement** in all processes

## 🤝 Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines on:
- Creating specs and tasks
- Working with agents
- Code review process
- Release management

## 📄 License

This template is available under the MIT License. See [LICENSE](LICENSE) for details.

## 🙋 Support

- **Documentation**: Check the `specs/` and `tasks/` README files
- **Issues**: Use the issue templates to report problems or request features
- **Discussions**: Share ideas and ask questions in GitHub Discussions

---

**Built for SPEC-driven development with GitHub Copilot custom agents**
