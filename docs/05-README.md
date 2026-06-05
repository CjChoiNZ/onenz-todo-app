# 05 — README 작성 가이드

> 프로젝트 루트 README.md에 포함할 내용

## 필수 섹션

### 1. 프로젝트 소개
- 간단한 To-Do 앱 설명 (한두 줄)

### 2. 기술 스택
- Flutter, Melos, Riverpod, go_router

### 3. 아키텍처 설명
- 모노레포 구조 (`ui_elements` + `todo_app`)
- Feature-first 폴더 구조
- 왜 이런 구조를 선택했는지 간단한 설명

### 4. 실행 방법

```bash
# 의존성 설치
dart pub get
melos bootstrap

# 웹 실행
cd packages/todo_app
flutter run -d chrome

# 안드로이드 실행
flutter run -d <device_id>
```

### 5. 테스트 실행

```bash
melos run test
flutter test integration_test --platform chrome
```

### 6. 스크린샷 (선택)
- 홈 화면, 할 일 추가 화면

## 완료 기준

- README 읽고 바로 앱 실행 가능
