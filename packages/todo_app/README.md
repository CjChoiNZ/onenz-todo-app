# OneNZ To-Do App (`todo_app`)

The core product package of the OneNZ To-Do application built using Flutter, Riverpod, GoRouter, and a custom `ui_elements` design system.

## Key Features
* **Modern Minimalist UI/UX**: Clean, card-based flat layout featuring iOS System Blue (`#007AFF`) accents, flat white containers, and premium light gray backgrounds (`#F0F0F0`).
* **Title Length Validation**: Real-time validation restricting task titles to a maximum of 50 characters, complete with interactive red error helpers on exceedance.
* **Smart Action Button States**: Dynamically disables the "Save" button when the title input is empty or invalid to guarantee data integrity.
* **Overflow & Ellipsis Prevention**: Gracefully handles long text entries by using single-line text truncation (`...`) on home items to preserve UI layout consistency on any screen size.
* **Floating Feedback SnackBars**: Displays elegant, floating pop-up notifications on successful task addition, update, or removal for clean user feedback.
* **Single-Tap Task Modification**: Allows quick editing of existing to-do items by tapping any item card, pre-filling text fields automatically in edit mode.
* **Effortless Item Removal**: Includes a clean, dedicated "Remove" action button for instantly deleting tasks from the active list.

## Tech Stack & Architecture
* **Monorepo Workspace (Melos)**: Scalable multi-package workspace architecture separating the main product (`todo_app`) from the shared design system (`ui_elements`).
* **State Management (Riverpod)**: Scalable local state management built on `flutter_riverpod` and `StateNotifier` for predictable data flows.
* **Routing & Navigation (GoRouter)**: Clean, declarative path-based routing with type-safe `extra` object bindings for the Add/Edit flows via `go_router`.
* **Automation Testing (Integration Test)**: Robust browser/device E2E automation testing simulating complete user paths using Flutter's native `integration_test` engine.

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

