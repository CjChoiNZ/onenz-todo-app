# 02 — UI Elements Package

> Reusable UI component package (`packages/ui_elements`)

## Package Structure

```
ui_elements/
├── pubspec.yaml
├── lib/
│   ├── ui_elements.dart          # barrel export
│   └── src/
│       ├── theme/app_theme.dart  # app theme
│       └── widgets/
│           ├── app_button.dart
│           ├── app_text_field.dart
│           ├── app_card.dart
│           └── app_page_header.dart
```

## Dependencies

- `flutter` SDK only. No third-party packages.

## Components

### AppTheme
- `lightTheme` — returns Material 3 based ThemeData
- Colors: primary `#007AFF` (iOS System Blue), surface `#F0F0F0`
- Card borderRadius 14, Button/TextField borderRadius 12

### AppButton
- `label`, `onPressed` required
- `isOutlined` — outlined variant
- `isLoading` — shows loading spinner

### AppTextField
- `hintText` required
- `controller`, `onSubmitted`, `prefixIcon`, `maxLines` optional

### AppCard
- `child` required
- `onTap` — tap gesture
- Card + InkWell + Padding structure

### AppPageHeader
- `title` required — large centred page title
- `showBackButton` — shows a back arrow row
- `onBackPressed` — back arrow tap callback
- Implements `PreferredSizeWidget` so it can be used as a Scaffold `appBar`

## Done Criteria

- `dart analyze packages/ui_elements` — no errors
- Importable from `todo_app` via `package:ui_elements/ui_elements.dart`
