# Setup fzf
# ---------
if [[ ! "$PATH" == */home/faezix/.config/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/faezix/.config/fzf/bin"
fi

# Auto-completion
# ---------------
source "/home/faezix/.config/fzf/shell/completion.zsh"

# Key bindings
# ------------
source "/home/faezix/.config/fzf/shell/key-bindings.zsh"


# Configurations
# --------------
export FZF_CTRL_T_COMMAND="fd --hidden --follow --exclude={.git,.idea,.vscode,.sass-cache,node_modules,build,tmp,*venv,.bun,cache}"
export FZF_ALT_C_COMMAND="fd --hidden --follow --exclude={.git,.idea,.vscode,.sass-cache,node_modules,build,tmp,*venv,.bun,cache} --type d"

# Functions
# ---------

