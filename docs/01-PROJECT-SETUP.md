# 01 — Project Setup

> Melos 모노레포 초기화 및 루트 설정 파일 생성

## 할 일

1. `git init`
2. 루트 `pubspec.yaml` 생성 (melos dev dependency만)
3. `melos.yaml` 생성 (packages glob + 기본 스크립트)
4. `.gitignore` 생성
5. `packages/ui_elements/` 와 `packages/todo_app/` 디렉토리 생성

## 루트 pubspec.yaml

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

## 완료 기준

- `melos bootstrap` 성공
- `melos list` 에서 2개 패키지 표시
