# 04 — Testing

> 유닛 테스트 + 웹 자동화(통합) 테스트

## 1. 유닛 테스트

위치: `packages/todo_app/test/`

### 테스트 대상

- **TodoListNotifier** — 핵심 상태 로직
  - `add()` → 리스트에 항목 추가됨
  - `toggle()` → `isCompleted` 토글
  - `remove()` → 리스트에서 삭제
  - `edit()` → title/description 변경

- **Todo 모델**
  - `copyWith()` 정상 동작
  - 동일 id → 동등성 (`==`) 통과

### 실행

```bash
melos run test
# 또는
cd packages/todo_app && flutter test
```

## 2. 웹 자동화 테스트 (Integration)

위치: `packages/todo_app/integration_test/`

### 테스트 시나리오

1. 앱 시작 → 빈 상태 표시 확인
2. FAB 탭 → AddTodoScreen 이동 확인
3. 제목 입력 + 저장 → HomeScreen에 항목 표시
4. 체크박스 탭 → 완료 상태 변경
5. 삭제 버튼 → 항목 제거

### 실행

```bash
cd packages/todo_app
flutter test integration_test --platform chrome
```

## 완료 기준

- 유닛 테스트 전부 통과
- 웹 통합 테스트 Chrome에서 통과
