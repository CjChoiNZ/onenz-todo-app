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
- Tap a card → navigates to `/add` in edit mode (fields prefilled)
- Remove button (per card) deletes the todo
- Completed todos render with a strikethrough title
- Bottom "Add To-Do" button navigates to `/add`
- Empty state display when there are no todos

### AddTodoScreen
- Title input (AppTextField, required) — real-time validation, max 50 chars
- Description input (AppTextField, optional, multiline)
- Save button (AppButton) — disabled until the title is valid; saves and navigates back to home
- Shared by Add and Edit flows via the `editTodo` parameter (passed as go_router `extra`)
- Floating SnackBar feedback on add / update

## main.dart

- `ProviderScope` → `MaterialApp.router` → `AppTheme.lightTheme`

## Done Criteria

- Platform runners generated via `flutter create --platforms=android,web`
- App runs with add/check/delete functionality working
- Navigation between two screens works correctly
