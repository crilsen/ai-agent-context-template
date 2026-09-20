---
inclusion: fileMatch
fileMatchPattern: ["infra/**", "terraform/**", "**/*.tf", "*.tfvars", ".github/workflows/**"]
---

# Guardrails

Follow `.ai/GUARDRAILS.md`. In this scope:

- Never run `apply`, `destroy`, `kubectl delete`, or any deployment/mutation without explicit user authorization.
- Prefer read-only checks: `fmt`, `validate`, `plan` (only with credentials and permission), `kubectl get`/`describe`/`diff`, client dry-run.
- Never weaken CI checks, add secrets, or change workflow permissions without an explicit decision recorded in `.ai/DECISIONS.md`.
- Never edit secrets, credentials, or state files.
- If a rule blocks a needed step, stop and ask; do not work around it.
