# Terraform / OpenTofu Change Workflow

1. Identify affected modules, providers, state/backends, variables, outputs, and dependencies.
2. Read conventions and preserve compatibility where practical; avoid out-of-scope changes.
3. Update variables and outputs when the implementation requires it.
4. Run formatting, validation, configured linting, and a plan when safely possible.
5. Report expected impact and validations. Update `HANDOFF.md`.

Never run `terraform apply`, `terraform destroy`, `tofu apply`, or `tofu destroy` without explicit authorization.
