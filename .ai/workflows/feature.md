# Feature (PRD) Workflow

Use when an approved PRD drives the work.

1. Read `AGENTS.md`, the PRD under `docs/prd/`, and `.ai/REQUIREMENTS.md`.
2. Confirm the PRD `Status` is `Approved`. If it is not, stop and ask the user.
3. Read the related ADR/TDR records in `.ai/DECISIONS.md` (and `docs/decisions/` in scale mode); they constrain the implementation. Change an existing decision only through the decision format.
4. Plan the smallest change that satisfies the requirements; identify affected files and the validation needed.
5. Implement using `.ai/workflows/implement.md` and any matching technology workflow.
6. Validate against the PRD acceptance criteria and `.ai/VALIDATION.md`; report each criterion as met or not.
7. Update the PRD checkboxes and set `Status: Implemented` when complete; update `.ai/TASKS.md` and `.ai/HANDOFF.md`.
8. Capture reusable learnings and record any new decision as an ADR/TDR.
