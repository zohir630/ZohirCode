#!/data/data/com.termux/files/usr/bin/bash
# Starts OpenCode (web UI) and opens it in your phone browser. Run:  bash start.sh
PORT=4096
PASS_FILE="$HOME/.opencode-pass"
KEYS_FILE="$HOME/opencode-keys.env"

# one fixed password, created once, so you never type it
[ -s "$PASS_FILE" ] || head -c 24 /dev/urandom | base64 | tr -dc 'A-Za-z0-9' | head -c 20 > "$PASS_FILE"
PASS="$(cat "$PASS_FILE")"

# keep the phone from sleeping the process
command -v termux-wake-lock >/dev/null 2>&1 && termux-wake-lock

# keys: only lines with a value are used. All empty = free models, no login.
KEYS=""
if [ -f "$KEYS_FILE" ]; then
  while IFS='=' read -r k v; do
    case "$k" in ''|\#*) continue ;; esac
    v="${v%\"}"; v="${v#\"}"
    [ -n "$v" ] && KEYS="$KEYS export $k='$v';"
  done < "$KEYS_FILE"
fi

URL="http://opencode:${PASS}@127.0.0.1:${PORT}/"
echo "OpenCode is starting. Browser link (also opens by itself):"
echo "  http://127.0.0.1:${PORT}/   user: opencode   password: ${PASS}"
echo "Stop with Ctrl+C."

( sleep 8; command -v termux-open-url >/dev/null 2>&1 && termux-open-url "$URL" ) &

exec proot-distro login ubuntu --shared-tmp -- bash -lc "
  export OPENCODE_PASSWORD='${PASS}'; ${KEYS}
  mkdir -p \"\$HOME/projects\"; cd \"\$HOME/projects\"
  exec \"\$HOME/.opencode/bin/opencode\" serve --hostname 127.0.0.1 --port ${PORT}
"
