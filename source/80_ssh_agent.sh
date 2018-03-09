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

function start_weasel {
    echo "Connecting to pageant SSH agent via weasel..."
	${WEASEL_BIN} -r -a "/tmp/.weasel-pageant-${USER}" | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
}

if [ -x "${WEASEL_BIN}" ]; then
	if [ -f "${SSH_ENV}" ]; then
		# Source SSH settings, if applicable
		. "${SSH_ENV}" > /dev/null
		#ps ${SSH_PAGEANT_PID} doesn't work under cywgin
		(ps -ef | grep ${SSH_PAGEANT_PID} | grep weasel-pageant) >&| /dev/null || {
		start_weasel;
    }
	else 
		#ps ${SSH_PAGEANT_PID} doesn't work under cywgin
		(ps -ef | grep ${SSH_PAGEANT_PID} | grep weasel-pageant) >&| /dev/null || {
		start_weasel;
		}
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
