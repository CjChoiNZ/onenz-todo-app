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

### Integration Tests (Web)

```bash
cd packages/todo_app
flutter test integration_test --platform chrome
```

Covers the full user flow: empty state → add todo → toggle completion → delete.

## Screens

| Home Screen | Add To-Do Screen |
|-------------|------------------|
| Displays todo list with check/delete | Form with title + description fields |
| FAB navigates to add screen | Save button returns to home |

## License

MIT
