# Checkpoint Workflow

Run periodically and before any long, risky, or limit-approaching operation.

1. Read `AGENTS.md` and the current `.ai/HANDOFF.md`.
2. Commit work in progress, or list every uncommitted file in the Resume block.
3. Update the Resume block: goal, exact next action, blockers, and observed usage when available.
4. Update `.ai/TASKS.md` if the work state changed.
5. Estimate remaining budget against `.ai/LIMITS.md`. At 70% or more, announce that the limit is approaching; at 85% or more, stop starting new work, finalize the handoff, and push.
6. Keep the summary short and evidence-based; do not claim a remaining quota that was not observed.
