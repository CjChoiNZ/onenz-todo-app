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
2. Tap "Add To-Do" → navigates to AddTodoScreen
3. Title > 50 chars → Save stays disabled + validation message shown
4. Enter a valid title + description → Save → item appears on HomeScreen
5. Tap the item → edit mode (prefilled) → change title → Save → list updates
6. Tap Remove → item deleted → empty state shown again

### Run (headless Chrome — matches CI)

```bash
cd packages/todo_app
chromedriver --port=4444 &
flutter drive \
  --driver=test_driver/integration_test.dart \
  --target=integration_test/app_test.dart \
  -d web-server \
  --browser-name=chrome
```

## CI

`.github/workflows/ci.yml` runs analyze + unit tests and the web integration
suite (headless Chrome via chromedriver) on every push and PR.

## Done Criteria

- All unit tests pass
- Web integration tests pass on Chrome (locally and in CI)
