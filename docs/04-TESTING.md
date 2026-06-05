# 04 — Testing

> Unit tests + web automation (integration) tests

## 1. Unit Tests

Location: `packages/todo_app/test/`

### Test Targets

- **TodoListNotifier** — core state logic
  - `add()` → item added to list
  - `toggle()` → `isCompleted` toggled
  - `remove()` → item removed from list
  - `edit()` → title/description updated

- **Todo model**
  - `copyWith()` works correctly
  - Same id → equality (`==`) passes

### Run

```bash
melos run test
# or
cd packages/todo_app && flutter test
```

## 2. Web Automation Tests (Integration)

Location: `packages/todo_app/integration_test/`

### Test Scenarios

1. App starts → empty state displayed
2. Tap FAB → navigates to AddTodoScreen
3. Enter title + save → item appears on HomeScreen
4. Tap checkbox → completion state toggles
5. Tap delete → item removed

### Run

```bash
cd packages/todo_app
flutter test integration_test --platform chrome
```

## Done Criteria

- All unit tests pass
- Web integration tests pass on Chrome
