printf '%s\n' "[Environment] Loading Homebrew..."
if command -v brew >/dev/null 2>&1; then
  eval "$(brew shellenv)"
elif [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -x /usr/local/bin/brew ]; then
  eval "$(/usr/local/bin/brew shellenv)"
else
  echo "Homebrew is missing. Complete the Homebrew installation step first." >&2
  exit 1
fi
printf '%s\n' "[Environment] Homebrew ready."
