#!/usr/bin/env sh
# Install the Claude Code hook example into .claude/settings.json.
# Creates the file only if it does not already exist; never overwrites.
#
# Event names follow the Claude Code hooks reference: SessionStart, Stop,
# SessionEnd. Verify against your Claude Code version.
set -eu

target=${1:-.}
settings="$target/.claude/settings.json"

if [ -e "$settings" ]; then
  printf 'kept existing: %s (merge the hook manually)\n' "$settings"
  exit 0
fi

mkdir -p "$target/.claude"
cat > "$settings" <<'JSON'
{
  "hooks": {
    "SessionStart": [
      {
        "hooks": [
          { "type": "command", "command": "sh .ai/adapters/hooks/claude-code/hook.sh SessionStart" }
        ]
      }
    ],
    "Stop": [
      {
        "hooks": [
          { "type": "command", "command": "sh .ai/adapters/hooks/claude-code/hook.sh Stop" }
        ]
      }
    ],
    "SessionEnd": [
      {
        "hooks": [
          { "type": "command", "command": "sh .ai/adapters/hooks/claude-code/hook.sh SessionEnd" }
        ]
      }
    ]
  }
}
JSON
printf 'created: %s\n' "$settings"
printf 'note: Stop fires every turn; quiet the checkpoint reminder if it is noisy\n'
