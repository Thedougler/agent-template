# Quick Start Guide

Get started with SPEC-driven development in 5 minutes.

## 📋 Prerequisites

- Git installed
- VS Code with GitHub Copilot
- Repository cloned locally

## 🚀 5-Minute Quick Start

### Step 1: Create Your First Spec (2 minutes)

**Option A: Via GitHub Issue**
1. Go to Issues → New Issue
2. Select "Feature Spec" template
3. Fill in:
   - User intent: What you want to accomplish
   - Requirements: What must work
   - Acceptance criteria: How you'll know it's done
4. Click "Submit new issue"

**Option B: Via File**
```bash
cp specs/SPEC_TEMPLATE.md specs/SPEC-002-my-feature.md
# Edit the file with your requirements
```

### Step 2: Create Tasks (1 minute)

In VS Code with GitHub Copilot:
```
@plan-agent Read SPEC-002 and create implementation tasks
```

The plan-agent will create task files in the `tasks/` directory.

### Step 3: Implement (varies)

For each task:
```
@implement-agent Implement TASK-002-1 following the spec
```

### Step 4: Test (1 minute)

```
@test-agent Create tests for SPEC-002 acceptance criteria
```

### Step 5: Review and Submit (1 minute)

```
@review-agent Review my changes against SPEC-002
```

Then create a PR linking your spec and tasks.

## 📁 Repository Overview

```
agent-template/
├── .github/
│   ├── agents/              ← 5 custom agents
│   ├── workflows/           ← CI/CD automation
│   └── ISSUE_TEMPLATE/      ← Issue templates
├── specs/                   ← Specifications
├── tasks/                   ← Task definitions
├── docs/                    ← Documentation
├── README.md                ← Overview
└── CONTRIBUTING.md          ← Contribution guide
```

## 🤖 The Five Agents

| Agent | Purpose | When to Use |
|-------|---------|-------------|
| **plan-agent** | Create tasks from specs | After writing a spec |
| **implement-agent** | Write code | For each task |
| **test-agent** | Create/run tests | After implementation |
| **review-agent** | Review code | Before submitting PR |
| **refactor-agent** | Improve code | When code needs cleanup |

## 💡 Common Commands

```bash
# Create a new spec
cp specs/SPEC_TEMPLATE.md specs/SPEC-XXX-feature-name.md

# Create a new task
cp tasks/TASK_TEMPLATE.md tasks/TASK-XXX-Y-task-name.md

# Check repository structure
ls -R .github/ specs/ tasks/

# View agent configurations
cat .github/agents/plan-agent.json
```

## 🔄 Typical Workflow

```
1. Issue → 2. Spec → 3. Tasks → 4. Code → 5. Tests → 6. Review → 7. PR → 8. Merge
```

Each step uses the appropriate agent to maintain quality and traceability.

## 📖 Learn More

- [README.md](README.md) - Full overview
- [CONTRIBUTING.md](CONTRIBUTING.md) - Detailed guidelines
- [docs/AGENT_WORKFLOW.md](docs/AGENT_WORKFLOW.md) - Agent details
- [specs/SPEC-001-example-calculator.md](specs/SPEC-001-example-calculator.md) - Complete example

## 🆘 Need Help?

1. Check the example spec: `specs/SPEC-001-example-calculator.md`
2. Check the example task: `tasks/TASK-001-1-create-calculator-structure.md`
3. Read the agent workflow guide: `docs/AGENT_WORKFLOW.md`
4. Open a discussion on GitHub

## 🎯 Key Principles

1. **Spec First** - Every change starts with a spec
2. **Task-Based** - Break specs into small tasks
3. **Agent-Assisted** - Use agents for planning, coding, testing, review
4. **Traceable** - Link everything: issues → specs → tasks → commits → PRs
5. **Iterative** - Test and review continuously

## ✅ Success Checklist

Before submitting a PR, verify:

- [ ] Spec documents user intent and requirements
- [ ] Tasks break down the work into manageable pieces
- [ ] Code implements all acceptance criteria
- [ ] Tests cover edge cases and validate requirements
- [ ] Review agent found no critical issues
- [ ] CI checks pass
- [ ] PR links to spec and tasks

---

**You're ready to start! Create your first spec and let the agents guide you through the development process.**
