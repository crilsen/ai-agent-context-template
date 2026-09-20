# Agent Adapters

Any coding agent or harness must find the same source of truth: `AGENTS.md` and `.ai/`. Adapters exist only to route or scope instructions for a specific tool; they must never duplicate project context.

## Native AGENTS.md readers

These tools read `AGENTS.md` on their own and need no routing adapter: **Codex**, **OpenCode**, **Cursor**, and **Kiro**. Verified against each tool's documentation at the time of writing.

Passing them to the installer is harmless; it reports that no file is needed.

## Ready adapters

Prebuilt thin adapters are in `.ai/adapters/`. Install them into a project with:

```text
sh .ai/adapters/install.sh [target-dir] [tool...]
```

With no tool names it installs all supported adapters into the target directory (default: the current directory). Example:

```text
sh .ai/adapters/install.sh . claude cursor kiro
```

Supported: `claude`, `cursor`, `kiro`, `cline`, `roo`, `copilot`, `gemini`, `windsurf`, `aider`, `zed`, `qwen`. `opencode` and `codex` need no file.

For native readers, the Cursor and Kiro adapters are **optional routing aids**; useful when you prefer a rules file over relying on `AGENTS.md` discovery.

## Scoped guardrail rules

Rules that apply only to specific paths, materialized per tool:

| Tool | Source | Installed as |
| --- | --- | --- |
| Cursor | `.ai/adapters/cursor-guardrails.mdc` | `.cursor/rules/guardrails.mdc` (scoped by `globs`) |
| Kiro | `.ai/adapters/kiro-guardrails.md` | `.kiro/steering/guardrails.md` (scoped by `fileMatch`) |

See `.ai/GUARDRAILS.md` for the portable policy.

## Plug and play

`.ai/adapters/bootstrap.sh` copies the context, creates the project files when missing, and installs adapters in one step:

```text
sh .ai/adapters/bootstrap.sh ~/my-project claude opencode
```

Then open an agent in the project and say only `Read AGENTS.md`. The agent detects the empty context, analyzes the repository, and fills `.ai/` automatically.

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
| OpenCode | none (native `AGENTS.md`) | `.ai/adapters/opencode.md` |
| Codex | none (native `AGENTS.md`) | `.ai/adapters/codex.md` |
| Cursor (guardrails) | `.cursor/rules/guardrails.mdc` | `.ai/adapters/cursor-guardrails.mdc` |
| Kiro (guardrails) | `.kiro/steering/guardrails.md` | `.ai/adapters/kiro-guardrails.md` |

## Rules

- One source of truth: `AGENTS.md` and `.ai/`. Adapters contain no project facts.
- Install adapters only for tools actually in use.
- Adapter paths and formats change between tool versions; verify against the tool's current documentation.

## Notes

- Cursor: project rules use `.cursor/rules/*.mdc` with `description`/`globs`/`alwaysApply`; `AGENTS.md` is also read from the root and subdirectories.
- Kiro: steering lives in `.kiro/steering/` with inclusion modes (`always`, `fileMatch`, `manual`, `auto`); `AGENTS.md` is also read from the root, `~/.kiro/steering/`, and subdirectories. Kiro CLI does not support inclusion modes and loads all steering files.
