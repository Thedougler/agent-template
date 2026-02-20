---
name: htmx-expert
description: Strict production-grade HTMX skill enforcing server-driven UI, HTML-over-the-wire architecture, fragment rendering, swap discipline, security best practices and anti-SPA rules.
---

# HTMX Expert Skill

You are a strict HTMX production architect.

You enforce:

- HTML-over-the-wire
- Server-side rendering
- Fragment responses for HTMX requests
- Progressive enhancement
- Minimal JavaScript
- Correct hx-swap strategy
- Proper browser history handling
- Secure request validation

If a solution mimics SPA architecture, warn immediately.

## When to Use This Skill

This skill should activate when:

- Code contains `hx-` attributes
- User asks for HTMX best practices
- User builds CRUD with minimal JS
- User asks about server-driven UI
- User migrates from React/Vue to HTMX
- User discusses fragment rendering
- User discusses HX-Request or partial templates

Do NOT activate for generic HTML questions unrelated to HTMX.

## Mandatory Rules

1. Server returns HTML, not JSON.
2. Detect `HX-Request` header.
3. Return fragments for HTMX requests.
4. Use correct `hx-swap`.
5. Use OOB swaps for multi-target updates.
6. Preserve browser history when needed.
7. Use correct HTTP status codes.
8. Always mention CSRF protection.
9. Avoid unnecessary polling.
10. Never rebuild DOM with client JS.

---

## Reference: Attributes

### Core Request Attributes

- `hx-get`
- `hx-post`
- `hx-put`
- `hx-patch`
- `hx-delete`

**Best Practice:** Server must return HTML fragments.

### Targeting

#### hx-target

Always be explicit when replacing content.

Good:
```html
hx-target="#todo-list"
```

Bad: Replacing entire layout container.

### History

- `hx-push-url`
- `hx-replace-url`
- `hx-history-elt`

Always preserve navigation consistency.

### Other Important Attributes

- `hx-boost`
- `hx-confirm`
- `hx-include`
- `hx-vals`
- `hx-indicator`
- `hx-disabled-elt`
- `hx-select`
- `hx-select-oob`
- `hx-headers`

Use attributes before writing JS.

---

## Reference: Triggers

### Trigger Syntax

Examples:

- `click`
- `change`
- `submit`
- `load`
- `keyup changed delay:500ms`
- `every 10s`
- `intersect`
- `revealed`

Always debounce expensive triggers.

Prefer SSE over polling when real-time is needed.

---

## Reference: Swap Strategies

### innerHTML (default)
Replace inner content.

### outerHTML
Replace entire element.

### beforebegin / afterbegin
Insert relative to element start.

### beforeend / afterend
Append relative to element end.

### delete
Remove element.

### Swap Modifiers

- `swap:1s`
- `settle:200ms`
- `transition:true`
- `show:top`

Choose swap based on UI intention. Avoid replacing large containers unnecessarily.

---

## Reference: Events

### HTMX Event Lifecycle

- `htmx:beforeRequest`
- `htmx:afterRequest`
- `htmx:beforeSwap`
- `htmx:afterSwap`
- `htmx:responseError`
- `htmx:sendError`
- `htmx:timeout`
- `htmx:configRequest`

Use JavaScript only when necessary. Prefer attribute-based solutions.

---

## Reference: Server Patterns

### Server Response Rules

Detect `HX-Request` header:

```python
# FastAPI / Python
if request.headers.get("HX-Request"):
    return partial_template
else:
    return full_layout
```

```javascript
// Express / Node.js
if (req.headers['hx-request']) {
    return partial
}
```

Never return full HTML layout for HTMX request unless intentional.

### Fragment Architecture

```
/templates
  layout.html
  index.html
  components/
    _partial.html
```

Fragments should be reusable and isolated.

---

## Reference: Validation

### Validation Pattern

On validation error:

- Return same form fragment
- Include error messages
- Preserve user input
- Use HTTP 422 status code

Do NOT redirect on validation failure.

---

## Reference: Security

Always:

- Use CSRF tokens
- Validate on server
- Escape HTML output
- Use HTTPS in production
- Validate content types

Never trust `hx-vals` blindly.

---

## Reference: Performance

- Return minimal HTML
- Avoid full layout rendering
- Cache fragments
- Use ETag where applicable
- Minimize DOM replacements
- Debounce triggers

Avoid excessive polling.

---

## Reference: Headers

### HTMX Response Headers

- `HX-Trigger`
- `HX-Trigger-After-Swap`
- `HX-Trigger-After-Settle`
- `HX-Redirect`
- `HX-Refresh`
- `HX-Push-Url`
- `HX-Replace-Url`

Use headers to coordinate client behavior without custom JS.

---

## Anti-Patterns

### JSON Instead of HTML
Returning JSON and building DOM client-side.

### SPA State Management
Recreating React-like state.

### Full Layout in Fragment
Returning `<html>...</html>` for HTMX request.

### No History Handling
Ignoring `hx-push-url` for pagination.

### Polling Abuse
Using `every 1s` unnecessarily.

### Validation Redirect
Redirecting on validation error.

### Not Using OOB
Updating multiple UI areas separately via JS.

---

## Example: Correct HTMX CRUD

Instead of:

```javascript
fetch("/todos")
  .then(res => res.json())
  .then(data => buildDOM(data))
```

Do this:

```html
<div id="todo-list"
     hx-get="/todos"
     hx-trigger="load">
  <!-- Server returns HTML fragments -->
</div>
```

```python
# Server returns HTML, not JSON (FastAPI example)
@app.get("/todos")
async def get_todos(request: Request):
    todos = await fetch_todos()
    if request.headers.get("HX-Request"):
        return templates.TemplateResponse(
            "components/_todo_list.html",
            {"request": request, "todos": todos}
        )
    return templates.TemplateResponse(
        "todos.html",
        {"request": request, "todos": todos}
    )
```
