#!/usr/bin/env sh
# Install the OpenCode plugins (relay + guardrails) into a project.
# Copies each plugin only if it does not already exist; never overwrites.
set -eu

src_dir=$(dirname -- "$0")
target=${1:-.}

mkdir -p "$target/.opencode/plugins"

for name in relay guardrails; do
  dest="$target/.opencode/plugins/$name.js"
  if [ -e "$dest" ]; then
    printf 'kept existing: %s\n' "$dest"
  else
    cp "$src_dir/$name.js" "$dest"
    printf 'created: %s\n' "$dest"
  fi
done

printf 'note: OpenCode loads .opencode/plugins/*.{js,ts} at startup\n'
