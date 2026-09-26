# Conventions

## Observed conventions

No project code or configuration exists yet, so no historical naming, Terraform/OpenTofu, Kubernetes, scripting, CI/CD, or documentation conventions can be determined.

## Recommended conventions

## Annotation language (code comments and relay `.md` files)

- Default to English for annotations (code comments and relay `.md` files: `AGENTS.md`, `.ai/`, `docs/`, `README.md`, PRD/spec/decision records).
- Always ask the user before writing or updating them whether to keep English or change to another language, and to which language.
- Record the answer in `.ai/HANDOFF.md` (`Annotation language: ...`) and apply it consistently for that task/session.
- Re-ask for each new task or session; do not carry a previous choice forward unless the user declares it a standing preference.
- Keep files and resource names lowercase and descriptive; use the conventions already established by the adopted project.
- Prefer small, focused changes and document meaningful architectural choices in `DECISIONS.md`.
- Do not introduce cloud, IaC, Kubernetes, or CI/CD conventions until those technologies are actually present.
- Treat these recommendations as guidance, not historical decisions; replace them with observed project conventions as the repository evolves.

## Documentation

- Keep `AGENTS.md` short and route-oriented.
- Reference authoritative docs instead of copying them.
- Keep `TASKS.md` current-state only and `HANDOFF.md` operational, not a chat transcript.
- Treat `LEARNINGS.md` as a bounded, append-only buffer; promote durable learnings into `CONVENTIONS.md`, `DECISIONS.md`, `TOOLS.md`, or `VALIDATION.md` instead of letting them accumulate.
- Keep tool-specific files as thin adapters that only route to `AGENTS.md`; record their paths in `.ai/ADAPTERS.md`.
- Keep the Resume block in `HANDOFF.md` current as a rolling checkpoint and honor the thresholds in `.ai/LIMITS.md`.
- Keep decision records (ADR/TDR) and requirements (PRD) separate: decisions describe technical choices, PRDs describe product scope. Choose simple or scale mode for decisions at adoption.
- Use the optional spec-driven flow (`.ai/SPECS.md`) only for large or risky changes; small changes go straight through `.ai/workflows/implement.md`.
- Only the primary agent writes `HANDOFF.md`, `TASKS.md`, and `LEARNINGS.md`; subagents report back instead of committing shared state, to avoid concurrent writes to the single source of truth.
