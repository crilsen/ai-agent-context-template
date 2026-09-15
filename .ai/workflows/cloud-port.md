# Cloud Port Workflow

Do not perform mechanical service translation between AWS, Azure, GCP, or OCI.

1. Understand the source architecture and the intent of every relevant component.
2. Identify target-provider conceptual differences and managed-service responsibilities.
3. Evaluate security boundaries, isolation, identity, availability, observability, scaling, operations, recovery, and cost.
4. Explain material incompatibilities and trade-offs; select the appropriate architectural equivalent only then.
5. Use provider-native patterns where appropriate and preserve intent rather than product names.
6. Record material divergence in `DECISIONS.md` or `HANDOFF.md`; stop for an undocumented consequential decision.
