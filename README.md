# OneNZ To-Do App

A simple To-Do application built with Flutter, demonstrating monorepo setup, state management, and declarative routing.

## Tech Stack

| Layer            | Technology      |
|------------------|-----------------|
| Framework        | Flutter 3.44+   |
| Monorepo         | Melos           |
| State Management | Riverpod        |
| Navigation       | go_router       |

## Architecture

This project uses a **Melos monorepo** with two packages:

```
packages/
├── ui_elements/    # Shared design system (theme, buttons, text fields, cards)
└── todo_app/       # Main application (business logic, state, screens)
```

The `todo_app` follows a **feature-first** structure:

```
features/todo/
├── domain/         # Data models (Todo)
├── application/    # State management (Riverpod providers)
└── presentation/   # Screens and routing
```

### Design Decisions

- **Melos monorepo**: Separates reusable UI components from app logic, making the design system independently testable and shareable.
- **Riverpod StateNotifier**: Provides explicit, testable state mutations outside the widget tree.
- **go_router**: Declarative routing with named routes for clean navigation.
- **Feature-first folders**: Each feature owns its domain, application, and presentation layers.

## Getting Started

### Prerequisites

- Flutter SDK >= 3.29.0
- Dart SDK >= 3.6.0

### Setup

```bash
# Install dependencies
dart pub get
dart pub global activate melos
melos bootstrap
```

### Run

```bash
cd packages/todo_app

# Web
flutter run -d chrome

# Android (connect a device first)
flutter run
```

## Testing

### Unit Tests

```bash
cd packages/todo_app
flutter test
```

Tests cover:
- `Todo` model — creation, `copyWith`, equality
- `TodoListNotifier` — add, toggle, remove, edit

### Integration Tests (Mobile Device)

Runs the full E2E suite on a connected physical device or emulator.

```bash
cd packages/todo_app

# List connected devices to get your device ID:
flutter devices

# Run integration tests on a specific device:
flutter test integration_test/app_test.dart -d {device-id}

# Example:
flutter test integration_test/app_test.dart -d 94UAY0T3MH
```

### Integration Tests (Web / Browser)

Runs the full E2E suite in a real headless Chrome browser — the same command CI uses.

```bash
cd packages/todo_app

# 1. Start chromedriver (must be on PATH) in a separate terminal:
chromedriver --port=4444

# 2. Drive the integration test in Chrome:
flutter drive \
  --driver=test_driver/integration_test.dart \
  --target=integration_test/app_test.dart \
  -d web-server \
  --browser-name=chrome
```

Covers the full user flow: empty state → add todo (with title validation) → edit todo → remove → empty state.

## AI-Assisted Development

This project was designed, implemented, and tested with AI (Claude Code) using:

- **Custom Instructions** — `CLAUDE.md` (philosophy, stack, Git rules)
- **Specs** — ordered `docs/01`…`05`, executed `01 → 05`
- **Skills** — `.claude/skills/scaffold-feature/` encodes the repo conventions for on-pattern feature work

See [`docs/06-AI-WORKFLOW.md`](docs/06-AI-WORKFLOW.md) for the full mapping.

## Continuous Integration

`.github/workflows/ci.yml` runs on every push and pull request:

1. **Analyze & Unit Tests** — `dart format` check, `melos run analyze`, `melos run test`
2. **Web Integration Tests** — drives the E2E suite in headless Chrome via `chromedriver`

## Screens

| Home Screen | Add To-Do Screen |
|-------------|------------------|
| Displays todo list; tap a card to edit, Remove to delete | Form with title + description fields |
| Bottom "Add To-Do" button navigates to add screen | Save button returns to home |

## License

MIT
