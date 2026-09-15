# Switch Agent Workflow

Use when moving work to another agent, model, tool, or machine, including when a provider's usage limit is reached.

1. Bring context current: update `.ai/TASKS.md`, `.ai/HANDOFF.md`, and `.ai/LEARNINGS.md`.
2. Fill the Resume block at the top of `.ai/HANDOFF.md`: repo state, goal, exact next action, blockers, and the resume prompt.
3. Persist state so the next agent can see it. An agent on the same checkout sees the working tree, but a different machine, cloud agent, or fresh clone only sees committed and pushed files. Commit and push work in progress, or list every uncommitted file explicitly in `HANDOFF.md`.
4. Never depend on chat history, tool-specific memory, or one provider. Anything the next agent needs must be in the repository.
5. Hand off state, not narration: record decisions, current state, and next actions, not a transcript.
6. In the next agent, use: `Read AGENTS.md and .ai/HANDOFF.md. Continue from the Resume block. Do not rediscover context.`
7. Confirm the new agent reads `AGENTS.md` before acting. If the tool does not read it automatically, add its thin adapter from `.ai/ADAPTERS.md`.
8. Continue from the exact next action and keep `.ai/` authoritative.

Keep `AGENTS.md` small and read `.ai/` on demand so agents with lower context windows or tighter usage limits can still resume safely.
