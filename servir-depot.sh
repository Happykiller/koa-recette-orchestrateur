#!/usr/bin/env bash
# Relance le service du dépôt s'il ne tourne pas : il ne survit pas à un redémarrage de la distro.
set -eu
if ! pgrep -f "git-daemon.*9418" >/dev/null 2>&1 && ! pgrep -f "git daemon.*9418" >/dev/null 2>&1; then
  git daemon --reuseaddr --base-path="$HOME/depot" --export-all --enable=receive-pack \
    --listen=127.0.0.1 --port=9418 --detach --pid-file="$HOME/depot/daemon.pid"
fi
echo "dépôt servi sur git://localhost/projet.git"
