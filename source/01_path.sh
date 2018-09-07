if [ -d "$HOME/android" ] ; then
    PATH="$HOME/android/tools:$HOME/android/platform-tools:$PATH"
fi

# add homebrew to pythonpath, if installed
if hash brew 2> /dev/null; then
    export PYTHONPATH=$(brew --prefix)/lib/python2.7/site-packages:$PYTHONPATH
fi

# add rbenv to shell, if present
if hash rbenv 2> /dev/null; then
    eval "$(rbenv init -)"
fi

# add rubygems to path, if present
if hash ruby 2> /dev/null && hash gem 2> /dev/null; then
    PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi

export PATH="/usr/local/mysql/bin:/opt/local/bin:/usr/local/bin:$PATH"
export php="/usr/local/php5/bin/php"

if [[ -a "/usr/libexec/java_home" ]] ; then
    export JAVA_HOME=$(/usr/libexec/java_home)
fi

# add n bin, if set
if [ -d "$HOME/.n" ] ; then
    export N_PREFIX="$HOME/.n";
    PATH="$N_PREFIX/bin:$PATH"
fi

# add yarn bin, if set
if [ -d "$HOME/.yarn/bin" ] ; then
    PATH="$HOME/.yarn/bin:$PATH"
fi

# add go, if set
if [ -d "$HOME/.go" ] ; then
    export GOROOT="$HOME/.go"
    export GOPATH="$HOME/.local/go"
    PATH="$GOPATH/bin:$GOROOT/bin:$PATH"
fi

# add tmuxifier
export PATH="$DOTFILES/vendor/tmuxifier/bin:$PATH"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

