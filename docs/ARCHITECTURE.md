# Architecture Overview

## System Architecture

The agent-template implements a SPEC-driven development workflow with five custom agents that collaborate throughout the software development lifecycle.

## Component Diagram

```
┌─────────────────────────────────────────────────────────────────────┐
│                          GitHub Repository                          │
│                                                                     │
│  ┌──────────────┐  ┌──────────────┐  ┌─────────────────────────┐  │
│  │   Issues     │  │    Specs     │  │        Tasks            │  │
│  │              │  │              │  │                         │  │
│  │ - Feature    │──▶│ - SPEC-001   │──▶│ - TASK-001-1         │  │
│  │ - Bug Report │  │ - SPEC-002   │  │ - TASK-001-2         │  │
│  │ - Task       │  │ - SPEC-nnn   │  │ - TASK-nnn-n         │  │
│  └──────────────┘  └──────────────┘  └─────────────────────────┘  │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
                               │
                               ▼
┌─────────────────────────────────────────────────────────────────────┐
│                        VS Code + Copilot                            │
│                                                                     │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────────────────┐ │
│  │ Plan Agent   │  │Implement Agnt│  │      Test Agent          │ │
│  │              │  │              │  │                          │ │
│  │ Creates      │  │ Writes       │  │ Validates                │ │
│  │ tasks from   │──▶│ code for     │──▶│ implementation          │ │
│  │ specs        │  │ tasks        │  │ with tests              │ │
│  └──────────────┘  └──────────────┘  └──────────────────────────┘ │
│                                              │                       │
│  ┌──────────────┐  ┌──────────────┐        │                       │
│  │Refactor Agnt │◀─│ Review Agent │◀───────┘                       │
│  │              │  │              │                                 │
│  │ Improves     │  │ Checks       │                                 │
│  │ code quality │  │ quality &    │                                 │
│  │              │  │ compliance   │                                 │
│  └──────────────┘  └──────────────┘                                 │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
                               │
                               ▼
┌─────────────────────────────────────────────────────────────────────┐
│                         Pull Request                                │
│                                                                     │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────────────────┐ │
│  │  Spec Link   │  │  Task Status │  │    CI Validation         │ │
│  │              │  │              │  │                          │ │
│  │ Closes #123  │  │ [x] TASK-1-1 │  │ ✓ Structure validated    │ │
│  │ SPEC-001     │  │ [x] TASK-1-2 │  │ ✓ Specs formatted        │ │
│  │              │  │ [ ] TASK-1-3 │  │ ✓ Agents configured      │ │
│  └──────────────┘  └──────────────┘  └──────────────────────────┘ │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

## Data Flow

```
1. User Intent
   │
   ├─▶ GitHub Issue (Feature Spec / Bug Report)
   │
   └─▶ SPEC Document
       │
       ├─▶ Requirements
       ├─▶ Acceptance Criteria
       └─▶ Constraints
           │
           ▼
2. Planning Phase
   │
   ├─▶ Plan Agent analyzes SPEC
   │
   └─▶ Creates TASK files
       │
       ├─▶ Task 1 (foundation)
       ├─▶ Task 2 (depends on Task 1)
       └─▶ Task N
           │
           ▼
3. Implementation Phase
   │
   ├─▶ Implement Agent reads TASK
   │
   └─▶ Writes Code
       │
       ├─▶ Source files
       ├─▶ Documentation
       └─▶ Updates TASK status
           │
           ▼
4. Testing Phase
   │
   ├─▶ Test Agent reads SPEC acceptance criteria
   │
   └─▶ Creates Test Suite
       │
       ├─▶ Unit tests
       ├─▶ Integration tests
       └─▶ Edge case tests
           │
           ▼
5. Review Phase
   │
   ├─▶ Review Agent evaluates
   │
   └─▶ Generates Report
       │
       ├─▶ Quality issues
       ├─▶ Security findings
       └─▶ Spec compliance
           │
           ▼
6. Refinement Phase (if needed)
   │
   ├─▶ Refactor Agent improves
   │
   └─▶ Optimized Code
       │
       └─▶ Maintains tests
           │
           ▼
7. Integration
   │
   ├─▶ Pull Request created
   │
   ├─▶ CI/CD validates
   │
   └─▶ Merge to main
       │
       └─▶ Release
```

## Agent Interaction Matrix

```
         │ Plan │Implmnt│ Test │Review │Refctr│
─────────┼──────┼───────┼──────┼───────┼──────┤
Plan     │  -   │  →    │      │       │      │ Creates tasks
Implmnt  │      │   -   │  →   │       │      │ Code → Tests
Test     │  ←   │   ←   │  -   │   →   │      │ Feedback loop
Review   │  ←   │   ←   │  ←   │   -   │  →   │ Quality checks
Refctr   │      │   ←   │  ←   │   ←   │  -   │ Improvements

Legend:
→  Direct output/input
←  Feedback/iteration
-  Self
```

## Technology Stack

### Core Technologies
- **GitHub** - Issues, PRs, CI/CD
- **GitHub Copilot** - AI-powered agents
- **VS Code** - Development environment
- **Git** - Version control

### Automation
- **GitHub Actions** - CI/CD pipelines
- **YAML** - Configuration files
- **JSON** - Agent definitions
- **Markdown** - Documentation

### Validation
- **markdownlint** - Markdown quality
- **jq** - JSON validation
- **bash** - Script automation

## Directory Structure Details

```
agent-template/
│
├── .github/                    # GitHub configuration
│   ├── agents/                # Custom agent definitions
│   │   ├── plan-agent.json
│   │   ├── implement-agent.json
│   │   ├── test-agent.json
│   │   ├── review-agent.json
│   │   └── refactor-agent.json
│   │
│   ├── workflows/             # CI/CD automation
│   │   ├── ci.yml            # Structure & quality checks
│   │   ├── spec-validation.yml  # Spec format validation
│   │   └── task-tracking.yml    # Task automation
│   │
│   ├── ISSUE_TEMPLATE/        # Issue creation templates
│   │   ├── feature-spec.yml
│   │   ├── bug-report.yml
│   │   ├── task.yml
│   │   └── config.yml
│   │
│   └── PULL_REQUEST_TEMPLATE.md  # PR template
│
├── docs/                      # Documentation
│   ├── README.md             # Doc index
│   ├── QUICK_START.md        # Quick start guide
│   ├── AGENT_WORKFLOW.md     # Agent details
│   ├── IMPLEMENTATION_SUMMARY.md  # This implementation
│   └── ARCHITECTURE.md       # This file
│
├── specs/                     # Specifications
│   ├── README.md             # Spec guide
│   ├── SPEC_TEMPLATE.md      # Spec template
│   └── SPEC-001-*.md         # Example spec
│
├── tasks/                     # Task definitions
│   ├── README.md             # Task guide
│   ├── TASK_TEMPLATE.md      # Task template
│   └── TASK-001-1-*.md       # Example task
│
├── .gitattributes            # Git configuration
├── .gitignore                # Ignored files
├── .markdownlint.json        # Linting config
├── CONTRIBUTING.md           # Contribution guide
├── LICENSE                   # MIT License
└── README.md                 # Main overview
```

## Workflow Automation

### Issue → Spec → Task Flow

```
┌──────────────┐
│ Create Issue │
│ (via template)│
└──────┬───────┘
       │
       ▼
┌──────────────┐
│  Auto-label  │◀─── GitHub Actions
│  & validate  │     (task-tracking.yml)
└──────┬───────┘
       │
       ▼
┌──────────────┐
│ Create SPEC  │◀─── Manual or
│     file     │     Agent-assisted
└──────┬───────┘
       │
       ▼
┌──────────────┐
│  Plan Agent  │◀─── VS Code Copilot
│ creates TASKs│
└──────┬───────┘
       │
       ▼
┌──────────────┐
│ Execute TASKs│◀─── Developer +
│ with agents  │     Implement Agent
└──────────────┘
```

### PR Validation Flow

```
┌──────────────┐
│   Open PR    │
└──────┬───────┘
       │
       ▼
┌──────────────────────┐
│  CI Workflow Runs    │
├──────────────────────┤
│ 1. Validate structure│
│ 2. Check spec format │
│ 3. Verify task links │
│ 4. Lint markdown     │
│ 5. Validate agents   │
└──────┬───────────────┘
       │
       ├─── Pass ──▶ ✅ Ready for review
       │
       └─── Fail ──▶ ❌ Fix issues
```

## Security Considerations

### Input Validation
- Issue templates enforce required fields
- Spec validation checks required sections
- Agent configs validated as JSON

### Access Control
- PR reviews required before merge
- CI checks must pass
- Agent actions limited to read/write code

### Traceability
- All changes link to specs
- Audit trail via Git history
- Issue tracking integrated

## Scalability

### Horizontal Scaling
- Multiple developers can work in parallel
- Each on different specs/tasks
- Agents assist individual developers

### Vertical Scaling
- Add more agent types as needed
- Extend templates for new patterns
- Custom workflows per project

### Maintenance
- Documentation is self-contained
- Examples demonstrate usage
- CI enforces consistency

## Future Enhancements

Potential additions:
- Performance benchmarking agent
- Security scanning agent
- Documentation generation agent
- Deployment automation agent
- Metrics collection and reporting
- Multi-language support
- IDE integrations beyond VS Code

## Summary

The architecture provides:

✅ **Modularity** - Independent agents with clear roles
✅ **Automation** - CI/CD handles validation
✅ **Traceability** - Everything links back to specs
✅ **Quality** - Multiple validation layers
✅ **Scalability** - Works for small and large projects
✅ **Extensibility** - Easy to add new agents or workflows
✅ **Documentation** - Comprehensive guides and examples

This creates a robust, maintainable system for SPEC-driven development with AI agents.
