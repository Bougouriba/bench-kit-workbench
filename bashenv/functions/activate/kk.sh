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
	if vet_python_environment; then
    if activate_kisia_kernel_environment; then
			 activate_devenv kk
       kd kk env
       true
    else
      echo "Unable to activate environment for tool, try resetting"
      if [ -d "$KK_VENV_PATH" ]; then
        echo "There is a venv at $KK_VENV_PATH, try kd kk reset"
      else
        echo "No Environment Found At $KK_VENV_PATH, try kd kk setup"
      fi
      false
    fi
   fi
}
export -f run_kd_activate_kk help_kd_activate_kk oneline_help_kd_activate_kk
