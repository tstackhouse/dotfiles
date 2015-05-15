window_root "~/src/workspace-sts/oms-service"
new_window "oms"
run_cmd "mvn clean jetty:run"

window_root "~/src/workspace-sts/tms-service"
# split_h 10
new_window "tms"
run_cmd "mvn clean jetty:run"
# select_pane 1

window_root "~/src/workspace-sts/wms-service"
# split_h 10
new_window "wms"
run_cmd "mvn clean jetty:run"
# select_pane 1

window_root "~/src/workspace-sts/gis-service"
# split_h 12
new_window "gis"
run_cmd "mvn clean jetty:run"
# select_pane 1

window_root "~/src/workspace-sts/party-service"
# split_h 12
new_window "party"
run_cmd "mvn clean jetty:run"
# select_pane 1

window_root "~/src/workspace-sts/profile-service"
# split_h 16
new_window "profile"
run_cmd "mvn clean jetty:run"
# select_pane 1

# window_root "~/src/workspace-sts/security-service"
# split_h 16
# new_window "security"
# run_cmd "mvn clean jetty:run"
# select_pane 1

window_root "~/src/workspace-sts/information-exchange-service"
# split_h 24
new_window "ie"
run_cmd "mvn clean jetty:run"
#select_pane 1

select_window 1
# tmuxifier-tmux select-layout -t $session:$window tiled
