# =====================================
# fzf configuration
# =====================================

# Default display options
export FZF_DEFAULT_OPTS="
  --height=40%
  --layout=reverse
  --border
  --info=inline
"

# Search files with fd
export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git'

# Ctrl + T: file search and preview
export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,.venv
  --preview 'bat --color=always --style=numbers --line-range=:200 {}'
  --preview-window=right:50%
"

# Alt + C: directory search
export FZF_ALT_C_OPTS="
  --walker-skip .git,node_modules,.venv
  --preview 'ls -la {}'
  --preview-window=right:50%
"

# Enable Zsh integration
source <(fzf --zsh)
