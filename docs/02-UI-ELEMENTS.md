# 02 — UI Elements Package

> 재사용 가능한 UI 컴포넌트 패키지 (`packages/ui_elements`)

## 패키지 구조

```
ui_elements/
├── pubspec.yaml
├── lib/
│   ├── ui_elements.dart          # barrel export
│   └── src/
│       ├── theme/app_theme.dart  # 앱 테마
│       └── widgets/
│           ├── app_button.dart
│           ├── app_text_field.dart
│           └── app_card.dart
```

## 의존성

- `flutter` SDK만. 다른 외부 패키지 없음.

## 컴포넌트 목록

### AppTheme
- `lightTheme` — Material 3 기반 ThemeData 반환
- 색상: primary `#6C63FF`, surface `#F5F5F5`
- Card borderRadius 14, Button/TextField borderRadius 12

### AppButton
- `label`, `onPressed` 필수
- `isOutlined` — outlined 변형
- `isLoading` — 로딩 스피너 표시

### AppTextField
- `hintText` 필수
- `controller`, `onSubmitted`, `prefixIcon`, `maxLines` 등 선택

### AppCard
- `child` 필수
- `onTap` — 탭 제스처
- Card + InkWell + Padding 구조

## 완료 기준

- `dart analyze packages/ui_elements` 에러 없음
- `todo_app`에서 `import 'package:ui_elements/ui_elements.dart'`로 사용 가능
