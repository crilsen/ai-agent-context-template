# Guardrails

Portable policy for what agents may and may not do, independent of tool. `.ai/TOOLS.md` lists concrete commands; this file states the rules behind them. Harnesses enforce a subset through permissions, hooks, and scoped rules.

## Always allowed

- Read, search, and understand the repository.
- Make scoped, reversible, task-related edits.
- Run formatters, linters, tests, syntax checks, and safe dry runs.
- Update `.ai/` context.

## Never without explicit authorization

- Destructive or irreversible operations: `rm -rf`, force push, history rewrite, dropping data.
- Deployment or infrastructure mutation: `apply`, `destroy`, `kubectl delete`, production changes.
- Secret or credential changes; committing secrets.
- Creating paid resources.
- Sending data outside the repository (network exfiltration, uploading code or logs).
- Editing files outside the task scope, or editing `.git/`, CI credentials, or lockfiles without cause.

## Escalation

When a rule blocks a step that seems necessary, stop and ask the user with: what you wanted to do, why, the impact, and a safer alternative. Do not work around a guardrail silently.

## Scoped rules

Rules can be scoped by path or tool. Examples:

- Under `infra/**` or `**/*.tf`: never `apply`/`destroy`; `plan` only with credentials present and permission.
- Under `.github/workflows/**` or CI config: do not weaken checks or add secrets.
- For migrations or schema files: never destructive changes without a reversible plan.

Materialize scoped rules in the harness's own format (Cursor `globs`, Kiro `fileMatch`) so they load only when relevant.

## Enforcement levels

Guardrails can be advisory or enforced:

1. **Advisory** — stated in `AGENTS.md`, this file, and `TOOLS.md`. The agent is instructed; nothing blocks it.
2. **Scoped** — harness rules applied by path (see above). Loaded automatically for matching files.
3. **Enforced** — harness permissions and hooks that block the action, for example Claude Code `PreToolUse` or OpenCode `tool.execute.before`. See `.ai/adapters/hooks/`.

Prefer enforcement for irreversible actions. Keep the portable policy here; wire the enforcement in the harness.
