# Attach (or start) a tmux session on login
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