# Requirements

Product requirements describe what to build and why. PRDs are the source of truth for scope; agents treat them as requirements, not suggestions. Keep this file as a short index and store full PRDs under `docs/prd/`.

## Rules

- One PRD per feature or initiative, stored as `docs/prd/NNN-<slug>.md`.
- Status lifecycle: `Draft → Approved → Implemented → Superseded`.
- Only an **Approved** PRD drives implementation; use `.ai/workflows/feature.md`.
- Acceptance criteria must be concrete and testable, and validation maps back to them.
- Do not duplicate requirements here; link to the PRD.
- Record technical choices that a PRD depends on as ADR/TDR entries in `.ai/DECISIONS.md`.

## PRD format

```text
# PRD-NNN — Title
Status: Draft | Approved | Implemented | Superseded
Owner: <who>
Related decisions: ADR-NNN, TDR-NNN

Problem / Context:
...

Goals:
...

Non-goals:
...

Requirements:
- [ ] <requirement>

Acceptance criteria:
- [ ] <testable criterion>

Risks / Open questions:
...
```

## Index

| ID | Title | Status | Owner | File |
| --- | --- | --- | --- | --- |
| - | - | - | - | - |

## Current requirements

_None yet._
