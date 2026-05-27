#!/usr/bin/env sh
set -eu

APP_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/pomodoro-kitty"
BIN_DIR="$HOME/.local/bin"

mkdir -p "$APP_DIR" "$BIN_DIR"
cp ./pomo "$APP_DIR/pomo"
chmod +x "$APP_DIR/pomo"
ln -sf "$APP_DIR/pomo" "$BIN_DIR/pomo"

case ":$PATH:" in
  *":$BIN_DIR:"*) ;;
  *)
    printf '%s\n' "Installed, but $BIN_DIR is not in PATH."
    printf '%s\n' "Add this to ~/.zshrc:"
    printf '%s\n' 'export PATH="$HOME/.local/bin:$PATH"'
    ;;
esac

printf '%s\n' "Installed: $BIN_DIR/pomo"
printf '%s\n' "Run: pomo"
