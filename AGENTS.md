# Agent Context Router

This repository keeps portable agent context in `.ai/`; it is the source of truth, independent of IDE, model, provider, or chat history. Any agent must be able to continue another agent's work, including after switching models, tools, or providers when a usage limit is reached.

Reading this file is enough to know what to do. Do not wait for the user to name other files.

## Step 1 — Load context

Read `.ai/PROJECT.md`, `.ai/ARCHITECTURE.md`, and `.ai/CONVENTIONS.md`. Read any additional `.ai/` file only when the task needs it, to keep the context small.

## Step 2 — Detect the mode

Apply the first row that matches:

| Situation | Do this |
| --- | --- |
| A real project is not yet adopted (placeholders or `Unknown / not determined from repository` remain) | Run `.ai/workflows/adopt.md` first |
| The user asks to continue, resume, or recover; or `.ai/HANDOFF.md` has an in-progress Resume block | Resume from the Resume block; use `.ai/workflows/switch-agent.md` to move between agents |
| Implement or change code or infrastructure | `.ai/workflows/implement.md`, plus any matching technology workflow (`terraform-change`, `kubernetes-change`, `cloud-port`) |
| Review code or architecture | `.ai/workflows/review.md` |
| Security review | `.ai/workflows/security-review.md` |
| Only a question is asked | Answer it; change nothing |
| The intent is unclear | Ask the user for the desired outcome before acting |

## Step 3 — Work

1. Read `.ai/DECISIONS.md` before changing an existing decision, and `.ai/TASKS.md` for work in progress.
2. Change only task-related files. Preserve existing conventions and decisions.
3. Consult `.ai/TOOLS.md` before running commands. Do not run destructive, deploy, apply, destroy, delete, or equivalent external operations without explicit authorization.
4. Do not assume one-to-one cloud-service equivalence; preserve architectural intent when porting between providers.
5. Run applicable checks from `.ai/VALIDATION.md` before considering work complete, and report anything not validated.

## Always on

- Keep the Resume block in `.ai/HANDOFF.md` current as a rolling checkpoint and honor `.ai/LIMITS.md`; warn before a usage limit and finalize the handoff.
- After completing work, update `.ai/TASKS.md` and `.ai/HANDOFF.md`, and capture reusable, non-obvious learnings in `.ai/LEARNINGS.md`; promote durable ones to `CONVENTIONS.md`, `DECISIONS.md`, `TOOLS.md`, or `VALIDATION.md`.
- Before handing work to another agent, model, provider, or machine, follow `.ai/workflows/switch-agent.md` and fill the Resume block.
- If this tool does not read `AGENTS.md` automatically, add its thin adapter from `.ai/ADAPTERS.md`.

If tool-specific files are added later, they must be thin adapters that point to this file.
