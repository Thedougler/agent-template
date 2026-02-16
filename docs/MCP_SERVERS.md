# MCP Servers Guide

## Overview

Model Context Protocol (MCP) is an open standard that enables GitHub Copilot to connect to external tools, APIs, databases, and services. MCP servers extend Copilot's capabilities with real-time data and custom actions.

## What is MCP?

**Model Context Protocol** defines how applications and models connect and share:
- **Context**: Access to external data sources
- **Actions**: Ability to invoke tools and services
- **Knowledge**: Integration with proprietary or specialized systems

### Benefits

- **Real-time Data**: Access current information (APIs, databases, files)
- **Custom Tools**: Extend Copilot with team-specific functionality
- **Standardized Integration**: One protocol for all extensions
- **Secure**: Enterprise-grade security and governance
- **Extensible**: Easy to add new capabilities

## MCP Architecture

```
┌─────────────────┐
│  GitHub Copilot │ (Client)
│   in VS Code    │
└────────┬────────┘
         │
         │ MCP Protocol
         │
    ┌────┴─────┬──────────┬──────────┐
    │          │          │          │
┌───▼────┐ ┌──▼────┐ ┌───▼────┐ ┌───▼────┐
│Context7│ │GitHub │ │FileSys │ │Custom  │
│ Server │ │Server │ │ Server │ │ Server │
└────────┘ └───────┘ └────────┘ └────────┘
    │          │          │          │
    │          │          │          │
┌───▼────┐ ┌──▼────┐ ┌───▼────┐ ┌───▼────┐
│  Docs  │ │  API  │ │  Files │ │ Custom │
│Database│ │       │ │        │ │  Tool  │
└────────┘ └───────┘ └────────┘ └────────┘
```

## Configuration

### MCP Configuration File

Location: `.vscode/mcp.json`

```json
{
  "$schema": "https://modelcontextprotocol.io/schema/mcp.json",
  "mcpServers": {
    "server-name": {
      "command": "npx",
      "args": ["-y", "@package/mcp-server"],
      "description": "What this server provides",
      "enabled": true,
      "priority": 1
    }
  },
  "settings": {
    "autoConnect": true,
    "timeout": 30000,
    "retryAttempts": 3
  }
}
```

### Field Descriptions

**mcpServers**:
- `command`: Executable to run (npx, node, python, etc.)
- `args`: Command arguments
- `description`: What the server does
- `enabled`: Whether to load automatically
- `priority`: Loading order (1 = highest)
- `env`: Environment variables (optional)

**settings**:
- `autoConnect`: Connect on VS Code startup
- `timeout`: Connection timeout (milliseconds)
- `retryAttempts`: Number of retry attempts

## Pre-configured Servers

### 1. Context7 Server

**Purpose**: Access latest documentation for technologies

**Configuration**:
```json
"context7": {
  "command": "npx",
  "args": ["-y", "@context7/mcp-server"],
  "description": "Latest documentation for frameworks and APIs",
  "enabled": true,
  "priority": 1
}
```

**Usage**:
- Automatically queries for up-to-date documentation
- Returns current API references
- Provides latest best practices
- Checks security advisories

**When to Use**:
- Before implementing features
- When choosing libraries
- For performance optimization
- During code review

**Example**:
```
User: "How do I use React hooks with TypeScript?"
  ↓
Copilot queries context7 → Gets React 18 + TS 5 docs
  ↓
Returns current best practices with examples
```

### 2. GitHub Server

**Purpose**: Interact with GitHub API

**Configuration**:
```json
"github": {
  "command": "npx",
  "args": ["-y", "@modelcontextprotocol/server-github"],
  "description": "GitHub API integration",
  "enabled": true,
  "env": {
    "GITHUB_TOKEN": "${GITHUB_TOKEN}"
  }
}
```

**Capabilities**:
- Create/update issues
- Manage pull requests
- Search repositories
- Access workflows
- Read/write files

**Example**:
```
User: "Create an issue for the spec we just discussed"
  ↓
Copilot uses GitHub MCP server
  ↓
Creates issue with proper formatting and labels
```

### 3. Filesystem Server

**Purpose**: Local file system access

**Configuration**:
```json
"filesystem": {
  "command": "npx",
  "args": ["-y", "@modelcontextprotocol/server-filesystem", "."],
  "description": "Local filesystem access",
  "enabled": true
}
```

**Capabilities**:
- Read files
- Write files
- List directories
- Search content
- Watch for changes

## Adding MCP Servers

### Method 1: Via VS Code Extensions

1. Open Extensions view (Ctrl+Shift+X)
2. Search for "@mcp"
3. Install desired MCP server
4. Configure in `.vscode/mcp.json`

### Method 2: Manual Configuration

1. Edit `.vscode/mcp.json`
2. Add server configuration
3. Install dependencies (if needed)
4. Restart VS Code

### Method 3: From Registry

Visit [MCP Registry](https://github.com/modelcontextprotocol/servers) for available servers.

## Common MCP Servers

### Database Servers

**PostgreSQL**:
```json
"postgres": {
  "command": "npx",
  "args": ["-y", "@modelcontextprotocol/server-postgres"],
  "env": {
    "DATABASE_URL": "${DATABASE_URL}"
  }
}
```

**MongoDB**:
```json
"mongodb": {
  "command": "npx",
  "args": ["-y", "@modelcontextprotocol/server-mongodb"],
  "env": {
    "MONGO_URI": "${MONGO_URI}"
  }
}
```

### API Servers

**REST API**:
```json
"api": {
  "command": "npx",
  "args": ["-y", "@modelcontextprotocol/server-fetch"],
  "description": "HTTP API access"
}
```

**Slack**:
```json
"slack": {
  "command": "npx",
  "args": ["-y", "@modelcontextprotocol/server-slack"],
  "env": {
    "SLACK_TOKEN": "${SLACK_TOKEN}"
  }
}
```

### Development Tools

**Git**:
```json
"git": {
  "command": "npx",
  "args": ["-y", "@modelcontextprotocol/server-git"]
}
```

**Docker**:
```json
"docker": {
  "command": "npx",
  "args": ["-y", "@modelcontextprotocol/server-docker"]
}
```

## Creating Custom MCP Server

### Step 1: Choose SDK

Available SDKs:
- **TypeScript**: `@modelcontextprotocol/sdk`
- **Python**: `mcp`
- **.NET**: `ModelContextProtocol`
- **Go**: `github.com/mark3labs/mcp-go`

### Step 2: Create Server

**TypeScript Example**:
```typescript
import { Server } from "@modelcontextprotocol/sdk/server/index.js";
import { StdioServerTransport } from "@modelcontextprotocol/sdk/server/stdio.js";

const server = new Server({
  name: "my-custom-server",
  version: "1.0.0",
}, {
  capabilities: {
    tools: {},
  },
});

// Define a tool
server.setRequestHandler("tools/list", async () => ({
  tools: [{
    name: "my_tool",
    description: "What this tool does",
    inputSchema: {
      type: "object",
      properties: {
        param: { type: "string" }
      }
    }
  }]
}));

// Handle tool calls
server.setRequestHandler("tools/call", async (request) => {
  const { name, arguments: args } = request.params;

  if (name === "my_tool") {
    // Implement tool logic
    return { content: [{ type: "text", text: "Result" }] };
  }
});

// Start server
const transport = new StdioServerTransport();
await server.connect(transport);
```

### Step 3: Configure

Add to `.vscode/mcp.json`:
```json
"my-custom-server": {
  "command": "node",
  "args": ["./path/to/server.js"],
  "description": "My custom tool"
}
```

## Security Considerations

### Trust

**Only add trusted MCP servers:**
- Servers have access to your machine
- Can read/write files
- Can make network requests
- Can execute commands

### Credentials

**Secure credential management:**
```json
"env": {
  "API_KEY": "${API_KEY}"
}
```

Use environment variables, not hardcoded credentials.

### Permissions

**Scope access appropriately:**
- Filesystem: Limit to specific directories
- Network: Restrict to specific domains
- APIs: Use read-only tokens when possible

### Enterprise Controls

**For organizations:**
- Centrally managed MCP policies
- Approved server allowlist
- Network restrictions (VNet)
- Audit logging
- Data loss prevention (DLP)

## Usage in Agents

All custom agents are configured to use MCP servers:

```yaml
---
name: agent-name
mcp-servers:
  - context7
  - github
  - filesystem
---
```

### Agent + Context7 Workflow

```
1. Agent receives task
2. Queries context7 for latest docs
3. Uses current best practices
4. Implements with up-to-date patterns
5. References latest security guidelines
```

## Efficiency Guidelines

### Minimize Token Usage

**Query context7 efficiently:**
```
❌ "Explain all React hooks in detail"
✅ "Show latest useEffect syntax for cleanup"
```

**Use specific queries:**
```
❌ "What are JavaScript best practices?"
✅ "Modern async/await error handling patterns"
```

### Maximize Productivity

**Leverage MCP for:**
1. **Latest Documentation**: Always current
2. **API Integration**: Direct access to services
3. **Data Access**: Query databases directly
4. **Automation**: Create issues, PRs automatically
5. **Validation**: Check against live systems

## Troubleshooting

### Server Not Connecting

1. Check command is installed
   ```bash
   npx -y @context7/mcp-server --version
   ```

2. Verify configuration syntax
   ```bash
   cat .vscode/mcp.json | jq .
   ```

3. Check VS Code logs
   - View → Output
   - Select "MCP Servers" from dropdown

4. Test server directly
   ```bash
   node server.js
   ```

### Server Timeout

- Increase `timeout` in settings
- Check network connectivity
- Verify server is responsive
- Review server logs

### Permission Errors

- Check file permissions
- Verify environment variables set
- Ensure API tokens are valid
- Review security policies

## Performance Optimization

### Connection Pooling

Reuse connections when possible:
```json
"settings": {
  "keepAlive": true,
  "maxConnections": 10
}
```

### Caching

Cache expensive queries:
```typescript
const cache = new Map();

async function query(key) {
  if (cache.has(key)) {
    return cache.get(key);
  }

  const result = await expensiveQuery(key);
  cache.set(key, result);
  return result;
}
```

### Lazy Loading

Load servers only when needed:
```json
"server-name": {
  "enabled": false,
  "autoConnect": false
}
```

Activate manually when required.

## Best Practices

1. **Start with essentials**: context7, filesystem, github
2. **Add as needed**: Don't load unused servers
3. **Secure credentials**: Use environment variables
4. **Test thoroughly**: Verify server behavior
5. **Monitor performance**: Check connection times
6. **Document usage**: Note why each server is added
7. **Keep updated**: Update server packages regularly

## Example Use Cases

### Use Case 1: SPEC-Driven Development

```
1. User creates spec
2. Copilot queries context7 for latest framework docs
3. plan-agent uses current best practices
4. implement-agent writes modern code
5. test-agent uses latest testing patterns
```

### Use Case 2: Automated Issue Creation

```
1. Bug discovered during development
2. Copilot uses GitHub MCP server
3. Creates issue with:
   - Proper formatting
   - Relevant labels
   - Linked to commit
4. Notifies team
```

### Use Case 3: Database Query Optimization

```
1. Slow query identified
2. Copilot uses database MCP server
3. Analyzes query plan
4. Suggests optimizations
5. Tests improvements
```

## Resources

- [MCP Specification](https://spec.modelcontextprotocol.io/)
- [MCP Servers Repository](https://github.com/modelcontextprotocol/servers)
- [GitHub Copilot MCP Docs](https://docs.github.com/en/copilot/customizing-copilot/using-model-context-protocol)
- [VS Code MCP Guide](https://code.visualstudio.com/docs/copilot/customization/mcp-servers)
- [Building MCP Servers](https://github.blog/ai-and-ml/github-copilot/building-your-first-mcp-server-how-to-extend-ai-tools-with-custom-capabilities/)

---

**Remember**: MCP servers extend Copilot with real-time data and custom actions. Use context7 to always work with the latest documentation and best practices.
