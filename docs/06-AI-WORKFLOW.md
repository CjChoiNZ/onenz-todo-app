# 06 — AI-Assisted Development Workflow

> How this project was designed, implemented, and tested with AI
> (Claude Code), and where each capability lives in the repo.

The brief asks for *"evidence of leveraging AI to design, implement, and test
the application — proper usage of Skills, MCP, Specs, Custom Instructions."*
This document maps each of those to concrete artifacts in this repository.

## 1. Custom Instructions — `CLAUDE.md`

`CLAUDE.md` is the project's standing instruction set. It pins the product
philosophy, the tech stack (Flutter / Melos / Riverpod / go_router), the
feature-first architecture, and the Git rules (Conventional Commits, imperative
mood, English-only). Every AI-assisted change is steered by this file, which
keeps generated code consistent across sessions.

## 2. Specs — `docs/01` … `docs/05`

Before implementation, the work was broken into ordered specification
documents and executed in sequence (`01 → 02 → 03 → 04 → 05`):

| Spec | Drives |
|------|--------|
| `01-PROJECT-SETUP` | Melos monorepo + root config |
| `02-UI-ELEMENTS` | Shared design-system package |
| `03-TODO-APP` | Model, state, routing, screens |
| `04-TESTING` | Unit + web automation tests |
| `05-README` | Deliverable README |

This spec-first approach means the AI implemented against a written
contract rather than ad-hoc prompts, and the specs are kept in sync with the
code (see the commit history for doc/code alignment passes).

## 3. Skills — `.claude/skills/`

`.claude/skills/scaffold-feature/` is a project-scoped Agent Skill that encodes
the repo's conventions (feature-first layers, immutable Riverpod state,
`ui_elements` usage, mandatory tests). It makes future AI-assisted feature work
reproducible and on-pattern instead of relying on the author re-explaining the
architecture each time.

## 4. Implementation & Testing with AI

The Conventional Commit history is itself the audit trail of AI-assisted
delivery — incremental, layer-by-layer:

- `feat(ui_elements)` → design system scaffold
- `feat(todo_app)` → Riverpod state, router, screens
- `test` → model / notifier unit tests, widget tests, E2E integration test
- `refactor` → UI polish, validation, edit flow
- `ci` → headless-Chrome web automation pipeline

Tests were authored alongside features (not after) and run in CI on every push
and pull request — see `.github/workflows/ci.yml` and `04-TESTING.md`.

## 5. MCP (not used)

No MCP server is wired into this project. Persistence is currently in-memory.
If the app were to gain a real backend, the Supabase MCP server is the intended
path (DB-backed todos); this is noted here for transparency rather than claimed.
