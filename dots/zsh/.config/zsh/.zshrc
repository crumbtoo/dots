# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

setopt autocd

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

alias d='dirs -v'
# alias 1..9 to jump to the nth entry on the directory stack
for index in {1..9}; do
    alias "$index"="cd +${index}"
done

# vi mode

if [ -n "$NOVIM" ]; then
else
    function zvm_config() {
      ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
      ZVM_VI_SURROUND_BINDKEY=classic
    }
    source $ZDOTDIR/zsh-vi-mode/zsh-vi-mode.plugin.zsh
fi

# autopairs
source $ZDOTDIR/zsh-autopair/autopair.zsh

autoload -U compinit; compinit
source $ZDOTDIR/completion.zsh

# bindkey -v
# export KEYTIMEOUT=1

# cursor_mode() {
#     # See https://ttssh2.osdn.jp/manual/4/en/usage/tips/vim.html for cursor shapes
#     cursor_block='\e[2 q'
#     cursor_beam='\e[6 q'

#     function zle-keymap-select {
#         if [[ ${KEYMAP} == vicmd ]] ||
#             [[ $1 = 'block' ]]; then
#             echo -ne $cursor_block
#         elif [[ ${KEYMAP} == main ]] ||
#             [[ ${KEYMAP} == viins ]] ||
#             [[ ${KEYMAP} = '' ]] ||
#             [[ $1 = 'beam' ]]; then
#             echo -ne $cursor_beam
#         fi
#     }

#     zle-line-init() {
#         echo -ne $cursor_beam
#     }

#     zle -N zle-keymap-select
#     zle -N zle-line-init
# }

# cursor_mode

# zmodload zsh/complist
# bindkey -M menuselect 'h' vi-backward-char
# bindkey -M menuselect 'k' vi-up-line-or-history
# bindkey -M menuselect 'l' vi-forward-char
# bindkey -M menuselect 'j' vi-down-line-or-history

# autoload -Uz edit-command-line
# zle -N edit-command-line
# bindkey -M vicmd v edit-command-line

# autoload -Uz select-bracketed select-quoted
# zle -N select-quoted
# zle -N select-bracketed
# for km in viopp visual; do
#   bindkey -M $km -- '-' vi-up-line-or-history
#   for c in {a,i}${(s..)^:-\'\"\`\|,./:;=+@}; do
#     bindkey -M $km $c select-quoted
#   done
#   for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
#     bindkey -M $km $c select-bracketed
#   done
# done

# autoload -Uz surround
# zle -N delete-surround surround
# zle -N add-surround surround
# zle -N change-surround surround
# bindkey -M vicmd cs change-surround
# bindkey -M vicmd ds delete-surround
# bindkey -M vicmd ys add-surround
# bindkey -M visual S add-surround

autoload -U compinit; compinit

if [ -n "$GUIX_ENVIRONMENT" ]; then
    PROMPT='%B%F{14}%2~%f%b %F{8}[dev]%f %B%(?.%F{10}.%F{9})Σ%f%b '
else
    PROMPT='%B%F{14}%2~%f%b %B%(?.%F{10}.%F{9})Σ%f%b '
fi

source $ZDOTDIR/aliases.zsh

# source guix profile
if [ -f $HOME/.guix-profile ]; then
    export GUIX_PROFILE="$HOME/.guix-profile"
    . "$GUIX_PROFILE/etc/profile"
fi

if [ -f $HOME/.config/guix/current ]; then
    export GUIX_PROFILE="$HOME/.config/guix/current"
    . "$GUIX_PROFILE/etc/profile"
fi

source $ZDOTDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

