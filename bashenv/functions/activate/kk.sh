#!/bin/bash
function oneline_help_kd_activate_kk() {
  echo "activate workbench node and python environment"
}

function help_kd_activate_kk() {
printf "`cat << EOF
${BLUE}kd kkenv activate${NC}

EOF
`\n\n"
}

function run_kd_activate_kk() {
	if vet_tool_environment; then
    if activate_tool_environment; then
	     kd kk env
			activate_devenv kk
       true
    else
      echo "Unable to activate environment for tool, try resetting"
      if [ -d "$KK_VENV_PATH" ]; then
        echo "There is a venv at $KK_VENV_PATH, try kd tool reset"
      else
        echo "No Environment Found At $KK_VENV_PATH, try kd tool setup"
      fi
      false
    fi
   fi
}
export -f run_kd_activate_kk help_kd_activate_kk oneline_help_kd_activate_kk
