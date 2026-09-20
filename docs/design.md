# Design

Why this template is built the way it is. The published `.ai/` ships in a clean, unadopted state; the rationale for the template itself lives here so adopters do not inherit template-development history.

## Principles

- The repository is the only medium every agent can read. Context must be versioned with the code.
- `AGENTS.md` is the single entry point and is self-driving: reading it is enough to know how to proceed.
- Tool-specific files are thin adapters only; they route to `AGENTS.md` and contain no project facts.
- Keep `AGENTS.md` small and read `.ai/` on demand, so agents with lower context windows or tighter usage limits can resume safely.
- Prefer evidence-based context: mark facts observed, inferences inferred, and unknowns unknown. Do not invent history.

## Decision — Bounded learnings buffer with promotion

Records state (`TASKS.md`, `HANDOFF.md`) and durable choices (`DECISIONS.md`) were not enough; agents also need to retain reusable, non-obvious learnings across sessions and tools.

`LEARNINGS.md` is a bounded, append-only buffer with a fixed entry format, promotion rules, and compaction at 40 active entries. Durable learnings are promoted to `CONVENTIONS.md`, `DECISIONS.md`, `TOOLS.md`, or `VALIDATION.md` and the entry is marked `promoted`. This keeps the normative files clean while giving agents a portable place to capture what they learned.

## Decision — Agent-independent context with thin adapters

Work must continue across different agents, models, providers, and machines, including when a usage limit is reached. Tool-specific files and chat history are not portable.

`AGENTS.md` and `.ai/` are the only source of truth. Tool-specific files are thin adapters catalogued in `.ai/ADAPTERS.md` and shipped ready to install in `.ai/adapters/`. Handoff state is carried by the Resume block in `.ai/HANDOFF.md` and the protocol in `.ai/workflows/switch-agent.md`, and must be committed and pushed or explicitly listed as uncommitted.

## Decision — Rolling checkpoints with usage-limit thresholds

Provider usage can be exhausted mid-task, and the exact remaining quota is often not observable.

The Resume block is kept current after every meaningful step. `.ai/LIMITS.md` defines thresholds: warn at 70%, stop starting new work and finalize at 85%. Reported usage is used when the tool exposes it, plus a self-imposed work-volume proxy otherwise. This turns an abrupt limit into a planned handoff.

## Learnings captured during design

- Workflows and prompts can duplicate their content; keep prompts as thin pointers to the workflow so the copies do not diverge.
- Switching agents only survives if state is committed: another machine, cloud agent, or fresh clone sees only committed and pushed files.
- Remaining quota is usually not observable across providers; combine reported usage with a work-volume proxy and never claim an unobserved quota.
