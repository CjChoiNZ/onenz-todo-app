# 05 — README Writing Guide

> Content to include in the project root `README.md`

## Required Sections

### 1. Project Introduction
- Brief description of the To-Do app (one or two lines)

### 2. Tech Stack
- Flutter, Melos, Riverpod, go_router

### 3. Architecture
- Monorepo structure (`ui_elements` + `todo_app`)
- Feature-first folder structure
- Brief explanation of design decisions

### 4. How to Run

```bash
# Install dependencies
dart pub get
melos bootstrap

# Run on web
cd packages/todo_app
flutter run -d chrome

# Run on Android
flutter run -d <device_id>
```

### 5. Running Tests

```bash
melos run test
flutter test integration_test --platform chrome
```

### 6. Screenshots (optional)
- Home screen, Add Todo screen

## Done Criteria

- Anyone can run the app just by reading the README
