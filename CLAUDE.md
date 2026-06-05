# Product Blueprint: Creat a simple To-Do App

## Our Philosophy
We are not just building a throwing-away code or a simple assessment app. We believe even a basic To-Do app deserves a rock-solid foundation, empathetic user experience, and clean craftsmanship. We treat our codebase with respect, ensuring it is modular, predictable, and easy for any engineer to reason about.

---

## The Big Picture (Tech Stack & Intentions)
- **Framework:** Flutter (Engineered with care for both Web and Android Real Devices)
- **Monorepo Strategy:** Melos (To separate concerns beautifully without getting tangled)
- **State Management:** Riverpod (To ensure data flows naturally and predictably, independent of UI)
- **Navigation:** `go_router` (For declarative, clean routing between screens)
- **Architecture:** Feature-first approach. Keep it simple, but treat each layer with a clear purpose.

---

## Architectural Layout (How We Organize Our Thoughts)
We separate our shared design system from our core business domain using a clean Melos monorepo structure:

```text
.
├── melos.yaml
├── pubspec.yaml
└── packages/
    ├── ui_elements/       # Our Shared UI Design System (Buttons, TextFields, Cards)
    └── todo_app/          # Our Core Product (Business logic, State, and Screens)
