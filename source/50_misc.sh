setopt NOFLOWCONTROL

# Java Options
export MAVEN_OPTS="-Xmx4096m"
export _JAVA_OPTIONS="-Xms2048m -Xmx2048m -XX:MaxPermSize=1024m"

#beets completion, if available
if command -v beet >/dev/null 2>&1; then
    autoload bashcompinit
    bashcompinit
    _get_comp_words_by_ref() { :; }
    compopt() { :; }
    _filedir() { :; }
    eval "$(beet completion)"
fi

if is_wsl; then
    export CHROME_BIN=/mnt/c/Program\ Files\ \(x86\)/Google/Chrome/Application/chrome.exe
    export PATH="$PATH:/mnt/c/Program Files/Oracle/VirtualBox"
    export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1"
fi
