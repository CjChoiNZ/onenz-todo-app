# 03 — Todo App Package

> 메인 앱 패키지 (`packages/todo_app`): 모델, 상태관리, 라우팅, 화면

## 패키지 구조

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

## 의존성

- `ui_elements` (path: ../ui_elements)
- `flutter_riverpod` — 상태관리
- `go_router` — 라우팅
- `uuid` — 할 일 ID 생성

## 모델 (Todo)

- `id` (String, auto UUID), `title`, `description`, `isCompleted`, `createdAt`
- `copyWith()` 메서드
- 값 동등성 (`id` 기반)

## 상태관리 (Riverpod)

- `todoListProvider` — `StateNotifierProvider<TodoListNotifier, List<Todo>>`
- CRUD: `add()`, `toggle()`, `remove()`, `edit()`

## 라우팅 (go_router)

| Path  | Screen         |
|-------|----------------|
| `/`   | HomeScreen     |
| `/add`| AddTodoScreen  |

- `appRouterProvider` 로 Riverpod Provider에서 관리

## 화면

### HomeScreen
- 할 일 목록 표시 (AppCard 사용)
- 체크박스로 완료 토글
- 삭제 버튼
- FAB → `/add` 이동
- 빈 상태 표시

### AddTodoScreen
- 제목 입력 (AppTextField, 필수)
- 설명 입력 (AppTextField, 선택)
- 저장 버튼 (AppButton) → 저장 후 홈으로 복귀

## main.dart

- `ProviderScope` → `MaterialApp.router` → `AppTheme.lightTheme`

## 완료 기준

- `flutter create --platforms=android,web` 로 플랫폼 러너 생성
- 앱 실행 시 할 일 추가/체크/삭제 동작
- 두 화면 간 네비게이션 정상 작동
