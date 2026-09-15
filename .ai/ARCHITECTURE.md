# Architecture

## Current repository architecture

No application, infrastructure, deployment, or configuration artifacts were present at initial analysis. The following are **Unknown / not determined from repository**:

- Components, dependencies, integrations, and data flow.
- Networking, subnets, routing, NAT, DNS, ingress, load balancing, and cloud/account boundaries.
- Identity, IAM/RBAC, secrets, encryption, and security controls.
- Containers, Kubernetes, observability, CI/CD, Infrastructure as Code, state management, environments, deployment model, availability, and recovery.

## Context-layer layout

```text
Tool-specific adapter (optional)
            ↓
        AGENTS.md
            ↓
          .ai/
  project · architecture · conventions · decisions
  tasks · handoff · tools · validation · workflows · prompts
```

`.ai/` is the portable source of truth. Tool-specific adapters must only route agents to it.

## Recommended convention

Document the architecture that exists, not an idealized future design. Mark facts as observed, inferences as inferred, proposed patterns as recommended, and unavailable facts as unknown.
