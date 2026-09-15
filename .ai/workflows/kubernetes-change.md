# Kubernetes Change Workflow

1. Identify effects on namespaces, RBAC, ingress, Services, probes, requests/limits, security contexts, secrets, service accounts, workload identity, storage, affinity, disruption budgets, network policies, and observability.
2. Preserve existing conventions and do not broaden access or exposure without an explicit decision.
3. Validate with YAML parsing, `helm lint`, `helm template`, client dry-run, and configured policy tools where applicable.
4. Update `TASKS.md` and `HANDOFF.md` when relevant; report anything not validated.

Do not apply to real clusters without explicit authorization.
