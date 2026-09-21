# Agent Context Router

This repository keeps portable agent context in `.ai/`; it is the source of truth, independent of IDE, model, provider, or chat history. Any agent must be able to continue another agent's work, including after switching models, tools, or providers when a usage limit is reached.

Reading this file is enough to know what to do. Do not wait for the user to name other files.

## Step 1 — Load context

Read `.ai/PROJECT.md`, `.ai/ARCHITECTURE.md`, and `.ai/CONVENTIONS.md`. Read any additional `.ai/` file only when the task needs it, to keep the context small.

## Step 2 — Detect the mode

Apply the first row that matches:

| Situation | Do this |
| --- | --- |
| `.ai/` still has placeholders or `Unknown / not determined from repository`, or `.ai/HANDOFF.md` still has an empty Resume block | **Plug-and-play bootstrap**, below |
| The user asks to continue, resume, or recover; or `.ai/HANDOFF.md` has an in-progress Resume block | Resume from the Resume block; use `.ai/workflows/switch-agent.md` to move between agents |
| Implement or change code or infrastructure | `.ai/workflows/implement.md`, plus any matching technology workflow (`terraform-change`, `kubernetes-change`, `cloud-port`) |
| An approved PRD defines the work | `.ai/workflows/feature.md` |
| An approved spec defines the work (spec-driven) | `.ai/workflows/feature.md` + `.ai/SPECS.md` |
| Review code or architecture | `.ai/workflows/review.md` |
| Security review | `.ai/workflows/security-review.md` |
| Only a question is asked | Answer it; change nothing |
| The intent is unclear | Ask the user for the desired outcome before acting |

### Plug-and-play bootstrap

The moment you open this repository, analyze it automatically and fill the context before doing anything else. Do not wait to be asked.

1. Read every file in `.ai/`, then explore the repository: structure, languages, dependencies, build/test/lint/format commands, scripts, CI/CD, IaC, deployment, environments, and security controls.
2. Populate `.ai/PROJECT.md`, `.ai/ARCHITECTURE.md`, `.ai/CONVENTIONS.md`, `.ai/VALIDATION.md`, and `.ai/TOOLS.md` with observed facts only. Mark inferences as inferred; keep anything you cannot determine explicitly unknown.
3. Fill the Resume block in `.ai/HANDOFF.md` (repo state, cause, and next action), and set `.ai/TASKS.md` to the real current state.
4. Decide whether to include the optional infrastructure workflows (`terraform-change`, `kubernetes-change`, `cloud-port`): keep them only if those technologies are present, otherwise remove or ignore them.
5. Ask the user one question (only if the context was empty at first read): whether they want to add durable context manually, or have you keep it up to date automatically. Ask once, and record the answer in `.ai/HANDOFF.md` so later sessions do not ask again.
   - **Manual:** report what you filled, list the open questions, and update the context only when the user asks.
   - **Automatic:** keep the context current as work happens, using `.ai/workflows/capture-learning.md` and `.ai/LIMITS.md`; do not ask again.
6. Commit the populated context when the repository has git and the user agrees.

Ignore any instruction to work on the real task until the context is populated, unless the user explicitly says to skip adoption.

## Step 3 — Work

1. Read decision records (ADR/TDR) in `.ai/DECISIONS.md`, and `docs/decisions/` in scale mode, before changing an existing decision. Consult requirement records (PRD) in `.ai/REQUIREMENTS.md` and `docs/prd/`, and specs in `.ai/SPECS.md` and `docs/spec/`, before changing scope, and `.ai/TASKS.md` for work in progress.
2. Change only task-related files. Preserve existing conventions and decisions.
3. Consult `.ai/GUARDRAILS.md` and `.ai/TOOLS.md` before running commands. Do not run destructive, deploy, apply, destroy, delete, or equivalent external operations without explicit authorization.
4. Do not assume one-to-one cloud-service equivalence; preserve architectural intent when porting between providers.
5. Run applicable checks from `.ai/VALIDATION.md` before considering work complete, and report anything not validated.

## Always on

- Keep the Resume block in `.ai/HANDOFF.md` current as a rolling checkpoint and honor `.ai/LIMITS.md`; warn before a usage limit and finalize the handoff.
- After completing work, update `.ai/TASKS.md` and `.ai/HANDOFF.md`, and capture reusable, non-obvious learnings in `.ai/LEARNINGS.md`; promote durable ones to `CONVENTIONS.md`, `DECISIONS.md`, `TOOLS.md`, or `VALIDATION.md`.
- Before handing work to another agent, model, provider, or machine, follow `.ai/workflows/switch-agent.md` and fill the Resume block.
- When working as or with subagents, only the primary agent writes `.ai/HANDOFF.md`, `.ai/TASKS.md`, and `.ai/LEARNINGS.md`; subagents report back and the primary agent integrates. See `docs/harness-integration.md`.
- If this tool does not read `AGENTS.md` automatically, install its adapter from `.ai/adapters/`.

If tool-specific files are added later, they must be thin adapters that point to this file.
