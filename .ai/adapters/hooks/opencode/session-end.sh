#!/usr/bin/env sh
# OpenCode session-end hook.
#
# OpenCode reads AGENTS.md natively. This hook triggers the checkpoint so the
# handoff is ready when you switch tools or hit a usage limit.
#
# It prints the instruction; the agent performs the checkpoint.
# Install: copy to your OpenCode hooks/plugins directory and make it executable,
# or invoke it from your shell's session-exit path:
#
#   cp .ai/adapters/hooks/opencode/session-end.sh ~/.config/opencode/hooks/
#   chmod +x ~/.config/opencode/hooks/session-end.sh
#
# Verify the exact hook mechanism against your OpenCode version; paths and
# event names may change.
set -eu

cat <<'EOF'
[ai-agent-relay] OpenCode session ending
Read AGENTS.md, then follow .ai/workflows/checkpoint.md:
- commit work in progress, or list uncommitted files in the Resume block
- update the Resume block in .ai/HANDOFF.md
- honor .ai/LIMITS.md (warn at 70%, finalize and push at 85%)
To continue in another tool:
Read AGENTS.md and .ai/HANDOFF.md. Continue from the Resume block. Do not rediscover context.
EOF
