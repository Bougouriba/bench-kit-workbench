#!/bin/bash
function oneline_help_kd_wbenv_setenv() {
  echo "Workbench environment information"
}

function help_kd_wbenv_setenv() {
printf "`cat << EOF
${BLUE}kd wbenv info${NC}

EOF
`\n\n"
}

function run_kd_wbenv_setenv() {
  BASE="/tmp/jupyter1"
  export JUPYTER_CONFIG_DIR=$BASE/config
  export JUPYTER_DATA_DIR=$BASE/data
  export JUPYTER_RUNTIME_DIR=$BASE/runtime
  # JUPYTERLAB_SETTINGS_DIR
  # JUPYTERLAB_DIR
  export JUPYTERLAB_WORKSPACES_DIR=$BASE/workspaces
}
export -f run_kd_wbenv_setenv help_kd_wbenv_setenv oneline_help_kd_wbenv_setenv
