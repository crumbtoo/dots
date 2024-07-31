#!/bin/zsh
#
# .zshrc - Zsh file loaded on interactive shell sessions.
#

### options
setopt autocd
setopt extended_glob

# The meaning of these options can be found in man page of `zshoptions`.
setopt HIST_IGNORE_ALL_DUPS  # do not put duplicated command into history list
setopt HIST_SAVE_NO_DUPS  # do not save duplicated command
setopt HIST_REDUCE_BLANKS  # remove unnecessary blanks
setopt INC_APPEND_HISTORY_TIME  # append command to history file immediately after execution
setopt EXTENDED_HISTORY  # record command start time

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
setopt globstarshort

setopt AUTO_PUSHD        # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS # Do not store duplicates in the stack.
setopt PUSHD_SILENT      # Do not print the directory stack after pushd or popd.

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
# ZFUNCDIR=${ZFUNCDIR:-$ZDOTDIR/functions}
# fpath=($ZFUNCDIR $fpath)
# autoload -Uz $fpath[1]/*(.:t)

# Source zstyles you might use with antidote.
# [[ -e ${ZDOTDIR:-~}/.zstyles ]] && source ${ZDOTDIR:-~}/.zstyles

# Clone antidote if necessary.
[[ -d ${ZDOTDIR:-~}/.antidote ]] ||
  git clone https://github.com/mattmc3/antidote ${ZDOTDIR:-~}/.antidote

PATH_LOL=$PATH

# Create an amazing Zsh config using antidote plugins.
source ${ZDOTDIR:-~}/.antidote/antidote.zsh
antidote load

PATH=$PATH_LOL

