/**
 * ai-agent-relay plugin for OpenCode.
 *
 * OpenCode does not use shell hooks; it loads JavaScript/TypeScript plugins
 * from `.opencode/plugins/` (project) or `~/.config/opencode/plugins/` (global).
 * This plugin nudges the agent to run the checkpoint/handoff workflow at
 * session end and when a session goes idle, so switching tools or hitting a
 * usage limit is a routine handoff.
 *
 * Install (project scope):
 *   mkdir -p .opencode/plugins
 *   cp .ai/adapters/hooks/opencode/relay.js .opencode/plugins/
 *
 * Read AGENTS.md for the policy; this plugin only decides WHEN to remind.
 * @type {import("@opencode-ai/plugin").Plugin}
 */
export const RelayPlugin = async ({ client }) => {
  const reminder =
    "[ai-agent-relay] run .ai/workflows/checkpoint.md: commit or list WIP, " +
    "update the Resume block in .ai/HANDOFF.md, honor .ai/LIMITS.md " +
    "(warn at 70%, finalize and push at 85%)."

  let announced = false

  return {
    event: async ({ event }) => {
      if (event.type === "session.idle" && !announced) {
        announced = true
        await client.app.log({
          body: { service: "ai-agent-relay", level: "info", message: reminder },
        })
      }
      if (event.type === "session.idle") announced = false
    },
  }
}
