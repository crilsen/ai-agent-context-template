#!/usr/bin/env sh
# Install the OpenCode plugin example into a project.
# Creates .opencode/plugins/ and copies relay.js; never overwrites an existing file.
set -eu

src_dir=$(dirname -- "$0")
target=${1:-.}
dest="$target/.opencode/plugins/relay.js"

if [ -e "$dest" ]; then
  printf 'kept existing: %s\n' "$dest"
  exit 0
fi

mkdir -p "$target/.opencode/plugins"
cp "$src_dir/relay.js" "$dest"
printf 'created: %s\n' "$dest"
printf 'note: OpenCode loads .opencode/plugins/*.{js,ts} at startup\n'
