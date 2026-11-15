#!/usr/bin/env bash
# Codespaces: the forwarded port is already private to your GitHub account.
export OPENCODE_PASSWORD="${OPENCODE_PASSWORD:-codespace-$(date +%s)}"
cd "$(dirname "$0")/.."
nohup "$HOME/.opencode/bin/opencode" serve --hostname 0.0.0.0 --port 4096 >/tmp/opencode.log 2>&1 &
echo "OpenCode started. Open the forwarded port 4096. user: opencode  password: $OPENCODE_PASSWORD"
