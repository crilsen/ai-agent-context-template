#!/usr/bin/env sh
# Claude Code hook: inject the context router and remind about checkpoints.
#
# Verified against the Claude Code hooks reference: the real lifecycle events
# are SessionStart and SessionEnd (per session), and Stop (per turn).
# Hooks are configured in .claude/settings.json (project) or
# ~/.claude/settings.json (user). See docs/harness-integration.md.
#
#   sh .ai/adapters/hooks/claude-code/install.sh
set -eu

event=${1:-SessionStart}

case "$event" in
  SessionStart)
    cat <<'EOF'
Read AGENTS.md and .ai/HANDOFF.md. If .ai/ still has placeholders, run the
plug-and-play bootstrap from AGENTS.md before doing anything else.
EOF
    ;;
  Stop)
    cat <<'EOF'
[ai-agent-relay] turn finished: if you reached a meaningful checkpoint, run
.ai/workflows/checkpoint.md (commit or list WIP, update the Resume block in
.ai/HANDOFF.md, honor .ai/LIMITS.md).
EOF
    ;;
  SessionEnd)
    cat <<'EOF'
[ai-agent-relay] session ending: run .ai/workflows/checkpoint.md (commit or
list WIP, update the Resume block in .ai/HANDOFF.md, honor .ai/LIMITS.md:
warn at 70%, finalize and push at 85%). To continue in another tool:
Read AGENTS.md and .ai/HANDOFF.md. Continue from the Resume block. Do not rediscover context.
EOF
    ;;
  *)
    echo "usage: $0 [SessionStart|Stop|SessionEnd]" >&2
    exit 1
    ;;
esac
