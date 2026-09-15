# Agent Context Template

A portable, Git-versioned context layer for software projects that use coding agents, agentic harnesses, or multiple AI tools over time.

This template keeps the project knowledge in the repository instead of relying on a specific chat history, model, IDE, provider, or computer. It is designed to work with Codex, Cursor, Kiro, OpenCode, Claude Code, DeepSeek Harness (`dsh`), Cline, Roo Code, and future tools.

## Why this exists

Projects often lose working context when a conversation ends, an agent changes, or work moves to another machine. This template provides a small, maintainable source of truth for:

- project purpose and real architecture;
- conventions and durable architectural decisions;
- current work and operational session handoff;
- reusable learnings captured during work and promoted into conventions, decisions, or tooling rules;
- safe tool usage and completion criteria;
- repeatable implementation, review, security, IaC, Kubernetes, and cloud-port workflows.

## How it works

`AGENTS.md` is the universal entry point and is self-driving: reading it tells an agent how to load context, detect whether the project needs adoption, resuming, implementation, or review, and what to do afterward. It routes the agent to the relevant files in `.ai/`, which remains the portable source of truth. The user only needs to say "read AGENTS.md".

```text
Tool-specific adapter (optional)
            ↓
        AGENTS.md
            ↓
          .ai/
```

Tool-specific instruction files may be added when a tool requires them, but they should only direct the tool to `AGENTS.md`; they should not duplicate the project context.

## Using the template

1. Copy `AGENTS.md` and `.ai/` into the root of a project repository.
2. Start an agent and run the adoption flow: it reads `AGENTS.md`, explores the project, and fills `.ai/` with observed facts.

```text
Read AGENTS.md, then .ai/workflows/adopt.md. Adopt this repository:
explore the codebase and replace every placeholder and unknown in .ai/ with observed facts.
```

3. Link to existing authoritative documentation instead of duplicating it.
4. Keep `DECISIONS.md` for durable architectural decisions; keep `TASKS.md` and `HANDOFF.md` concise and current.
5. Commit the context with the project so it travels across tools and computers.

Once adopted, day-to-day use needs no mention of folders or context files:

```text
Read AGENTS.md and perform the requested task.
```

To resume work:

```text
Read AGENTS.md and .ai/HANDOFF.md. Continue from the Resume block. Do not rediscover context.
```

## Safety model

Agents may explore the repository, make scoped edits, and run safe validation. Deployments, destructive commands, real-cluster changes, secret changes, paid-resource creation, and other externally impactful operations require explicit authorization.

## Repository layout

```text
AGENTS.md                 # Agent entry point and context router
.ai/
├── PROJECT.md            # Project overview
├── ARCHITECTURE.md       # Observed architecture
├── CONVENTIONS.md        # Existing and recommended conventions
├── DECISIONS.md          # Durable ADR-style decisions
├── TASKS.md              # Current work state
├── HANDOFF.md            # Operational session handoff
├── LEARNINGS.md          # Append-only buffer of reusable learnings
├── ADAPTERS.md           # Thin per-tool adapters that route to AGENTS.md
├── LIMITS.md             # Usage-limit thresholds and checkpoint policy
├── TOOLS.md              # Safe and restricted tool usage
├── VALIDATION.md         # Completion and validation criteria
├── workflows/            # Task-specific operating procedures
└── prompts/              # Reusable task prompts
```

## Using it across agents and providers

The context lives in the repository, so you can switch agents, models, or providers at any time, including when one provider's usage limit is reached:

1. Before switching, follow `.ai/workflows/switch-agent.md` and fill the Resume block in `.ai/HANDOFF.md`.
2. Commit and push work in progress, or list uncommitted files in `HANDOFF.md`, because a different machine or cloud agent only sees committed files.
3. In the next agent, paste: `Read AGENTS.md and .ai/HANDOFF.md. Continue from the Resume block. Do not rediscover context.`
4. If the tool does not read `AGENTS.md` automatically, create its thin adapter from `.ai/ADAPTERS.md`.

`AGENTS.md` stays small and `.ai/` is read on demand, so agents with lower context windows or tighter limits can still resume safely.

`.ai/LIMITS.md` defines the checkpoint policy: the agent keeps the Resume block current, warns as usage approaches 70% of the budget, and finalizes the handoff before the limit is reached, so switching is a routine step rather than a rescue.
