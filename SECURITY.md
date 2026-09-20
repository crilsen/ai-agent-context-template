# Security Policy

This project is a set of Markdown files and small shell scripts that instruct AI coding agents. Its main security risk is not memory corruption or remote code execution: it is **prompt injection through context files** and **unsafe script behavior**.

## Threat model

Content under `AGENTS.md`, `.ai/`, `docs/`, and the adapters is read by an AI agent and treated as instructions. That makes it an instruction channel:

- A malicious or compromised `AGENTS.md` or `.ai/` file can steer an agent to exfiltrate secrets, run destructive commands, or modify unrelated files.
- Context files may be introduced indirectly: a copied template, a fork, a submodule, a dependency, or a pull request that edits context.
- Adapters are thin, but a tampered adapter can redirect a tool or overwrite files in a target project.
- The install scripts copy files and create directories. `bootstrap.sh` does not overwrite existing `AGENTS.md` or `.ai/`, but the target directory is still written to.

Treat repository context as **untrusted input** until you have reviewed it, exactly as you would treat a build script.

## Using it at your own risk

This template is provided **as is, without warranty of any kind** (see [LICENSE](LICENSE)). By using it you accept that:

- You are responsible for reviewing context files before letting an agent act on them.
- You are responsible for the agent's actions: commands it runs, files it changes, and systems it reaches.
- You are responsible for **all costs**, including AI provider usage and token consumption, which can vary and may be significant.
- You are responsible for any data an agent reads, sends, or exposes.
- The maintainers are not liable for any loss, damage, cost, or consequence arising from use of this project.

There is no guarantee of fitness for a particular purpose, compatibility with any specific agent, model, provider, or harness, or that generated context is correct or safe.

## Safeguards in this project

- Agents are instructed not to run destructive, deploy, apply, destroy, or delete operations without explicit authorization (`.ai/TOOLS.md`, `AGENTS.md`).
- Never store secrets in context files; `.gitignore` excludes common secret files.
- The install scripts are POSIX `sh`, checked by `shellcheck`, and tested to be idempotent for `AGENTS.md` and `.ai/`.

These are mitigations, not guarantees. Review before you trust.

## Reporting a vulnerability

Please report security issues privately, not in a public issue:

1. Use GitHub's [private vulnerability reporting](https://github.com/crilsen/ai-agent-context-template/security/advisories/new).
2. Or open a minimal public issue asking for a private channel, without details.

Include what you found, how to reproduce it, the potential impact, and any suggested fix.

We aim to acknowledge a report within 7 days. This is a small, volunteer-maintained project; there is no bounty program and no guaranteed fix timeline.

## Scope

In scope:

- Prompt-injection or instruction-escalation risks in `AGENTS.md`, `.ai/`, `docs/`, and adapters.
- Unsafe behavior in the install scripts (overwrites, path traversal, unintended writes).
- Supply-chain risks in CI or tooling.

Out of scope:

- Vulnerabilities in third-party agents, models, providers, or harnesses.
- The consequences of a user allowing an agent to act without review.
- Provider cost, quota, or billing issues.
