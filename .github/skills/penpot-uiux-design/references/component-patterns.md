# Component Patterns

Specifications and patterns for common UI components in Penpot designs.

## Buttons

| Property | Primary | Secondary | Ghost |
| -------- | ------- | --------- | ----- |
| Height | 44px (mobile) / 40px (desktop) | 44px / 40px | 44px / 40px |
| Padding | 16px horizontal | 16px horizontal | 16px horizontal |
| Border Radius | 8px | 8px | 8px |
| Font Size | 16px | 16px | 16px |
| Font Weight | 600 (Semibold) | 600 | 500 |
| Min Width | 120px | 120px | auto |

### Button States

- **Default**: Standard appearance
- **Hover**: Slight background shift (darken 10%)
- **Active/Pressed**: Darken 15%, scale 0.98
- **Disabled**: 50% opacity, no pointer events
- **Loading**: Spinner icon replaces label

## Form Inputs

| Property | Value |
| -------- | ----- |
| Height | 44px (mobile) / 40px (desktop) |
| Padding | 12px horizontal |
| Border | 1px solid neutral-300 |
| Border Radius | 8px |
| Font Size | 16px |
| Label | Above input, 14px, font-weight 500 |
| Error Text | Below input, 12px, error color |

### Input States

- **Default**: Neutral border
- **Focus**: Primary color border (2px), subtle shadow
- **Error**: Error color border, error message visible
- **Disabled**: Muted background, 50% opacity

## Cards

| Property | Value |
| -------- | ----- |
| Padding | 16–24px |
| Border Radius | 12px |
| Shadow | 0 1px 3px rgba(0,0,0,0.1) |
| Background | White / surface color |
| Gap (stacked) | 16px |

## Navigation

### Top Navigation Bar

| Property | Value |
| -------- | ----- |
| Height | 56–64px |
| Padding | 16px horizontal |
| Background | White or primary |
| Shadow | 0 1px 2px rgba(0,0,0,0.05) |

### Bottom Navigation (Mobile)

| Property | Value |
| -------- | ----- |
| Height | 84px (includes safe area) |
| Items | 3–5 tabs |
| Icon Size | 24px |
| Label Size | 12px |
| Touch Target | 48×48px minimum |

### Sidebar Navigation (Desktop)

| Property | Value |
| -------- | ----- |
| Width | 240–280px |
| Item Height | 40px |
| Padding | 12px horizontal |
| Active Indicator | Background highlight or left border |

## Modals / Dialogs

| Property | Value |
| -------- | ----- |
| Width | 90% (mobile) / 480px (desktop) |
| Max Width | 560px |
| Padding | 24px |
| Border Radius | 16px |
| Overlay | rgba(0,0,0,0.5) |
| Close Button | Top-right, 24px icon |
