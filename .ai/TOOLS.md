# Tools

The rules behind these lists live in `.ai/GUARDRAILS.md`.

## Current availability

No project tooling, credentials, environments, or command wrappers were found. Authentication requirements are **Unknown / not determined from repository**. Never store secrets in this file.

## Allowed without additional authorization

- Read and search repository files.
- Make scoped task-related edits.
- Run project formatters, linters, tests, syntax checks, and validation commands when they exist.
- Run read-only commands and safe dry runs.
- Update this portable context.

## Requires explicit authorization

- Deployment or production changes.
- `terraform apply`, `terraform destroy`, `tofu apply`, or `tofu destroy`.
- `kubectl apply` against a real cluster, `kubectl delete`, or equivalent cluster mutation.
- Secret changes, destructive state operations, irreversible changes, paid-resource creation, or any external operation with material impact.

## MCP servers and external tools

MCP servers are configured by the harness, not by this template. Record them here so agents know what is available and what is restricted. Do not record endpoints, tokens, or credentials.

| Tool or MCP server | Purpose | Allowed | Restricted |
| --- | --- | --- | --- |
| `<name>` | `<what it does>` | `<read-only actions>` | `<mutating/internal actions>` |

When a tool changes how context is captured or validated, note it in `.ai/LEARNINGS.md` and, if durable, in this file.

## Technology-specific guidance when adopted

| Technology | Usually safe | Restricted |
| --- | --- | --- |
| Terraform/OpenTofu | `fmt`, `validate`, `plan` | `apply`, `destroy` |
| Kubernetes | `get`, `describe`, `diff`, client dry-run | real-cluster apply/delete |
| Helm | `lint`, `template` | install/upgrade against real environments |
| Static analysis | `tflint`, `checkov`, `trivy`, `shellcheck` | Follow tool/project-specific impact rules |

Before running a command, confirm it is appropriate for the repository and does not require unavailable credentials or mutate external systems.
