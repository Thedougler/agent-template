---
name: openrouter-known-pitfalls
description: Execute avoid common OpenRouter mistakes and anti-patterns. Use when reviewing code or onboarding developers. Trigger with phrases like 'openrouter pitfalls', 'openrouter mistakes', 'openrouter gotchas', 'openrouter common issues'.
license: MIT
---

# Openrouter Known Pitfalls

## Overview

This skill documents common mistakes, anti-patterns, and gotchas to avoid when working with OpenRouter.

## Prerequisites

- OpenRouter integration or planning one

## Instructions

Follow these steps to implement this skill:

1. **Verify Prerequisites**: Ensure all prerequisites listed above are met
2. **Review the Implementation**: Study the code examples and patterns below
3. **Adapt to Your Environment**: Modify configuration values for your setup
4. **Test the Integration**: Run the verification steps to confirm functionality
5. **Monitor in Production**: Set up appropriate logging and monitoring

## Output

Successful execution produces:

- Working OpenRouter integration
- Verified API connectivity
- Example responses demonstrating functionality

## Error Handling

See [references/errors.md](references/errors.md) for comprehensive error handling.

## Examples

See [references/examples.md](references/examples.md) for detailed examples.

## Reference Guides

- [Authentication Issues](references/authentication-issues.md) — Wrong key formats, missing Bearer prefix, hardcoded keys
- [Cost Surprises](references/cost-surprises.md) — Missing max_tokens, wrong model for task, no cost tracking
- [Error Handling Gaps](references/error-handling-gaps.md) — Missing error handling, empty response handling
- [Model Name Mistakes](references/model-name-mistakes.md) — Missing provider prefix, typos, deprecated names
- [Provider Differences](references/provider-differences.md) — Assuming identical behavior, different response formats
- [Rate Limiting Mistakes](references/rate-limiting-mistakes.md) — No backoff strategy, ignoring rate limit headers
- [Request Format Errors](references/request-format-errors.md) — Invalid message structure, alternating roles violation

## Resources

- [OpenRouter Documentation](https://openrouter.ai/docs)
- [OpenRouter Models](https://openrouter.ai/models)
- [OpenRouter API Reference](https://openrouter.ai/docs/api-reference)
- [OpenRouter Status](https://status.openrouter.ai)
