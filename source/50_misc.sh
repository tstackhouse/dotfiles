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
