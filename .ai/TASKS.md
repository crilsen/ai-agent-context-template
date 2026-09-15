# Current Work

## Active

- None.

## Planned

- Populate project-specific context after this template is adopted.

## Blocked

- Project architecture and technology choices are unknown because no implementation artifacts are present.

## Completed

- Created the portable agent-context template.
- Polished template consistency: referenced `.ai/prompts/` in `AGENTS.md`, corrected the `PROJECT.md` observed state, and removed a stray test file.
- Added the learning feedback loop: `.ai/LEARNINGS.md`, `.ai/workflows/capture-learning.md`, `.ai/prompts/capture-learning.md`, the capture step in `AGENTS.md`, and the promotion/compaction rules.
- Added agent independence and provider switching: `.ai/ADAPTERS.md`, `.ai/workflows/switch-agent.md`, `.ai/prompts/switch-agent.md`, the Resume block in `HANDOFF.md`, and the switch step in `AGENTS.md`.
- Added usage-limit safety: `.ai/LIMITS.md`, `.ai/workflows/checkpoint.md`, `.ai/prompts/checkpoint.md`, the budget/checkpoint fields in the Resume block, and the checkpoint step in `AGENTS.md`.
- Added the adoption flow: `.ai/workflows/adopt.md`, `.ai/prompts/adopt.md`, and the bootstrap instructions in `README.md`.
- Made `AGENTS.md` self-driving: load-context, mode detection, work steps, and always-on rules, so "read AGENTS.md" is sufficient.
