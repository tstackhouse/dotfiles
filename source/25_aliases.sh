# helpful shortcut aliases
alias e='emacs'
alias emacs='emacs -nw'
alias h='history 25'
alias hgrep='history 10000 | grep'
alias cpr='rsync -r --stats --progress'

# os-specific aliases
case `uname` in
  Darwin)
    alias ls='ls -FG'
    ;;
  Linux)
    alias ls='ls -F --color'
    ;;
esac
# /os aliases
