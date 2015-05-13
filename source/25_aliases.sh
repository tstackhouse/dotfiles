# helpful shortcut aliases
alias e='emacs'
alias emacs='emacs -nw'
alias h='history'
alias hgrep='history | grep'
alias cpr='rsync -r --stats --progress'
alias tmfr='tmuxifier'

# os-specific aliases
case `uname` in
  Darwin)
    alias ls='ls -FG'
    alias flushdns='sudo discoveryutil mdnsflushcache;sudo discoveryutil udnsflushcaches'
    ;;
  Linux)
    alias ls='ls -F --color'
    ;;
esac
# /os aliases
