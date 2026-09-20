#!/usr/bin/env sh
# Example pre-commit hook: enforce the project's checks and refresh the handoff.
#
# This is a thin trigger. The policy lives in .ai/LIMITS.md and the workflows;
# this script only decides WHEN to run them. The agent performs the actual
# checkpoint (updating the Resume block), because a shell script cannot edit
# context with judgment.
#
# Install (git):
#   cp .ai/adapters/hooks/pre-commit.sh .git/hooks/pre-commit
#   chmod +x .git/hooks/pre-commit
set -eu

echo "[ai-agent-relay] running pre-commit checks"
make lint

echo "[ai-agent-relay] reminder: keep the Resume block in .ai/HANDOFF.md current"
echo "[ai-agent-relay] at 70% of your budget, refresh it; at 85%, finalize the handoff"
