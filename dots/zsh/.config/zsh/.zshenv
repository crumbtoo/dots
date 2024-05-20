export EDITOR="nvim"
export VISUAL="nvim"

# the detailed meaning of the below three variable can be found in `man zshparam`.
export HISTFILE=~/.zsh_history
export HISTSIZE=1000000   # the number of items for the internal history list
export SAVEHIST=1000000   # maximum number of items for the history file

TEMP_GHCUP_PATH="~/.ghcup/hls/2.7.0.0/bin"

export PATH=~/src/scripts:~/.local/bin:~/.pack/bin:~/.ghcup/bin:$TEMP_GHCUP_PATH:$PATH

[ -f "~/.ghcup/env" ] && . "~/.ghcup/env" # ghcup-env

# guile
export GUILE_LOAD_PATH="/usr/local/share/guile/site/3.0"
export GUILE_LOAD_COMPILED_PATH="/usr/local/lib/guile/3.0/site-ccache"
export GUILE_SYSTEM_EXTENSIONS_PATH="/usr/local/lib/guile/3.0/extensions"

