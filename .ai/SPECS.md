# Specs

Optional spec-driven flow: a specification drives `plan` and `tasks` before implementation. This complements `.ai/REQUIREMENTS.md` (the PRD index) and `.ai/workflows/feature.md`; it does not replace them.

Use specs when a change is large or risky enough that the plan matters as much as the code. For small changes, a PRD and `.ai/workflows/implement.md` are enough.

## When to use

- Multi-step features that touch several modules.
- Work with real design trade-offs worth reviewing before code.
- Anything that benefits from tasks being explicit and checkable.

Skip it for small, well-understood changes.

## Flow

```text
PRD (docs/prd/)          → what and why (product scope)
   ↓
Spec (docs/spec/)        → requirements, design, edge cases
   ↓
Plan (docs/spec/)        → approach, affected files, risks
   ↓
Tasks (docs/spec/)       → ordered, checkable steps
   ↓
Implementation           → .ai/workflows/implement.md
```

The spec is the artifact; the PRD is the source of scope. `docs/prd/` and `docs/spec/` can be one file or separate, depending on size.

## Lifecycle

`Draft → Approved → In Progress → Implemented → Superseded`

Only an Approved spec drives implementation. Update it as reality changes; never leave a spec describing something that no longer matches the code.

## Spec format

```text
# SPEC-NNN — Title
Status: Draft | Approved | In Progress | Implemented | Superseded
PRD: PRD-NNN
Related decisions: ADR-NNN, TDR-NNN

## Requirements
- [ ] <requirement>

## Design
<approach, key decisions, alternatives considered>

## Edge cases
- <case and expected behavior>

## Plan
1. <step>
2. <step>

## Tasks
- [ ] <ordered, checkable task>

## Validation
<how each requirement is verified; link to .ai/VALIDATION.md>

## Open questions
- <question>
```

## Index

| ID | Title | Status | PRD | File |
| --- | --- | --- | --- | --- |
| - | - | - | - | - |

_None yet._
