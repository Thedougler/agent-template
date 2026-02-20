# Accessibility Guidelines

Standards and checks for accessible design in Penpot.

## Color Contrast (WCAG AA)

| Element | Minimum Ratio | Standard |
| ------- | ------------- | -------- |
| Normal text (< 18px) | 4.5:1 | WCAG AA |
| Large text (≥ 18px bold / ≥ 24px) | 3:1 | WCAG AA |
| UI components & icons | 3:1 | WCAG AA |
| Non-text contrast | 3:1 | WCAG AA |
| Enhanced (AAA) text | 7:1 | WCAG AAA |

## Touch Targets

| Platform | Minimum Size | Recommended |
| -------- | ------------ | ----------- |
| iOS | 44×44px | 48×48px |
| Android | 48×48dp | 48×48dp |
| Web (desktop) | 24×24px | 32×32px |
| Spacing between targets | 8px minimum | 12px |

## Typography

- **Minimum body text size**: 16px (mobile), 14px (desktop)
- **Line height**: 1.4–1.6× font size for readability
- **Maximum line length**: 60–80 characters
- **Avoid all-caps** for body text (screen readers may spell it out)

## Focus Indicators

- Visible focus ring on all interactive elements
- Minimum 2px outline, high-contrast color
- Do not rely solely on color change for focus indication

## Color Independence

- Never use color alone to convey information
- Combine color with icons, text labels, or patterns
- Ensure charts/graphs use shapes or patterns in addition to color

## Heading Hierarchy

- Use proper heading levels: H1 → H2 → H3
- Do not skip heading levels
- One H1 per page/screen

## Image & Icon Accessibility

- Provide alt text for meaningful images
- Use `aria-hidden` for decorative images
- Icon-only buttons must have accessible labels

## Quick Validation Checklist

- [ ] Color contrast meets 4.5:1 for normal text
- [ ] Touch targets are at least 44×44px on mobile
- [ ] Focus states are visible on interactive elements
- [ ] No information conveyed by color alone
- [ ] Heading hierarchy is logical (no skipped levels)
- [ ] Text size is 16px+ for body on mobile
- [ ] Images have alt text or are marked decorative
