# Agent Adapters

Any coding agent or harness must find the same source of truth: `AGENTS.md` and `.ai/`. Adapters exist only to route a specific tool to `AGENTS.md`; they must never duplicate project context.

## Rules

- One source of truth: `AGENTS.md` and `.ai/`. Adapters contain no project facts.
- Create adapters only for tools actually in use, and only when the tool does not read `AGENTS.md` on its own.
- Codex, OpenCode, and Cursor read `AGENTS.md` directly and need no adapter.
- Adapter paths and formats change between tool versions. Verify against the tool's current documentation before relying on one.

## Mapping

| Tool | Create this file | Mechanism |
| --- | --- | --- |
| Claude Code | `CLAUDE.md` | `@` import of `AGENTS.md` |
| Cursor | `.cursor/rules/agents.mdc` | always-apply rule |
| Kiro | `.kiro/steering/agents.md` | always-included steering |
| Cline | `.clinerules/agents.md` | rules directory |
| Roo Code | `.roo/rules/00-agents.md` | rules directory |
| GitHub Copilot | `.github/copilot-instructions.md` | instructions file |
| Gemini CLI | `GEMINI.md` | context file |
| Windsurf | `.windsurf/rules/agents.md` | always-on rule |
| Aider | `.aider.conf.yml` | `read:` list |
| Zed | `.rules` | rules file |
| Qwen Code | `QWEN.md` | context file |
| DeepSeek Harness (`dsh`) | verify its docs | use `AGENTS.md` if supported |

## Adapter contents

`CLAUDE.md`

```text
@AGENTS.md
```

`.cursor/rules/agents.mdc`

```text
---
description: Route all work through AGENTS.md
alwaysApply: true
---

Read and follow AGENTS.md at the repository root. It is the source of truth; do not duplicate project context here.
```

`.kiro/steering/agents.md`

```text
---
inclusion: always
---

Read and follow AGENTS.md at the repository root. It is the source of truth; do not duplicate project context here.
```

`.clinerules/agents.md`, `.roo/rules/00-agents.md`, `.github/copilot-instructions.md`, `GEMINI.md`, `.rules`, `QWEN.md`

```text
Read and follow AGENTS.md at the repository root. It is the source of truth; do not duplicate project context here.
```

`.windsurf/rules/agents.md`

```text
---
trigger: always_on
---

Read and follow AGENTS.md at the repository root. It is the source of truth; do not duplicate project context here.
```

`.aider.conf.yml`

```text
read:
  - AGENTS.md
```
