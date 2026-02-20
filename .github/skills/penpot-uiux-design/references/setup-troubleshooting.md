# Penpot MCP Server Setup & Troubleshooting

## Installation

```bash
# Clone and install
git clone https://github.com/penpot/penpot-mcp.git
cd penpot-mcp
npm install

# Build and start servers
npm run bootstrap
```

## Penpot Plugin Setup

1. Open a design file in Penpot
2. Go to **Plugins** → **Load plugin from URL**
3. Enter: `http://localhost:4400/manifest.json`
4. Click **"Connect to MCP server"** in the plugin UI

## VS Code Configuration

Add to `settings.json`:

```json
{
  "mcp": {
    "servers": {
      "penpot": {
        "url": "http://localhost:4401/sse"
      }
    }
  }
}
```

## Troubleshooting

| Issue | Solution |
| ----- | -------- |
| Plugin won't connect | Check servers are running (`npm run start:all` in penpot-mcp dir) |
| Browser blocks localhost | Allow local network access prompt, disable Brave Shield, or try Firefox |
| Tools not appearing in client | Restart VS Code/Claude completely after config changes |
| Tool execution fails/times out | Ensure Penpot plugin UI is open and shows "Connected" |
| "WebSocket connection failed" | Check firewall allows ports 4400, 4401, 4402 |
| `npm run bootstrap` fails | Ensure Node.js 18+ is installed; try `rm -rf node_modules && npm install` |
| Plugin shows "Disconnected" | Refresh Penpot tab; restart servers with `npm run start:all` |

## Verifying Connection

1. Try calling `mcp__penpot__penpot_api_info` — if it succeeds, the server is connected.
2. If a tool call fails, ensure the Penpot plugin UI shows "Connected" status.
3. Check terminal output from `npm run start:all` for error messages.
