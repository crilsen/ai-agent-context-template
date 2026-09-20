#!/usr/bin/env sh
# Example post-session hook: tell the agent to run the checkpoint workflow.
#
# Wire this to your harness's session-end event. It prints the instruction;
# the agent executes the checkpoint (it may not be able to run here).
#
# Because harnesses differ, treat this as a template, not a drop-in:
# adapt the invocation to your tool's hook mechanism.
set -eu

cat <<'EOF'
[ai-agent-relay] session ending
Run the checkpoint workflow now:
1. Commit work in progress, or list uncommitted files in the Resume block.
2. Update the Resume block in .ai/HANDOFF.md (goal, next action, blockers, budget).
3. Follow .ai/LIMITS.md: warn at 70%, finalize and push at 85%.
EOF
