#!/bin/zsh
#
# .zprofile - Zsh file loaded on login.
#

# important for guix:
# https://guix.gnu.org/en/manual/devel/en/html_node/Configuring-the-Shell.html
source ~/.profile

#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER="${BROWSER:-open}"
fi

#
# Editors
#

export EDITOR="${EDITOR:-nvim}"
export VISUAL="${VISUAL:-nvim}"
export PAGER="${PAGER:-less}"

#
# Paths
#

# export GUILE_LOAD_PATH="/usr/local/share/guile/site/3.0"
# export GUILE_LOAD_COMPILED_PATH="/usr/local/lib/guile/3.0/site-ccache"
# export GUILE_SYSTEM_EXTENSIONS_PATH="/usr/local/lib/guile/3.0/extensions"
# export GUILE_LOAD_PATH=/opt/homebrew/share/guile/site/3.0
# export GUILE_LOAD_COMPILED_PATH=/opt/homebrew/lib/guile/3.0/site-ccache
# export GUILE_SYSTEM_EXTENSIONS_PATH=/opt/homebrew/lib/guile/3.0/extensions

# export GUILE_LOAD_PATH=$GUILE_LOAD_PATH:/usr/local/share/guile/site/3.0/
# export GUILE_LOAD_COMPILED_PATH=$GUILE_LOAD_COMPILED_PATH:/usr/local/lib/guile/3.0/site-ccache/
# export GUILE_SYSTEM_EXTENSIONS_PATH=$GUILE_SYSTEM_EXTENSIONS_PATH:/usr/local/lib/guile/3.0/extensions
# export PATH=/usr/local/bin:$PATH

# NOTE [typeset -T]
# the zsh builtin `typeset -T SCALAR list [sep]` keeps variables SCALAR and
# array in sync, where the former is used as a traditional unweildy string, and
# the latter a list/array, allowing ergonomic operations such as `+=`, and some
# book-keeping by zsh which can nub duplicate entries. see: [the relevant zsh docs](https://zsh.sourceforge.io/Doc/Release/Shell-Builtin-Commands.html)

# see NOTE [typeset -T]
typeset -xU -T GUILE_LOAD_PATH guile_load_path ':'
guile_load_path=(
  {/usr/local,/opt/homebrew}/share/guile/site/3.0
)

# see NOTE [typeset -T]
typeset -xU -T GUILE_LOAD_COMPILED_PATH guile_load_compiled_path ':'
guile_load_compiled_path=(
  {/usr/local,/opt/homebrew}/lib/guile/3.0/site-ccache
)

# see NOTE [typeset -T]
typeset -xU -T GUILE_SYSTEM_EXTENSIONS_PATH guile_system_extensions_path ':'
guile_system_extensions_path=(
  {/usr/local,/opt/homebrew}/lib/guile/3.0/extensions
)

# export SSL_CERT_DIR="$HOME/.guix-profile/etc/ssl/certs"
# export SSL_CERT_FILE="$HOME/.guix-profile/etc/ssl/certs/ca-certificates.crt"
# export GIT_SSL_CAINFO="$SSL_CERT_FILE"

# Ensure path arrays do not contain duplicates.
typeset -gU path fpath

# In normal operation, opam only alters files within ~/.opam. However, to best
# integrate with your system, some environment variables should be set:
[[ ! -r '/Users/crumble/.opam/opam-init/init.zsh' ]] \
    || source '/Users/crumble/.opam/opam-init/init.zsh' \
    > /dev/null 2> /dev/null

export DENO_INSTALL="/home/crumb/.deno"

# Set the list of directories that zsh searches for commands.
path=(
  $HOME/{,s}bin(N)
  /opt/{homebrew,local}/{,s}bin(N)
  /usr/local/{,s}bin(N)
  $DENO_INSTALL/bin
  $HOME/.ghcup/bin
  $HOME/.pack/bin
  $HOME/.cabal/bin
  $HOME/src/scripts
  $path
)

[[ -f "$HOME/.ghcup/env" ]] && source "$HOME/.ghcup/env"

