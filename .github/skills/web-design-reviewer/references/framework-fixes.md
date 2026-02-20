# Framework-Specific Fix Guidelines

Recommended approaches for applying design fixes across common frontend frameworks.

## React / Next.js

| Styling Method | Fix Location | Notes |
| -------------- | ------------ | ----- |
| CSS Modules | `*.module.css` alongside component | Scoped by default; safe to edit |
| Tailwind CSS | `className` in JSX | Use utility classes; check `tailwind.config` |
| styled-components | Same `.tsx`/`.jsx` file | Edit template literals |
| Inline styles | `style={{}}` in JSX | Last resort; avoid for layout |

**Tips:**
- Check `globals.css` or `layout.tsx` for inherited styles
- Next.js App Router: styles in `app/` layout files cascade to children
- Use React DevTools to trace component hierarchy

## Vue / Nuxt

| Styling Method | Fix Location | Notes |
| -------------- | ------------ | ----- |
| `<style scoped>` | Same `.vue` SFC | Scoped; no side effects |
| `<style>` (unscoped) | Same `.vue` SFC | May affect children |
| Tailwind CSS | `class` in template | Use utility classes |
| CSS files | `assets/` or `public/` | Global scope |

**Tips:**
- Prefer `<style scoped>` to avoid side effects
- Nuxt: check `nuxt.config` for global CSS imports
- Use Vue DevTools to identify component boundaries

## Svelte / SvelteKit

| Styling Method | Fix Location | Notes |
| -------------- | ------------ | ----- |
| `<style>` block | Same `.svelte` file | Auto-scoped |
| Global styles | `app.css` or `:global()` | Affects entire app |
| Tailwind CSS | `class` in markup | Use utility classes |

## Angular

| Styling Method | Fix Location | Notes |
| -------------- | ------------ | ----- |
| Component CSS | `*.component.css` | Scoped via ViewEncapsulation |
| Global styles | `styles.css` | App-wide |
| Tailwind CSS | `class` in template | Use utility classes |

**Tips:**
- Angular's `ViewEncapsulation.Emulated` (default) scopes styles
- Use `::ng-deep` sparingly for child component overrides
- Check `angular.json` for additional style entries

## Static / Plain HTML

| Styling Method | Fix Location | Notes |
| -------------- | ------------ | ----- |
| External CSS | Linked `.css` files | Check `<link>` tags in `<head>` |
| Inline `<style>` | Same HTML file | In `<head>` or component |
| Inline styles | `style=""` attributes | Highest specificity |

## General Fix Principles

1. **Match existing patterns** — if the project uses Tailwind, fix with Tailwind classes
2. **Minimize specificity** — avoid `!important`; use more specific selectors instead
3. **Scope changes** — prefer scoped/module CSS to prevent regressions
4. **Test responsive** — verify fixes at mobile, tablet, and desktop breakpoints
5. **Preserve existing overrides** — check for media queries or dark mode variants before editing
