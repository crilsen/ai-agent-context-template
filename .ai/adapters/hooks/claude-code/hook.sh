#!/usr/bin/env sh
# Claude Code hook: inject the context router and remind about checkpoints.
#
# Claude Code reads AGENTS.md through the CLAUDE.md adapter (`@AGENTS.md`).
# The SessionStart hook can echo additional context; PostToolUse can nudge on
# risky commands. Adapt event names to your Claude Code version.
#
# Install (project settings.example):
#   sh .ai/adapters/hooks/claude-code/install.sh
# The installer writes .claude/settings.json only if it does not already exist.
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
[ai-agent-relay] session stopping: run .ai/workflows/checkpoint.md (commit or
list WIP, update the Resume block in .ai/HANDOFF.md, honor .ai/LIMITS.md).
EOF
    ;;
  *)
    echo "usage: $0 [SessionStart|Stop]" >&2
    exit 1
    ;;
esac
