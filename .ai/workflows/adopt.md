# Adopt Template Workflow

Use once, when embedding this template into an existing repository. Its job is to replace template placeholders with observed facts, without inventing history.

This template is plug-and-play: the agent analyzes the repository automatically and fills the context, then asks the user a single question about how to keep it updated.

1. Read `AGENTS.md` and every file in `.ai/`.
2. Explore the repository to establish facts: structure, languages, dependencies, build/test/lint/format commands, scripts, IaC, CI/CD, deployment, environments, and security controls.
3. Replace every `Unknown / not determined from repository` and placeholder with observed facts. Mark inferences as inferred. Do not invent history, conventions, or decisions.
4. Populate `CONVENTIONS.md` from what the code actually does before adding recommendations.
5. Choose the decision-record mode in `DECISIONS.md`: simple (entries inline) or scale (one file per record under `docs/decisions/`). Record decisions observed or approved, and create `docs/decisions/` only in scale mode.
6. Initialize `REQUIREMENTS.md`: create `docs/prd/` and index existing product requirements, or leave it empty if none exist. Do the same for `SPECS.md` and `docs/spec/` if the project uses the optional spec-driven flow.
7. Fill `VALIDATION.md` with the project's real commands (build, test, lint, typecheck, format) discovered from the repository.
8. Fill `TOOLS.md` with the real tooling and the safe versus restricted commands for this project.
9. Update `PROJECT.md` (and the project's own README if present) so it describes the project, not the template.
10. Keep the optional infrastructure workflows (`terraform-change`, `kubernetes-change`, `cloud-port`) only if those technologies are present; otherwise remove or ignore them.
11. Set `.ai/TASKS.md` to the real current work and initialize the Resume block in `.ai/HANDOFF.md`.
12. Create only the thin adapters for the tools actually in use, per `.ai/ADAPTERS.md` (Codex, OpenCode, and Cursor need none).
13. Ask the user **once** how to keep context updated:
    - **Manual:** report what was filled and the open questions; update context only on request.
    - **Automatic:** keep context current as work happens (`.ai/workflows/capture-learning.md`, `.ai/LIMITS.md`) without asking again.
14. Report what was filled, what remains unknown, and the next actions; then commit.

Do not leave the adoption half done. If a fact cannot be determined, keep it explicitly unknown rather than guessing.
