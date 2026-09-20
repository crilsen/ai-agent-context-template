# Adopt Template Workflow

Use once, when embedding this template into an existing repository. Its job is to replace template placeholders with observed facts, without inventing history.

1. Read `AGENTS.md` and every file in `.ai/`.
2. Explore the repository to establish facts: structure, languages, dependencies, build/test/lint commands, IaC, CI/CD, deployment, environments, and security controls.
3. Replace every `Unknown / not determined from repository` and placeholder with observed facts. Mark inferences as inferred. Do not invent history, conventions, or decisions.
4. Populate `CONVENTIONS.md` from what the code actually does before adding recommendations.
5. Choose the decision-record mode in `DECISIONS.md`: simple (entries inline) or scale (one file per record under `docs/decisions/`). Record decisions observed or approved, and create `docs/decisions/` only in scale mode.
6. Initialize `REQUIREMENTS.md`: create `docs/prd/` and index existing product requirements, or leave it empty if none exist.
7. Fill `VALIDATION.md` with the project's real commands (build, test, lint, typecheck, format) discovered from the repository.
8. Fill `TOOLS.md` with the real tooling and the safe versus restricted commands for this project.
9. Update `PROJECT.md` (and the project's own README if present) so it describes the project, not the template.
10. Create only the thin adapters for the tools actually in use, per `.ai/ADAPTERS.md`.
11. Set `.ai/TASKS.md` to the real current work and initialize the Resume block in `.ai/HANDOFF.md`.
12. Report what was filled, what remains unknown, and the next actions; then commit.

Do not leave the adoption half done. If a fact cannot be determined, keep it explicitly unknown rather than guessing.
