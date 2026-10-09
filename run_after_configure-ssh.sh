#!/bin/sh
set -eu

printf '%s\n' "[SSH] Checking permissions..."
ssh_dir="$HOME/.ssh"
if [ -d "$ssh_dir" ]; then
  printf '%s\n' "[SSH] Setting directories to 700..."
  find "$ssh_dir" -type d -exec chmod 700 {} +
  printf '%s\n' "[SSH] Setting private files to 600..."
  find "$ssh_dir" -type f ! -name '*.pub' -exec chmod 600 {} +
  printf '%s\n' "[SSH] Setting public keys to 644..."
  find "$ssh_dir" -type f -name '*.pub' -exec chmod 644 {} +
  printf '%s\n' "[SSH] Permissions ready."
else
  printf '%s\n' "[SSH] Directory missing; skipped."
fi
