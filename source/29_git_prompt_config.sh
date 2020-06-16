# Use the faster haskell executable if it's present
if [[ -x "$DOTFILES/vendor/zsh-git-prompt/src/.bin/gitstatus" ]]; then
  GIT_PROMPT_EXECUTABLE="haskell"
fi

source $DOTFILES/vendor/git-extras/etc/git-extras-completion.zsh
source $DOTFILES/vendor/zsh-git-prompt/zshrc.sh

ZSH_GIT_PROMPT_SHOW_UPSTREAM=2
ZSH_THEME_GIT_PROMPT_CACHE=1
ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_SEPARATOR="|"
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[magenta]%}%{~%G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg[red]%}%{×%G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[cyan]%}%{+%G%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{↓%G%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{↑%G%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{…%G%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}%{✔%G%}"
