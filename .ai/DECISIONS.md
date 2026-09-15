# Architectural Decisions

## ADR-001 — Bounded learnings buffer with promotion

Status: Accepted

Context:
The template recorded state (`TASKS.md`, `HANDOFF.md`) and durable choices (`DECISIONS.md`), but had no mechanism for an agent to retain reusable, non-obvious learnings across sessions and tools.

Decision:
Introduce `.ai/LEARNINGS.md` as a bounded, append-only buffer with a fixed entry format, promotion rules, and compaction at 40 active entries. Durable learnings are promoted to `CONVENTIONS.md`, `DECISIONS.md`, `TOOLS.md`, or `VALIDATION.md` and the entry is marked `promoted`.

Reasoning:
Keeps the normative files clean and evidence-based while giving agents an explicit, portable place to capture what they learned, avoiding rediscovery and drift between tools.

Consequences:
- Learnings are portable and versioned with the repository.
- The buffer can grow and must be compacted; promotion directs durable rules to their permanent home.
- Agents must follow `.ai/workflows/capture-learning.md` rather than writing ad-hoc notes.

## ADR-002 — Agent-independent context with thin adapters

Status: Accepted

Context:
Work must continue across different agents, models, providers, and machines, including when one provider's usage limit is reached. Tool-specific files and chat history are not portable.

Decision:
Keep `AGENTS.md` and `.ai/` as the only source of truth. Any tool-specific file is a thin adapter that routes to `AGENTS.md` and contains no project facts; adapter paths are catalogued in `.ai/ADAPTERS.md`. Handoff state is carried by the Resume block in `.ai/HANDOFF.md` and the protocol in `.ai/workflows/switch-agent.md`, and must be committed and pushed or explicitly listed as uncommitted.

Reasoning:
The repository is the only medium every agent can read. Keeping adapters thin prevents drift, and centralizing handoff in version-controlled files makes agents interchangeable.

Consequences:
- Context survives agent, model, provider, and machine changes.
- Agents with lower context windows or tighter limits can resume because `AGENTS.md` stays small and `.ai/` is read on demand.
- Uncommitted work can be lost on a machine switch unless it is committed, pushed, or listed in `HANDOFF.md`.

## ADR-003 — Rolling checkpoints with usage-limit thresholds

Status: Accepted

Context:
Provider usage can be exhausted mid-task. The agent cannot always read the exact remaining quota, and losing work at the limit defeats the portability goals.

Decision:
Adopt a rolling checkpoint: the Resume block in `.ai/HANDOFF.md` is kept current after every meaningful step. Define usage thresholds in `.ai/LIMITS.md` (warn at 70%, stop starting new work and finalize at 85%). Use reported usage when the tool exposes it, plus a self-imposed work-volume proxy otherwise.

Reasoning:
A continuously current handoff makes any interruption resumable, and explicit thresholds turn an abrupt limit into a planned handoff.

Consequences:
- Interruptions and provider switches become routine rather than lossy.
- Agents must commit or list work in progress and must not claim an unobserved quota.
- Tool-specific watchers (statusline, hook, plugin) are optional and stay thin; the policy remains portable.

Use this ADR format for durable, meaningful decisions:

```text
## ADR-NNN - Title

Status: Proposed | Accepted | Superseded | Deprecated

Context:
...

Decision:
...

Reasoning:
...

Consequences:
...
```

Do not backfill invented history. Record decisions that are observed, expressly documented, or approved during future work.
