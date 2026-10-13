# Display
export FZF_DEFAULT_OPTS="
  --height=40%
  --layout=reverse
  --border
  --info=inline
"

# File search
export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git --exclude node_modules --exclude .venv'

# Ctrl+T: files
export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,.venv
  --preview 'bat --color=always --style=numbers --line-range=:200 {}'
  --preview-window=right:50%
"

# Alt+C: directories
export FZF_ALT_C_OPTS="
  --walker-skip .git,node_modules,.venv
  --preview 'ls -la {}'
  --preview-window=right:50%
"

# Zsh integration
source <(fzf --zsh)
