# 01 — Project Setup

> Melos monorepo initialization and root configuration files.

## Tasks

1. `git init`
2. Create root `pubspec.yaml` (melos dev dependency only)
3. Create `melos.yaml` (packages glob + basic scripts)
4. Create `.gitignore`
5. Create `packages/ui_elements/` and `packages/todo_app/` directories

## Root pubspec.yaml

```yaml
name: onenz_todo_app_workspace
description: OneNZ To-Do App monorepo.

environment:
  sdk: ">=3.6.0 <4.0.0"

dev_dependencies:
  melos: ^6.3.2
```

## melos.yaml

```yaml
name: onenz_todo_app_workspace

packages:
  - packages/**

command:
  bootstrap:
    usePubspecOverrides: true

scripts:
  analyze:
    run: dart analyze .
    exec:
      concurrency: 1
  test:
    run: flutter test
    exec:
      failFast: true
```

## Done Criteria

- `melos bootstrap` succeeds
- `melos list` shows 2 packages
