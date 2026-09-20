#!/usr/bin/env sh
# Install the Claude Code hook example into .claude/settings.json.
# Creates the file only if it does not already exist; never overwrites.
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
    ]
  }
}
JSON
printf 'created: %s\n' "$settings"
