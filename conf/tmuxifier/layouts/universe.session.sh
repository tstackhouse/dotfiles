# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "~/src/workspace-sts"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "universe"; then
    
    ##### utulity window + scm

    window_root "~/src/workspace-sts/scm-service"
    new_window "utility"
    tmuxifier-tmux set-option -t $session allow-rename off

    # new_window "models"
    window_root "~/src/workspace-sts"
    split_h 33
    select_pane 1
    
    split_h 33
    select_pane 1

    tmuxifier-tmux select-layout -t $session:1 main-vertical

    # hornetq
    select_pane 3
    window_root "~/src/workspace-sts/"
    split_h 50
    run_cmd "hornet-start"
    select_pane 2
    
    ##### End utility window + scm

    #### Other Services    
    #load_window universe-services
    ##### End Other Services

    ##### Finalize
    select_window 1
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
