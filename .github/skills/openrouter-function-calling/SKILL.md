---
name: openrouter-function-calling
description: Implement function/tool calling with OpenRouter models. Use when building agents or structured outputs. Trigger with phrases like 'openrouter functions', 'openrouter tools', 'openrouter agent', 'function calling'.
license: MIT
---

# OpenRouter Function Calling

## Overview

This skill demonstrates implementing function calling and tool use patterns with OpenRouter-supported models.

## Prerequisites

- OpenRouter integration
- Model that supports function calling (GPT-4, Claude, etc.)

## Instructions

Follow these steps to implement this skill:

1. **Verify Prerequisites**: Ensure all prerequisites listed above are met
2. **Review the Implementation**: Study the code examples and patterns below
3. **Adapt to Your Environment**: Modify configuration values for your setup
4. **Test the Integration**: Run the verification steps to confirm functionality
5. **Monitor in Production**: Set up appropriate logging and monitoring

## Reference Guides

- [Basic Function Calling](references/basic-function-calling.md) — Define tools, handle tool calls, complete conversation loop
- [Advanced Tool Definitions](references/advanced-tool-definitions.md) — Complex parameters, multiple tools
- [Forced Tool Use](references/forced-tool-use.md) — Require specific tool, required/none modes
- [Model Compatibility](references/model-compatibility.md) — Check tool support, fallback patterns
- [Parallel Tool Calls](references/parallel-tool-calls.md) — Execute multiple tool calls concurrently
- [Streaming with Tools](references/streaming-with-tools.md) — Stream responses with tool call collection
- [Tool Router](references/tool-router.md) — Dispatch and execute tool calls with a router class

## Output

Successful execution produces:

- Working OpenRouter integration
- Verified API connectivity
- Example responses demonstrating functionality

## Error Handling

See [references/errors.md](references/errors.md) for comprehensive error handling.

## Examples

See [references/examples.md](references/examples.md) for detailed examples.

## Resources

- [OpenRouter Documentation](https://openrouter.ai/docs)
- [OpenRouter Models](https://openrouter.ai/models)
- [OpenRouter API Reference](https://openrouter.ai/docs/api-reference)
- [OpenRouter Status](https://status.openrouter.ai)
