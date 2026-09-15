# Session Handoff

## Resume block (read first)

- Repo state: branch `dev`, HEAD `<short-sha>`, working tree `<clean | dirty: list files>`
- Source of truth: `AGENTS.md` → `.ai/`
- Budget / usage observed: `<unknown | value from the tool>`
- Checkpoint updated: `<YYYY-MM-DD HH:MM>`
- Last goal: Make the context layer usable across agents, including switching providers when a usage limit is reached.
- Exact next action: `<fill in before handing off>`
- Blocked by: None.
- Resume prompt: `Read AGENTS.md and .ai/HANDOFF.md. Continue from the Resume block. Do not rediscover context.`

## Goal

Create a portable, tool- and model-agnostic repository context layer that lets any agent continue another agent's work, including after switching models, tools, or providers when a usage limit is reached.

## Current State

The initial template is complete and now includes a learning feedback loop, thin agent adapters, a switch-agent protocol, and a usage-limit checkpoint policy. The repository contains no project artifacts to analyze.

## What Was Done

Created `AGENTS.md` and the `.ai/` context, workflow, and prompt files. Aligned `PROJECT.md` with the repository state and removed a stray test file. Added the learning loop: `.ai/LEARNINGS.md`, `.ai/workflows/capture-learning.md`, `.ai/prompts/capture-learning.md`, and a capture step in `AGENTS.md`. Added agent independence: `.ai/ADAPTERS.md` with thin per-tool adapters, `.ai/workflows/switch-agent.md`, and the Resume block above. Added usage-limit safety: `.ai/LIMITS.md` with thresholds, `.ai/workflows/checkpoint.md`, and budget/checkpoint fields in the Resume block.

## Files Changed

- `AGENTS.md`
- `README.md`
- `.ai/ADAPTERS.md` (new)
- `.ai/LIMITS.md` (new)
- `.ai/LEARNINGS.md`, `.ai/workflows/capture-learning.md`, `.ai/prompts/capture-learning.md` (new)
- `.ai/workflows/switch-agent.md`, `.ai/prompts/switch-agent.md` (new)
- `.ai/workflows/checkpoint.md`, `.ai/prompts/checkpoint.md` (new)
- `.ai/workflows/adopt.md`, `.ai/prompts/adopt.md` (new)
- `AGENTS.md` (self-driving: mode detection and always-on rules)
- `.ai/DECISIONS.md`, `.ai/CONVENTIONS.md`
- `.ai/TASKS.md`, `.ai/HANDOFF.md`
- Removed `hello-floci.txt`

## Decisions Made

- `.ai/` is the portable source of truth; tool-specific files are thin adapters only and contain no project facts.
- Learnings live in a bounded append-only buffer and are promoted once durable.
- State that must survive an agent or provider switch is committed and pushed, not left only in the working tree.
- The Resume block is a rolling checkpoint, with explicit warn and stop thresholds in `.ai/LIMITS.md`.

## Problems / Risks

- Adapter paths and formats change between tool versions; they are marked for verification in `.ai/ADAPTERS.md`.
- Remaining quota is often not observable; warnings rely on a work-volume proxy when the tool exposes no usage.
- The template needs project-specific facts once adopted in a non-empty repository.
- Prompt/workflow duplication (L-001) is recorded but not yet resolved.

## Validation Performed

- Structural file inventory reviewed; no project-specific validators are available.

## Next Actions

- Adopt the template in a target repository and replace unknown sections with observed facts.
- Create only the adapters for tools actually used.
- Optionally wire a tool-specific watcher (statusline, hook, or plugin) to `.ai/workflows/checkpoint.md`.
- Resolve L-001 by reducing `.ai/prompts/` to thin pointers.
