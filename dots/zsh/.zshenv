#!/bin/zsh
#
# .zshenv - Zsh environment file, loaded always.
#

# NOTE: .zshenv needs to live at ~/.zshenv, not in $ZDOTDIR!

# Set ZDOTDIR if you want to re-home Zsh.
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export ZDOTDIR=${ZDOTDIR:-$XDG_CONFIG_HOME/zsh}

# TEMP_GHCUP_PATH="~/.ghcup/hls/2.7.0.0/bin"

export PATH=~/.cabal/bin:~/src/scripts:~/.local/bin:~/.pack/bin:~/.ghcup/bin:$TEMP_GHCUP_PATH:$PATH

[ -f "~/.ghcup/env" ] && . "~/.ghcup/env" # ghcup-env

# You can use .zprofile to set environment vars for non-login, non-interactive shells.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

