# 02 — Design System (`ui_elements` Package)

> **Purpose**: This spec defines the shared design system package. An agent following this spec should produce a fully self-contained Flutter package that exports a cohesive theme and reusable widget library. The `todo_app` (and any future apps) depend on this package for visual consistency.

---

## Prerequisites

- Spec `01-PROJECT-SETUP.md` completed
- `packages/ui_elements/` directory exists

---

## Scope

| Artifact                                        | Action | Description                            |
|-------------------------------------------------|--------|----------------------------------------|
| `packages/ui_elements/pubspec.yaml`             | CREATE | Package manifest                       |
| `packages/ui_elements/analysis_options.yaml`    | CREATE | Lint rules                             |
| `packages/ui_elements/lib/ui_elements.dart`     | CREATE | Barrel export file                     |
| `packages/ui_elements/lib/src/theme/`           | CREATE | Theme definitions and design tokens    |
| `packages/ui_elements/lib/src/widgets/`         | CREATE | Reusable widget components             |

---

## 1. Package Manifest

```yaml
name: ui_elements
description: Shared UI Design System for the OneNZ To-Do App.
version: 0.1.0

environment:
  sdk: ">=3.6.0 <4.0.0"
  flutter: ">=3.29.0"

dependencies:
  flutter:
    sdk: flutter

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^5.0.0
```

### Rules
- **Zero** third-party runtime dependencies beyond `flutter` SDK.
- This package must be usable by any Flutter app — it must NOT depend on Riverpod, go_router, or any business-logic library.

---

## 2. Barrel Export (`lib/ui_elements.dart`)

```dart
library ui_elements;

// Theme
export 'src/theme/app_theme.dart';

// Widgets
export 'src/widgets/app_button.dart';
export 'src/widgets/app_text_field.dart';
export 'src/widgets/app_card.dart';
```

### Rules
- Every public class/widget **must** be re-exported here.
- Consumers import `package:ui_elements/ui_elements.dart` — never reach into `src/`.

---

## 3. Design Tokens & Theme (`lib/src/theme/app_theme.dart`)

### Colour Palette

| Token            | Hex       | Usage                          |
|------------------|-----------|--------------------------------|
| `primaryColor`   | `#6C63FF` | Primary brand, AppBar, FAB     |
| `secondaryColor` | `#03DAC6` | Accent, secondary actions      |
| `surfaceColor`   | `#F5F5F5` | Scaffold background            |
| `errorColor`     | `#CF6679` | Error states, destructive acts |
| `onPrimaryColor` | `#FFFFFF` | Text/icons on primary colour   |
| `textColor`      | `#1D1D1D` | Primary text                   |
| `subtextColor`   | `#757575` | Secondary/hint text            |

### Theme Construction

The `AppTheme` class must:
- Be a non-instantiable utility class (private constructor).
- Expose a static `lightTheme` getter returning `ThemeData`.
- Use `Material3` (`useMaterial3: true`).
- Use `ColorScheme.fromSeed(seedColor: primaryColor)`.
- Configure themed defaults for: `AppBar`, `FloatingActionButton`, `InputDecoration`, `Card`, `Text`.

### Typography

| TextTheme Slot    | Size | Weight | Colour      |
|-------------------|------|--------|-------------|
| `headlineMedium`  | 24   | w700   | textColor   |
| `bodyLarge`       | 16   | normal | textColor   |
| `bodyMedium`      | 14   | normal | subtextColor|

### Shape Language
- Cards: `borderRadius: 14`
- Buttons: `borderRadius: 12`
- TextFields: `borderRadius: 12`
- Card elevation: `2`
- Card margin: `horizontal: 16, vertical: 6`

---

## 4. Widget Components

### 4.1 `AppButton` (`lib/src/widgets/app_button.dart`)

A reusable action button with two variants.

| Property     | Type           | Default  | Description                        |
|--------------|----------------|----------|------------------------------------|
| `label`      | `String`       | required | Button text                        |
| `onPressed`  | `VoidCallback?`| required | Tap handler (null = disabled)      |
| `isOutlined` | `bool`         | `false`  | `true` → OutlinedButton variant    |
| `isLoading`  | `bool`         | `false`  | `true` → shows CircularProgress   |

**Behaviour**:
- When `isLoading == true`, `onPressed` is ignored and a `CircularProgressIndicator` replaces the label.
- Filled variant uses `primaryColor` background, `onPrimaryColor` text.
- Outlined variant uses `primaryColor` border and text, transparent background.

---

### 4.2 `AppTextField` (`lib/src/widgets/app_text_field.dart`)

A styled text input field.

| Property      | Type                    | Default  | Description                  |
|---------------|-------------------------|----------|------------------------------|
| `hintText`    | `String`                | required | Placeholder text             |
| `controller`  | `TextEditingController?`| `null`   | External text controller     |
| `onChanged`   | `ValueChanged<String>?` | `null`   | Called on each keystroke      |
| `onSubmitted` | `ValueChanged<String>?` | `null`   | Called on keyboard submit     |
| `prefixIcon`  | `IconData?`             | `null`   | Leading icon                 |
| `suffixIcon`  | `Widget?`               | `null`   | Trailing widget              |
| `maxLines`    | `int`                   | `1`      | Multiline support            |
| `autofocus`   | `bool`                  | `false`  | Auto-focus on mount          |

**Behaviour**:
- Delegates all styling to the `InputDecorationTheme` from `AppTheme`.
- Wraps a standard `TextField` — no custom painting.

---

### 4.3 `AppCard` (`lib/src/widgets/app_card.dart`)

A styled card container with tap support.

| Property  | Type                    | Default                       | Description         |
|-----------|-------------------------|-------------------------------|---------------------|
| `child`   | `Widget`                | required                      | Card content        |
| `onTap`   | `VoidCallback?`         | `null`                        | Tap gesture handler |
| `padding` | `EdgeInsetsGeometry?`   | `h:16, v:12`                 | Inner padding       |

**Behaviour**:
- Wraps `Card` → `InkWell` → `Padding` → `child`.
- `InkWell.borderRadius` must match the card's shape (14).
- Uses `CardTheme` from `AppTheme` for elevation and margin.

---

## Verification Checklist

- [ ] `dart analyze packages/ui_elements` reports zero issues
- [ ] `dart format --set-exit-if-changed packages/ui_elements` reports no changes needed
- [ ] Every public API in `src/` is exported via `ui_elements.dart`
- [ ] `AppTheme.lightTheme` returns a valid `ThemeData` (can be tested by constructing `MaterialApp(theme: AppTheme.lightTheme)`)
- [ ] All widgets can be instantiated with required parameters only (sensible defaults for optionals)
- [ ] Package has zero third-party runtime dependencies
