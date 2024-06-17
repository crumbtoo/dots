alias gs='git status'
alias ga='git add'
alias gp='git push'
alias gpo='git push origin'
alias gtd='git tag --delete'
alias gtdr='git tag --delete origin'
alias gr='git branch -r'
alias gplo='git pull origin'
alias gb='git branch '
alias gc='git commit'
alias gcl='git clone'
alias gd='git diff'
alias gco='git checkout '
alias gl='git log'
alias gr='git remote'
alias grs='git remote show'
alias glo='git log --pretty="oneline"'
alias glol='git log --graph --oneline --decorate'

alias jgp='jj git push'
alias jgr='jj git remote'
alias jgcl='jj git clone'
alias js='jj st'
alias jn='jj new'
alias jd='jj describe'
alias jdi='jj diff'
alias jb='jj branch'
alias je='jj edit'
alias jl='jj log'

alias v='nvim'

if command -v lsd &> /dev/null; then
    alias l='lsd -l'
    alias ll='lsd -la'
else
    alias l='ls --color=auto -l'
    alias ll='ls --color=auto -la'
fi

alias cbuild='cabal build'
alias crepl='cabal repl'

alias '$'=":;"

