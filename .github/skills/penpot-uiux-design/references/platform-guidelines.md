# Platform Guidelines

Screen sizes, safe areas, and platform-specific design specs.

## Screen Sizes

| Device | Width | Height | Category |
| ------ | ----- | ------ | -------- |
| iPhone SE | 375px | 667px | Mobile |
| iPhone 14 | 390px | 844px | Mobile |
| iPhone 14 Pro Max | 430px | 932px | Mobile (Large) |
| iPad Mini | 744px | 1133px | Tablet |
| iPad Air / Pro 11" | 820px | 1180px | Tablet |
| iPad Pro 12.9" | 1024px | 1366px | Tablet (Large) |
| Android Small | 360px | 640px | Mobile |
| Android Medium | 412px | 915px | Mobile |
| Desktop HD | 1280px | 720px | Desktop |
| Desktop Full HD | 1920px | 1080px | Desktop |
| Desktop QHD | 2560px | 1440px | Desktop (Large) |

## Safe Areas

### iOS

| Area | Value |
| ---- | ----- |
| Status bar | 44–59px (Dynamic Island: 59px) |
| Home indicator | 34px bottom inset |
| Navigation bar | 44–56px |
| Tab bar | 49px + 34px safe area = 83px |

### Android

| Area | Value |
| ---- | ----- |
| Status bar | 24–48dp |
| Navigation bar (gesture) | 16dp bottom |
| Navigation bar (3-button) | 48dp bottom |

## Responsive Breakpoints

| Name | Min Width | Common Usage |
| ---- | --------- | ------------ |
| Mobile | 0px | Single column, stacked layout |
| Tablet | 768px | Two-column, sidebar begins |
| Desktop | 1024px | Multi-column, full navigation |
| Wide | 1440px | Max-width containers, expanded layouts |

## Platform Typography

### iOS (San Francisco)

| Style | Size | Weight |
| ----- | ---- | ------ |
| Large Title | 34px | Bold |
| Title 1 | 28px | Bold |
| Title 2 | 22px | Bold |
| Title 3 | 20px | Semibold |
| Body | 17px | Regular |
| Caption | 12px | Regular |

### Android (Roboto / Material Design 3)

| Style | Size | Weight |
| ----- | ---- | ------ |
| Display Large | 57px | Regular |
| Headline Large | 32px | Regular |
| Title Large | 22px | Regular |
| Body Large | 16px | Regular |
| Body Medium | 14px | Regular |
| Label Small | 11px | Medium |

## Platform-Specific Patterns

### iOS Conventions

- Navigation: Left-aligned back button, centered title
- Tab bar at bottom (max 5 tabs)
- Swipe-to-go-back gesture support
- SF Symbols for icons

### Android / Material Design Conventions

- Top app bar with navigation drawer or bottom navigation
- FAB (Floating Action Button) for primary actions
- Material You dynamic color theming
- Bottom sheets for contextual actions
