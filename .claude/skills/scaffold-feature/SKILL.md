---
name: scaffold-feature
description: Use when adding a new feature module to the todo_app package (e.g. "add a categories feature", "scaffold a settings screen"). Encodes this repo's feature-first + Riverpod + go_router + ui_elements conventions so generated code matches the existing structure and tests.
---

# Scaffold a new feature in `todo_app`

This project uses a **feature-first** layout. Every feature lives under
`packages/todo_app/lib/features/<feature>/` and is split into three layers.
Follow this structure exactly so new code reads like the existing `todo` feature.

## Layout to create

```
packages/todo_app/lib/features/<feature>/
├── domain/        # Immutable models. No Flutter imports.
├── application/   # Riverpod providers / StateNotifiers. No widgets.
└── presentation/
    ├── router/    # GoRoute definitions (only if the feature adds routes)
    └── screens/   # ConsumerWidget / ConsumerStatefulWidget screens
```

## Conventions (match the `todo` feature)

- **Domain**: plain Dart classes, `final` fields, a `copyWith`, and value
  equality by `id`. Generate ids with `uuid` (`const Uuid().v4()`), defaulting
  in the constructor. See `features/todo/domain/todo_model.dart`.
- **Application**: expose a `StateNotifierProvider`. Mutate state immutably
  (`state = [...state, x]`), never in place. See
  `features/todo/application/todo_provider.dart`.
- **Presentation**: screens are `ConsumerWidget`/`ConsumerStatefulWidget`.
  Read state with `ref.watch(...)`, fire actions with
  `ref.read(provider.notifier)`. Navigate with `go_router`
  (`context.pushNamed(...)`, pass data via `extra`).
- **UI**: build screens from `package:ui_elements/ui_elements.dart`
  (`AppButton`, `AppTextField`, `AppCard`, `AppPageHeader`) and colours from
  `AppTheme`. Do **not** hardcode colours that already exist as theme tokens.
- **Routing**: register new routes in
  `features/<feature>/presentation/router/` and wire them into the existing
  `appRouterProvider` (see `features/todo/presentation/router/app_router.dart`).

## Always add tests

For every feature, add to `packages/todo_app/test/`:

1. A **model test** — construction, `copyWith`, equality/hashCode by id.
2. A **provider test** — each notifier mutation (mirror
   `test/todo_provider_test.dart`).
3. A **widget test** for any screen with validation or conditional UI.

If the feature changes the end-to-end flow, extend
`integration_test/app_test.dart`.

## After scaffolding — verify

Run from the repo root (or `packages/todo_app`):

```bash
dart format packages/todo_app/lib packages/todo_app/test
flutter analyze
flutter test
```

All three must be clean before committing. Commit with Conventional Commits
(`feat(todo_app): ...`) per `CLAUDE.md`.
