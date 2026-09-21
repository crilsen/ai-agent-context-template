# Feature (PRD) Workflow

Use when an approved PRD drives the work.

1. Read `AGENTS.md`, the PRD under `docs/prd/`, and `.ai/REQUIREMENTS.md`.
2. Confirm the PRD `Status` is `Approved`. If it is not, stop and ask the user.
3. Read the related ADR/TDR records in `.ai/DECISIONS.md` (and `docs/decisions/` in scale mode); they constrain the implementation. Change an existing decision only through the decision format.
4. Decide whether the change needs a spec: use the optional spec-driven flow (`.ai/SPECS.md`, `docs/spec/`) when the work is large or risky enough that the plan should be reviewed before code. For small changes, skip to step 6.
5. In the spec-driven flow: write the spec (requirements, design, edge cases), get it `Approved`, then produce the plan and ordered tasks. Implement only after approval.
6. Plan the smallest change that satisfies the requirements; identify affected files and the validation needed.
7. Implement using `.ai/workflows/implement.md` and any matching technology workflow.
8. Validate against the PRD acceptance criteria, the spec validation (if used), and `.ai/VALIDATION.md`; report each criterion as met or not.
9. Update the PRD (and spec) checkboxes and status when complete; update `.ai/TASKS.md` and `.ai/HANDOFF.md`.
10. Capture reusable learnings and record any new decision as an ADR/TDR.
