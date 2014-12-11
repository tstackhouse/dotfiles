#old bash crap for reference?
# # history tweaks
# #export HISTCONTROL=ignoredups:erasedups                                                            # dedupe history
# export HISTSIZE=1000                                                                               # larger history
# export HISTFILESIZE=10000                                                                          # larger history file
# shopt -s histappend                                                                               # append to history, don't overwrite it
# #export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"  # save and reload history after each command
# export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"   # write history immediately, and refresh from the file on every command
# # / history tweaks

export HISTSIZE=1000
export SAVEHIST=10000
export HISTFILE=~/.history

setopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY