# Agent Adapters

Any coding agent or harness must find the same source of truth: `AGENTS.md` and `.ai/`. Adapters exist only to route a specific tool to `AGENTS.md`; they must never duplicate project context.

## Ready adapters

Prebuilt thin adapters are in `.ai/adapters/`. Install them into a project with:

```text
sh .ai/adapters/install.sh [target-dir] [tool...]
```

With no tool names it installs all supported adapters into the target directory (default: the current directory). Example:

```text
sh .ai/adapters/install.sh . claude cursor
```

Supported: `claude`, `cursor`, `kiro`, `cline`, `roo`, `copilot`, `gemini`, `windsurf`, `aider`, `zed`, `qwen`.

Codex, OpenCode, and Cursor read `AGENTS.md` directly and need no adapter.

## Mapping

| Tool | Installed file | Source |
| --- | --- | --- |
| Claude Code | `CLAUDE.md` | `.ai/adapters/claude.md` |
| Cursor | `.cursor/rules/agents.mdc` | `.ai/adapters/cursor.mdc` |
| Kiro | `.kiro/steering/agents.md` | `.ai/adapters/kiro.md` |
| Cline | `.clinerules/agents.md` | `.ai/adapters/cline.md` |
| Roo Code | `.roo/rules/00-agents.md` | `.ai/adapters/roo.md` |
| GitHub Copilot | `.github/copilot-instructions.md` | `.ai/adapters/copilot.md` |
| Gemini CLI | `GEMINI.md` | `.ai/adapters/gemini.md` |
| Windsurf | `.windsurf/rules/agents.md` | `.ai/adapters/windsurf.md` |
| Aider | `.aider.conf.yml` | `.ai/adapters/aider.yml` |
| Zed | `.rules` | `.ai/adapters/zed.md` |
| Qwen Code | `QWEN.md` | `.ai/adapters/qwen.md` |

## Rules

- One source of truth: `AGENTS.md` and `.ai/`. Adapters contain no project facts.
- Install adapters only for tools actually in use.
- Adapter paths and formats change between tool versions; verify against the tool's current documentation.
