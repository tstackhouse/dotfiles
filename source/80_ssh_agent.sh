# ssh-agent config

SSH_ENV="$HOME/.ssh-local/environment"

function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add;
}

if is_wsl; then
    export SSH_AUTH_SOCK=$HOME/.ssh/agent.sock
    ss -a | grep -q $SSH_AUTH_SOCK
    if [ $? -ne 0 ]; then
	rm -f $SSH_AUTH_SOCK
	(setsid nohup socat UNIX-LISTEN:$SSH_AUTH_SOCK,fork EXEC:$HOME/.ssh/wsl2-ssh-pageant.exe >/dev/null 2>&1 &)
    fi
elif [ "${SSH_AUTH_SOCK}" ]; then
    if [[ -S "$SSH_AUTH_SOCK" && ! -h "$SSH_AUTH_SOCK" ]]; then
        ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock;
    fi
    export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock;
    echo "Using forwarded SSH agent"
elif [ -f "${SSH_ENV}" ]; then
    # Source SSH settings, if applicable
    . "${SSH_ENV}" > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin
    (ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$) >&| /dev/null || {
	start_agent;
    }
else
    start_agent;
fi
# /ssh-agent config
