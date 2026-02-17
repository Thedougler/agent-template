# Agent Workflow Guide

This guide explains how the five custom agents work together in the SPEC-driven development lifecycle.

## 🤖 The Five Agents

### 1. Plan Agent
Analyzes specs and creates implementation tasks

### 2. Implement Agent
Writes code based on specs and tasks

### 3. Test Agent
Validates implementations against specs

### 4. Review Agent
Evaluates code quality and spec compliance

### 5. Refactor Agent
Improves code quality while maintaining functionality

## 🔄 Complete Workflow

1. **User Intent** → GitHub Issue
2. **Create SPEC** from issue
3. **Plan Agent** → Creates tasks
4. **Implement Agent** → Writes code
5. **Test Agent** → Creates and runs tests
6. **Review Agent** → Reviews code
7. **Refactor Agent** (optional) → Improves code
8. **Submit PR** → Link spec and tasks
9. **Merge** → Complete

## 💡 Usage Examples

### Plan Agent
```
@plan-agent Read SPEC-001 and create implementation tasks
```

### Implement Agent
```
@implement-agent Implement TASK-001-1 following the spec
```

### Test Agent
```
@test-agent Create tests for SPEC-001 acceptance criteria
```

### Review Agent
```
@review-agent Review changes against SPEC-001
```

### Refactor Agent
```
@refactor-agent Improve code quality while keeping tests passing
```

## 🎯 Best Practices

1. **Always start with planning** - Use plan-agent first
2. **One task at a time** - Stay focused
3. **Test early and often** - Use test-agent throughout
4. **Review before PR** - Run review-agent
5. **Iterate on feedback** - Use agents multiple times

## 📚 More Information

See [README.md](../README.md) and [CONTRIBUTING.md](../CONTRIBUTING.md) for complete details.
