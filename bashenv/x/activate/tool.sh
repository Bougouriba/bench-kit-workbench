#!/bin/bash
function oneline_help_kd_activate_tool() {
  echo "activate workbench node and python environment"
}

function help_kd_activate_tool() {
printf "`cat << EOF
${BLUE}kd toolenv activate${NC}

EOF
`\n\n"
}

function run_kd_activate_tool() {
	if vet_tool_environment; then
    if activate_tool_environment; then
	     kd tool env
		activate_devenv tool
       true
    else
      echo "Unable to activate environment for tool, try resetting"
      if [ -d "$KT_VENV_PATH" ]; then
        echo "There is a venv at $KT_VENV_PATH, try kd tool reset"
      else
        echo "No Environment Found At $KT_VENV_PATH, try kd tool setup"
      fi
      false
    fi
   fi
}
export -f run_kd_activate_tool help_kd_activate_tool oneline_help_kd_activate_tool
