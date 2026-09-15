# Learnings

Append-only buffer of reusable, non-obvious learnings captured while working, so future sessions and tools do not rediscover them. This is not task state (`TASKS.md`), not a session handoff (`HANDOFF.md`), and not a durable decision record (`DECISIONS.md`).

## How to use

- Append one entry per learning. Do not rewrite or delete entries; to correct one, mark it `superseded` and add a new entry.
- Capture only learnings that are non-obvious and likely to recur. Skip anything already stated in `CONVENTIONS.md`, `DECISIONS.md`, `TOOLS.md`, or `VALIDATION.md`.
- Keep each entry short and evidence-based. Prefer `observed` facts over speculation.
- This file is a buffer, not a permanent home: promote durable learnings and keep the entry as a breadcrumb.

## Entry format

```text
### L-001 — <short title>
Date: YYYY-MM-DD
Status: active | superseded | promoted
Confidence: observed | inferred
Scope: repo | <path-or-glob> | <technology>
Context: <what was being done>
Evidence: <file:line, command output, or concrete observation>
Pattern / rule: <the reusable takeaway>
Promotion: none | CONVENTIONS.md | DECISIONS.md#ADR-nnn | TOOLS.md | VALIDATION.md
```

## Promotion rules

- Recurring pattern → `CONVENTIONS.md`
- Durable architectural choice → `DECISIONS.md` (ADR), cross-referenced here
- Safe or restricted command rule → `TOOLS.md`
- Completion or validation check → `VALIDATION.md`

After promotion, set the entry to `Status: promoted` and keep it as a breadcrumb; do not duplicate the rule body.

## Compaction

- Keep at most 40 active entries. When exceeded, consolidate related entries, promote what is durable, and mark the rest `superseded`.
- Compaction means summarizing and promoting, not erasing history. Record the compaction in `HANDOFF.md`.

## Entries

### L-001 — Workflows and prompts duplicate their content
Date: 2026-09-14
Status: active
Confidence: observed
Scope: .ai/workflows/**, .ai/prompts/**
Context: Auditing the template for maintainability.
Evidence: `.ai/prompts/review.md`, `.ai/prompts/security-review.md`, and `.ai/prompts/cloud-port.md` restate the same steps as the matching workflows.
Pattern / rule: Keep prompts as thin pointers to the workflow file; do not restate the procedure, or the two copies will diverge.
Promotion: none

### L-002 — Switching agents only survives if state is committed
Date: 2026-09-14
Status: active
Confidence: observed
Scope: repo | .ai/HANDOFF.md
Context: Designing handoff between agents and providers after a usage limit.
Evidence: An agent on the same checkout sees the working tree, but a different machine, cloud agent, or fresh clone sees only committed and pushed files.
Pattern / rule: Before switching agents, commit and push work in progress or list uncommitted files explicitly in `.ai/HANDOFF.md`; never rely on chat history.
Promotion: none

### L-003 — Remaining quota is usually not observable
Date: 2026-09-14
Status: active
Confidence: observed
Scope: repo | .ai/LIMITS.md
Context: Designing an automatic warning near provider usage limits.
Evidence: Providers meter usage differently and do not expose a uniform quota API; OpenCode Go documents usage only in the web console.
Pattern / rule: Combine reported usage when available with a work-volume proxy, and keep a continuously current Resume block; never state a remaining quota that was not observed.
Promotion: none
