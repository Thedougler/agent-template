# Agent Skills Guide

## Overview

Agent Skills enable GitHub Copilot to automatically enhance its capabilities by loading specialized instructions and workflows relevant to your work. Skills are discovered automatically and applied on-demand without manual invocation.

## What Are Agent Skills?

Agent Skills are directories containing a `SKILL.md` file with:
- **YAML frontmatter**: Metadata describing the skill's purpose, tags, and when to use it
- **Detailed instructions**: Task-specific guidance, best practices, and examples
- **Supporting resources**: Templates, scripts, or reference materials

## Skill Discovery

Copilot automatically scans for skills in:
1. **Repository**: `.github/skills/`
2. **User profile**: `~/.copilot/skills/` or `~/.config/copilot/skills/`
3. **Organization**: `{org}/.github/skills/`

### Priority Order
User-level skills take precedence over repository skills, which take precedence over organization skills.

## Creating a Skill

### 1. Create Skill Directory

```bash
mkdir -p .github/skills/my-skill-name
```

### 2. Create SKILL.md File

Use this structure:

```markdown
---
name: skill-name
description: What this skill does and when to use it
tags: [tag1, tag2, tag3]
version: 1.0.0
---

# Skill Name

## Overview
Brief description of the skill

## When to Use This Skill
- Specific scenarios
- Types of prompts
- File patterns

## Instructions
Detailed step-by-step guidance

## Best Practices
- Practice 1
- Practice 2

## Examples
Code examples and use cases
```

### 3. Add Supporting Resources (Optional)

```
.github/skills/my-skill-name/
├── SKILL.md
├── templates/
│   └── example-template.md
└── scripts/
    └── helper-script.sh
```

## Automatic Skill Loading

### How It Works

1. **Prompt Analysis**: When you write a prompt, Copilot analyzes it
2. **Skill Matching**: Checks skill descriptions for relevance
3. **Context Loading**: Loads matching skill instructions
4. **Application**: Applies skill guidance to generate response
5. **Resource Access**: Pulls in supporting files if needed

### Example Flow

```
User: "Create a new spec for user authentication"
  ↓
Copilot detects: Matches "spec-driven-development" skill
  ↓
Loads: SKILL.md with SPEC creation instructions
  ↓
Applies: SPEC structure, naming conventions, best practices
  ↓
Generates: Properly formatted SPEC document
```

## Available Skills in This Repository

### 1. SPEC-Driven Development Skill

**Location**: `.github/skills/spec-driven-development/`

**Purpose**: Teaches Copilot the SPEC-driven methodology

**Automatically Applies When**:
- Creating specifications
- Breaking down tasks
- Implementing from specs
- Testing against acceptance criteria
- Reviewing for spec compliance

**Key Features**:
- SPEC document structure
- Task breakdown guidelines
- Implementation workflow
- Testing strategies
- Review checklist

## Creating Your Own Skills

### Skill Template

Use `.github/skills/SKILL_TEMPLATE.md` as a starting point.

### Best Practices for Skill Creation

1. **Clear Description**
   - Be specific about when to use the skill
   - Include trigger keywords
   - Define scope clearly

2. **Structured Instructions**
   - Break down into steps
   - Use numbered lists
   - Include decision points

3. **Practical Examples**
   - Show before/after code
   - Include common patterns
   - Demonstrate edge cases

4. **Concise but Complete**
   - Focus on essential information
   - Link to full documentation
   - Avoid redundancy

5. **Keep Updated**
   - Review periodically
   - Update for new best practices
   - Remove outdated patterns

## Skill Organization

### By Domain
```
.github/skills/
├── backend-api/
│   └── SKILL.md
├── frontend-components/
│   └── SKILL.md
└── database-migrations/
    └── SKILL.md
```

### By Workflow
```
.github/skills/
├── spec-driven-development/
│   └── SKILL.md
├── security-review/
│   └── SKILL.md
└── performance-optimization/
    └── SKILL.md
```

### By Technology
```
.github/skills/
├── python-testing/
│   └── SKILL.md
├── react-best-practices/
│   └── SKILL.md
└── sql-optimization/
    └── SKILL.md
```

## Skill Metadata

### YAML Frontmatter Fields

```yaml
---
name: skill-identifier
description: One-line description for matching
tags: [relevant, keywords, for, search]
version: 1.0.0
author: Team or Individual
updated: 2026-02-16
dependencies: [other-skill-name]
priority: high|medium|low
---
```

**Required Fields**:
- `name`: Unique identifier
- `description`: Matching criteria

**Optional Fields**:
- `tags`: Search keywords
- `version`: Semantic versioning
- `author`: Creator attribution
- `updated`: Last modification date
- `dependencies`: Related skills
- `priority`: Loading priority

## Advanced Features

### Conditional Application

Use description to define conditions:

```yaml
---
description: Apply when creating React components with TypeScript and hooks
---
```

### Resource References

Reference files in skill directory:

```markdown
## Template

See [component template](./templates/component.tsx) for structure.

## Helper Script

Run `./scripts/setup.sh` to configure environment.
```

### Skill Chaining

Reference other skills:

```markdown
## Related Skills

This skill builds on:
- `spec-driven-development`: For overall workflow
- `testing-strategy`: For test creation
```

## Debugging Skills

### Verify Skill is Loaded

Skills are loaded silently. To verify:

1. Check Copilot behavior matches skill guidance
2. Look for skill-specific patterns in responses
3. Test prompts that should trigger the skill

### Skill Not Loading?

Check:
- [ ] Skill directory in correct location
- [ ] SKILL.md file exists
- [ ] YAML frontmatter is valid
- [ ] Description is specific enough
- [ ] File permissions are correct

### Testing Skills

Create test prompts that should trigger your skill:

```
# Test prompt for spec-driven-development skill
"Create a spec for adding user login feature"

# Expected: Response uses SPEC template structure
# Expected: Includes all required sections
# Expected: Follows naming conventions
```

## Performance Considerations

### Skill Size

- Keep SKILL.md under 10KB
- Use external files for large resources
- Link to documentation instead of duplicating

### Number of Skills

- No hard limit
- More skills = longer discovery time
- Group related skills when possible
- Prioritize frequently used skills

### Loading Time

- Skills load on-demand
- Only relevant skills are loaded
- First use may be slower
- Subsequent uses are cached

## Sharing Skills

### With Team

Commit to repository:
```bash
git add .github/skills/
git commit -m "Add team skill for API design"
git push
```

### With Organization

Place in organization `.github` repository:
```
{org}/.github/skills/
```

### With Community

Share via GitHub:
1. Create public repository
2. Document in README
3. Tag with `copilot-skills`
4. Share on GitHub Discussions

## Example Skills

### API Design Skill

```markdown
---
name: api-design
description: RESTful API design following team conventions
tags: [api, rest, endpoints, design]
---

# API Design Skill

## Endpoint Naming
- Use plural nouns: `/users`, `/posts`
- Versioning: `/v1/users`
- Resources: `/users/{id}`
- Actions: POST `/users/{id}/activate`

## Response Format
Always return:
- Status code
- Data payload
- Metadata
- Error details (if failed)
```

### Testing Skill

```markdown
---
name: testing-strategy
description: Comprehensive testing approach for all code
tags: [testing, tdd, coverage]
---

# Testing Strategy

## Test Types
1. Unit tests: Individual functions
2. Integration tests: Component interaction
3. E2E tests: Full workflows

## Coverage Requirements
- 80% minimum code coverage
- 100% critical path coverage
- All error conditions tested
```

## Integration with Agents

Skills work seamlessly with custom agents:

- **plan-agent**: Uses skills during task planning
- **implement-agent**: Applies skills during coding
- **test-agent**: References skills for testing
- **review-agent**: Validates against skill guidelines
- **refactor-agent**: Follows skill best practices

## Best Practices

1. **Start Small**: Create one skill at a time
2. **Test Thoroughly**: Verify skill applies correctly
3. **Iterate**: Refine based on usage
4. **Document**: Include examples and explanations
5. **Maintain**: Keep skills current
6. **Share**: Contribute useful skills back to community

## Resources

- [GitHub Copilot Skills Documentation](https://docs.github.com/en/copilot/concepts/agents/about-agent-skills)
- [VS Code Skills Guide](https://code.visualstudio.com/docs/copilot/customization/agent-skills)
- [Community Skills](https://github.com/topics/copilot-skills)

## Troubleshooting

### Skill Not Working

1. Check YAML syntax with validator
2. Verify file location
3. Test with explicit prompt
4. Check Copilot logs
5. Simplify and retry

### Conflicting Skills

If multiple skills match:
- Copilot chooses most specific
- User-level overrides repository
- Can disable skills in settings

### Performance Issues

- Reduce skill file size
- Remove unused skills
- Optimize instructions
- Use external references

---

**Remember**: Skills are automatically discovered and applied. Create focused, well-documented skills for the best results.
