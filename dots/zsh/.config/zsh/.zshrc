#!/bin/zsh
#
# .zshrc - Zsh file loaded on interactive shell sessions.
#

# Zsh options.
setopt extended_glob

### vim mode
function zvm_config() {
  ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
}

### prompt
set_prompt() {
    local current_dir='%B%F{14}%2~%f%b'
    local dev='%F{8}[dev]%f'
    local sigma='%B%(?.%F{10}.%F{9})Σ%f%b'
    if [ -n "$GUIX_ENVIRONMENT" ]; then
        # PROMPT='%B%F{14}%2~%f%b %F{8}[dev]%f %B%(?.%F{10}.%F{9})Σ%f%b '
        export PROMPT="${current_dir} ${dev} ${sigma} "
    else
        export PROMPT="${current_dir} ${sigma} "
    fi
}
set_prompt

# Autoload functions you might want to use with antidote.
ZFUNCDIR=${ZFUNCDIR:-$ZDOTDIR/functions}
fpath=($ZFUNCDIR $fpath)
autoload -Uz $fpath[1]/*(.:t)

# Source zstyles you might use with antidote.
[[ -e ${ZDOTDIR:-~}/.zstyles ]] && source ${ZDOTDIR:-~}/.zstyles

# Clone antidote if necessary.
[[ -d ${ZDOTDIR:-~}/.antidote ]] ||
  git clone https://github.com/mattmc3/antidote ${ZDOTDIR:-~}/.antidote

# Create an amazing Zsh config using antidote plugins.
source ${ZDOTDIR:-~}/.antidote/antidote.zsh
antidote load

