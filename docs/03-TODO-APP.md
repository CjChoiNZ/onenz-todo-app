# 03 — Todo App Package

> Main app package (`packages/todo_app`): model, state management, routing, screens

## Package Structure

```
todo_app/
├── pubspec.yaml
├── lib/
│   ├── main.dart
│   └── features/todo/
│       ├── domain/
│       │   └── todo_model.dart
│       ├── application/
│       │   └── todo_provider.dart
│       └── presentation/
│           ├── router/app_router.dart
│           └── screens/
│               ├── home_screen.dart
│               └── add_todo_screen.dart
├── android/
├── web/
└── test/
```

## Dependencies

- `ui_elements` (path: ../ui_elements)
- `flutter_riverpod` — state management
- `go_router` — routing
- `uuid` — todo ID generation

## Model (Todo)

- `id` (String, auto UUID), `title`, `description`, `isCompleted`, `createdAt`
- `copyWith()` method
- Value equality based on `id`

## State Management (Riverpod)

- `todoListProvider` — `StateNotifierProvider<TodoListNotifier, List<Todo>>`
- CRUD: `add()`, `toggle()`, `remove()`, `edit()`

## Routing (go_router)

| Path  | Screen         |
|-------|----------------|
| `/`   | HomeScreen     |
| `/add`| AddTodoScreen  |

- Managed via `appRouterProvider` (Riverpod Provider)

## Screens

### HomeScreen
- Displays todo list using AppCard
- Checkbox to toggle completion
- Delete button
- FAB navigates to `/add`
- Empty state display

### AddTodoScreen
- Title input (AppTextField, required)
- Description input (AppTextField, optional)
- Save button (AppButton) — saves and navigates back to home

## main.dart

- `ProviderScope` → `MaterialApp.router` → `AppTheme.lightTheme`

## Done Criteria

- Platform runners generated via `flutter create --platforms=android,web`
- App runs with add/check/delete functionality working
- Navigation between two screens works correctly
