# Setup fzf
# ---------
if [[ ! "$PATH" == */home/faezdwm/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}$XDG_CONFIG_HOME/.config/fzf/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$XDG_CONFIG_HOME/fzf/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "$XDG_CONFIG_HOME/fzf/.fzf/shell/key-bindings.zsh"
# Auto-suggestion
# ------------
source "$XDG_CONFIG_HOME/fzf/zsh-autosuggestions/zsh-autosuggestions.zsh"
