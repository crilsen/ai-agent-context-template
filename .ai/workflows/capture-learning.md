# Capture Learning Workflow

Triggered after completing a task, or as soon as a non-obvious lesson, pitfall, or working pattern is discovered.

1. Read `AGENTS.md`, the relevant `.ai/` context, and `.ai/LEARNINGS.md`.
2. Decide whether the learning is reusable and non-obvious. Skip anything already documented in `CONVENTIONS.md`, `DECISIONS.md`, `TOOLS.md`, or `VALIDATION.md`.
3. Append exactly one entry to `.ai/LEARNINGS.md` using the documented format, with the next sequential ID.
4. Set `Confidence` to `observed` only when backed by concrete evidence (file:line, command output); otherwise use `inferred`.
5. Apply the promotion rules: when the learning is durable, move the rule to the appropriate file, cross-reference it, and set the entry to `promoted`.
6. If the file exceeds 40 active entries, compact it and record the compaction in `.ai/HANDOFF.md`.
7. Do not use this file for task state, session handoff, or chat-style narration.
