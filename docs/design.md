# Design

Why this template is built the way it is. The published `.ai/` ships in a clean, unadopted state; the rationale for the template itself lives here so adopters do not inherit template-development history.

## Principles

- The repository is the only medium every agent can read. Context must be versioned with the code.
- `AGENTS.md` is the single entry point and is self-driving: reading it is enough to know how to proceed.
- Tool-specific files are thin adapters only; they route to `AGENTS.md` and contain no project facts.
- Keep `AGENTS.md` small and read `.ai/` on demand, so agents with lower context windows or tighter usage limits can resume safely.
- Prefer evidence-based context: mark facts observed, inferences inferred, and unknowns unknown. Do not invent history.
- Context is curated, not retrieved: selection is explicit and auditable; no embeddings, no external index.
- The layer records the outcome of reasoning (decisions, plans, learnings), not the reasoning process.

## Decision — Bounded learnings buffer with promotion

Records state (`TASKS.md`, `HANDOFF.md`) and durable choices (`DECISIONS.md`) were not enough; agents also need to retain reusable, non-obvious learnings across sessions and tools.

`LEARNINGS.md` is a bounded, append-only buffer with a fixed entry format, promotion rules, and compaction at 40 active entries. Durable learnings are promoted to `CONVENTIONS.md`, `DECISIONS.md`, `TOOLS.md`, or `VALIDATION.md` and the entry is marked `promoted`. This keeps the normative files clean while giving agents a portable place to capture what they learned.

## Decision — Agent-independent context with thin adapters

Work must continue across different agents, models, providers, and machines, including when a usage limit is reached. Tool-specific files and chat history are not portable.

`AGENTS.md` and `.ai/` are the only source of truth. Tool-specific files are thin adapters catalogued in `.ai/ADAPTERS.md` and shipped ready to install in `.ai/adapters/`. Handoff state is carried by the Resume block in `.ai/HANDOFF.md` and the protocol in `.ai/workflows/switch-agent.md`, and must be committed and pushed or explicitly listed as uncommitted.

## Decision — Rolling checkpoints with usage-limit thresholds

Provider usage can be exhausted mid-task, and the exact remaining quota is often not observable.

The Resume block is kept current after every meaningful step. `.ai/LIMITS.md` defines thresholds: warn at 70%, stop starting new work and finalize at 85%. Reported usage is used when the tool exposes it, plus a self-imposed work-volume proxy otherwise. This turns an abrupt limit into a planned handoff.

## Decision — Decision records (ADR/TDR) and requirements (PRD)

Two kinds of knowledge are distinct and must not be mixed:

- Decision records answer *how* and *why technically*: **ADR** for architecture, **TDR** for technology choices. They share one mechanism and ID space per type.
- Requirements answer *what* and *why for the product*: **PRD** documents, indexed by `REQUIREMENTS.md`.

Decision records are scale-ready. **Simple mode** keeps entries inline in `DECISIONS.md`, best for small projects up to roughly 15–20 active records. **Scale mode** stores one file per record under `docs/decisions/` with `DECISIONS.md` as the index. Adoption chooses the mode and migration keeps IDs stable. This makes the template ready for scale without forcing the overhead on small projects.

PRDs live under `docs/prd/` with an explicit lifecycle (`Draft → Approved → Implemented → Superseded`). Only an Approved PRD drives implementation, through `.ai/workflows/feature.md`, which honors the related ADR/TDR records and validates against the PRD acceptance criteria.

The spec-driven flow is **optional and complementary**. `.ai/SPECS.md` defines a spec → plan → tasks path under `docs/spec/`, used only when a change is large or risky enough that the plan should be reviewed before code. This is deliberately not a mandatory phase: forcing specs on small changes adds ceremony, and the project positions itself as a context layer that works alongside spec-driven tools (Spec Kit, Kiro specs) rather than replacing them.

## Decision — Learning feedback loop

Recording state and decisions was not enough; agents also rediscover the same lessons across sessions and tools. `.ai/LEARNINGS.md` closes the loop: what is learned is captured, and what proves durable is **promoted** into `CONVENTIONS.md`, `DECISIONS.md`, `TOOLS.md`, or `VALIDATION.md`. The buffer is bounded (40 active entries) and compacted, so it does not grow into noise.

The distinction from memory features in harnesses: most store history or retrieve facts, but do not turn a lesson into a project rule. The relay's feedback loop is the promotion step, and it lives in the repository so it is portable and versioned.

## Decision — Curated context, not retrieval (no RAG)

Context is selected by **explicit rule**, not by semantic similarity. `AGENTS.md` maps the task to the files to read (`PROJECT`, `ARCHITECTURE`, `CONVENTIONS`, then only what the task needs), and workflows name their inputs. There is no vector index, no embedding service, and no top-k retrieval.

Reasoning:

- Project state and decisions are exactly the kind of knowledge similarity search handles poorly: a stale but lexically close passage can outrank the current truth.
- Curated context is auditable. What the agent will read can be reviewed in a pull request.
- It stays small and portable. There is no external index to build, host, feed, or keep in sync.
- It travels with the repository, so any harness gets the same context.

RAG is not forbidden; it composes. Large codebases or document sets may still benefit from retrieval, and a harness can run both. The relay covers the curated layer: current state, decisions, and rules. The two often reduce each other's need rather than compete.

## Decision — No model-level reasoning injected (no CoT)

Chain-of-thought is the model's concern, not the context layer's. The relay does not instruct "think step by step" and does not keep a scratchpad; it records the **result** of reasoning — decisions, plans, and promoted learnings — not the reasoning itself.

What looks adjacent is the workflows (`.ai/workflows/*.md`), but those are deterministic procedures with ordered, checkable steps, not internal reasoning. Injecting CoT into context files tends to conflict with models that already reason internally, and dates poorly. Recording the outcome (ADR, spec, learning) is the durable part.

## Learnings captured during design

- Workflows and prompts can duplicate their content; keep prompts as thin pointers to the workflow so the copies do not diverge.
- Switching agents only survives if state is committed: another machine, cloud agent, or fresh clone sees only committed and pushed files.
- Remaining quota is usually not observable across providers; combine reported usage with a work-volume proxy and never claim an unobserved quota.
