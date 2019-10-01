if [ -d "$HOME/android" ] ; then
    PATH="$HOME/android/tools:$HOME/android/platform-tools:$PATH"
fi

# add homebrew to pythonpath, if installed
if hash brew 2> /dev/null; then
    HOMEBREW_PYTHON=$(brew --prefix)/lib/python2.7/site-packages
    [[ :$PYTHONPATH: == *":$HOMEBREW_PYTHON:"* ]] || PYTHONPATH="$HOMEBREW_PYTHON:$PYTHONPATH"
fi

# add rbenv to shell, if present
if hash rbenv 2> /dev/null; then
    eval "$(rbenv init -)"
fi

# add rubygems to path, if present
if hash ruby 2> /dev/null && hash gem 2> /dev/null; then
    RUBYGEMS_PREFIX=$(ruby -rrubygems -e 'puts Gem.user_dir')
    [[ :$PATH: == *":$RUBYGEMS_PREFIX/bin:"* ]] || PATH="$RUBYGEMS_PREFIX/bin:$PATH"
fi

# add usr local bin if present
LOCAL_BIN="/usr/local/bin"
if [ -d "$LOCAL_BIN" ] ; then
    [[ :$PATH: == *":$LOCAL_BIN:"* ]] || PATH="$LOCAL_BIN:$PATH"
fi

# add opt local bin if present
OPT_BIN="/opt/local/bin"
if [ -d "$OPT_BIN" ] ; then
    [[ :$PATH: == *":$OPT_BIN:"* ]] || PATH="$OPT_BIN:$PATH"
fi

# add mysql bin if present
MYSQL_BIN="/usr/local/mysql/bin"
if [ -d "$MYSQL_BIN" ] ; then
    [[ :$PATH: == *":$MYSQL_BIN:"* ]] || PATH="$MYSQL_BIN:$PATH"
fi

if [ -e "/usr/local/php5/bin/php" ] ; then
    export php="/usr/local/php5/bin/php"
fi

if [[ -a "/usr/libexec/java_home" ]] ; then
    export JAVA_HOME=$(/usr/libexec/java_home)
fi

# add n bin, if set
if [ -d "$HOME/.n" ] ; then
    export N_PREFIX="$HOME/.n";
    [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH="$N_PREFIX/bin:$PATH"
fi

# add yarn bin, if set
if [ -d "$HOME/.yarn/bin" ] ; then
    [[ :$PATH: == *":$HOME/.yarn/bin:"* ]] || PATH="$HOME/.yarn/bin:$PATH"
fi

# add go, if set
if [ -d "$HOME/.go" ] ; then
    export GOROOT="$HOME/.go"
    export GOPATH="$HOME/.local/go"
    [[ :$PATH: == *":$GOROOT/bin:"* ]] || PATH="$GOROOT/bin:$PATH"
    [[ :$PATH: == *":$GOPATH/bin:"* ]] || PATH="$GOPATH/bin:$PATH"
fi

# add tmuxifier

TMUXIFIER_BIN="$DOTFILES/vendor/tmuxifier/bin"
[[ :$PATH: == *":$TMUXIFIER_BIN:"* ]] || PATH="$TMUXIFIER_BIN:$PATH"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    [[ :$PATH: == *":$HOME/bin:"* ]] || PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
    [[ :$PATH: == *":$HOME/.local/bin:"* ]] || PATH="$HOME/.local/bin:$PATH"
fi

# Add paths for WSL
if is_wsl ; then
    SYSTEM_32="/mnt/c/Windows/System32"
    [[ :$PATH: == *":$SYSTEM_32:"* ]] || PATH+=":$SYSTEM_32"
    VIRTUALBOX_PATH="/mnt/c/Program Files/Oracle/VirtualBox"
    [[ :$PATH: == *":$VIRTUALBOX_PATH:"* ]] || PATH+=":$VIRTUALBOX_PATH"
fi
