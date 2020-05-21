# Attach (or start) a tmux session on login
if [[ ! -z "$DOTFILES_SKIP_TMUX" ]]; then
    return
fi
    
TMUX_TMPDIR=/tmp/tmux
if [[ -z "$TMUX" ]]; then
    tmux has-session &> /dev/null
    if [ $? -eq 1 ]; then
      tmux new
      #exit
    else
      tmux attach
      #exit
    fi
fi

# tmuxifier
export TMUXIFIER_LAYOUT_PATH="$DOTFILES/conf/tmuxifier/layouts"
eval "$(tmuxifier init -)"
