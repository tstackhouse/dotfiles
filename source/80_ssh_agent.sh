# ssh-agent config
SSH_ENV="$HOME/.ssh-local/environment"
WEASEL_BIN=/mnt/c/Program\ Files/PuTTY/weasel-pageant

function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add;
}

if [ "${SSH_AUTH_SOCK}" ]; then
    if [[ -S "$SSH_AUTH_SOCK" && ! -h "$SSH_AUTH_SOCK" ]]; then
        ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock;
    fi
    export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock;
    echo "Using forwarded SSH agent"
elif [ -x "${WEASEL_BIN}" ]; then
    echo "Connecting to pageant SSH agent via weasel..."
	eval $(${WEASEL_BIN} -r -a "/tmp/.weasel-pageant-${USER}")
elif [ -f "${SSH_ENV}" ]; then
    # Source SSH settings, if applicable
    . "${SSH_ENV}" > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
	start_agent;
    }
else
    start_agent;
fi
# /ssh-agent config
