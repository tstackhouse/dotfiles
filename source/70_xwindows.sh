# xwindows config

if is_wsl; then
    # set $DISPLAY appropriately for WSL 2 environments
    # Credit: https://www.reddit.com/r/bashonubuntuonwindows/comments/cfy1oh/wsl_2_helper_to_get_host_ip_and_add_it_to_display/
    export $(dbus-launch)
    export LIBGL_ALWAYS_INDIRECT=1
    
    export WSL_VERSION=$(wsl.exe -l -v | grep -a '[*]' | sed 's/[^0-9]*//g')
    export WSL_HOST=$(tail -1 /etc/resolv.conf | cut -d' ' -f2)
    export DISPLAY=$WSL_HOST:0
fi;

# /xwindows config
