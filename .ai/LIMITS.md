# Limits and Checkpoints

Goal: never lose work or context when approaching an agent, model, or provider usage limit, and always leave a state another agent can resume.

## Why

Providers meter usage differently (tokens, dollars, requests, or context window), and the agent cannot always read the exact remaining quota. Use two signals together: reported usage when the tool exposes it, and a self-imposed work-volume proxy.

## Rolling checkpoint (always on)

- After every meaningful step, keep the Resume block in `.ai/HANDOFF.md` current: goal, exact next action, blockers, and uncommitted files.
- Commit at every stable point; do not batch long stretches of uncommitted work.
- The repository must always be resumable by another agent without chat history.

## Thresholds

| Estimated usage | Action |
| --- | --- |
| below 70% | normal work |
| 70% or more | announce "approaching limit"; commit; refresh the Resume block |
| 85% or more | stop starting new work; finish the current atomic step; commit and push; finalize the handoff |
| limit reached or hard stop | hand off with `.ai/workflows/switch-agent.md`, then resume in another agent |

## Cadence triggers

Run a checkpoint when any of the following is true:

- the user asks for one;
- before a long or risky operation;
- after each commit;
- after completing a task;
- when the tool reports cost or usage near a threshold.

## Reading usage per tool

| Tool | Where usage or cost is shown | Verify |
| --- | --- | --- |
| OpenCode (Go) | usage console and in-session cost display | yes |
| Claude Code | usage/cost command and statusline | yes |
| Codex | usage display and hooks | yes |
| Other | the tool's usage or billing view | yes |

Treat these as indicators, not guarantees, and confirm against the tool's current documentation.

## Optional automatic watchers

Wire the tool's statusline, hook, or plugin to show usage and to trigger `.ai/workflows/checkpoint.md` automatically. Keep the watcher tool-specific and thin; the portable behavior lives in this file and in the workflow.

## Honesty

Never claim a remaining quota that was not observed. If usage is unknown, report it as unknown and keep the rolling checkpoint tight.
