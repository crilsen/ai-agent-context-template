# Implementation Workflow

1. Read `AGENTS.md`; understand the requested outcome.
2. Annotations default to English. Always confirm before writing or updating code comments or relay `.md` files whether to keep English or change to another language, and to which one. Record the choice in `.ai/HANDOFF.md` (`Annotation language: ...`) unless a standing preference is already recorded and the user confirms it still applies.
3. Read the relevant `.ai/` context and identify files, dependencies, and impact.
4. Implement the smallest necessary change, following existing conventions.
5. Do not change unrelated code, run destructive commands, or deploy without explicit authorization.
6. Stop and report if an undocumented architectural decision is required.
7. Run applicable checks from `.ai/VALIDATION.md`, fix failures within scope, and report limitations.
8. Update `.ai/TASKS.md` when work state changes and `.ai/HANDOFF.md` after relevant work.
9. Summarize files changed, validation, unresolved issues, and next actions.
