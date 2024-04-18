export EDITOR="nvim"
export VISUAL="nvim"

# the detailed meaning of the below three variable can be found in `man zshparam`.
export HISTFILE=~/.zsh_history
export HISTSIZE=1000000   # the number of items for the internal history list
export SAVEHIST=1000000   # maximum number of items for the history file

export PATH=~/src/scripts:~/.local/bin:$PATH

[ -f "/home/crumb/.ghcup/env" ] && . "/home/crumb/.ghcup/env" # ghcup-env

