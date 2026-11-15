#!/data/data/com.termux/files/usr/bin/bash
# OpenCode for phone - ONE-TIME setup. Run inside Termux:  bash setup.sh
set -e
echo "==> Termux packages"
pkg update -y
pkg install -y proot-distro curl

echo "==> Ubuntu (inside Termux)"
if ! proot-distro login ubuntu -- true >/dev/null 2>&1; then
  proot-distro install ubuntu
fi

echo "==> OpenCode"
proot-distro login ubuntu -- bash -lc '
  set -e
  export DEBIAN_FRONTEND=noninteractive
  apt-get update -y
  apt-get install -y curl ca-certificates git unzip ripgrep
  curl -fsSL https://opencode.ai/v2/install | bash -s -- --no-modify-path
  mkdir -p "$HOME/projects"
  "$HOME/.opencode/bin/opencode" --version || true
'

# keep the key file next to the scripts (leave empty to use the free models)
[ -f "$HOME/opencode-keys.env" ] || cp "$(dirname "$0")/keys.env" "$HOME/opencode-keys.env"

echo
echo "Done. Now run:  bash start.sh"
