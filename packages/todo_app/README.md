# OneNZ To-Do App (`todo_app`)

The core product package of the OneNZ To-Do application built using Flutter, Riverpod, GoRouter, and a custom `ui_elements` design system.

## Key Features
* **Modern Minimalist UI/UX**: Soft flat layout using iOS System Blue (`#007AFF`) accents on light gray backgrounds (`#F0F0F0`).
* **Title Validation**: Real-time validation preventing titles exceeding 50 characters, with interactive helper messages.
* **Ellipsis Overflow Support**: Truncates long titles and descriptions gracefully with `...` to ensure layout consistency.
* **State Management**: Scalable architecture powered by `flutter_riverpod` (StateNotifier).
* **Robust Navigation**: Full support for Add/Edit flows via `go_router` route extra bindings.
* **Notification Popups**: Interactive feedback via customized floating SnackBars on task creation, update, and deletion.

---

## Getting Started

### 1. Run the Development App
Ensure your target device is connected, then run:
```bash
flutter run
```

### 2. Running Unit Tests
To run unit and widget tests (covering state notifier logic, model logic, and widget input validations):
```bash
flutter test
```

### 3. Running Automated E2E Integration Tests

**In a browser (headless Chrome)** — matches CI. Start `chromedriver --port=4444` first, then:
```bash
flutter drive \
  --driver=test_driver/integration_test.dart \
  --target=integration_test/app_test.dart \
  -d web-server \
  --browser-name=chrome
```

**On a connected device** (quick alternative):
```bash
flutter test integration_test/app_test.dart -d <device-id>
```

---

## Package Architecture

```
lib/
├── features/
│   └── todo/
│       ├── application/   # Riverpod providers & state notifier
│       ├── domain/        # Todo entity model definition
│       └── presentation/  # GoRouter setup & screens (Home, Add/Edit)
└── main.dart              # App bootstrapping & main configuration
```

