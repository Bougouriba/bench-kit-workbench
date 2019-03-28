#!/bin/bash
function oneline_help_kd_activate_rwot_js() {
  echo "activate workbench node and python environment"
}

function help_kd_activate_rwot_js() {
printf "`cat << EOF
${BLUE}kd rwot_jsenv activate${NC}

EOF
`\n\n"
}

function run_kd_activate_rwot_js() {
    if activate_rwot_js_environment; then
	     kd rwot_js env
			activate_devenv rwot_js
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
}
export -f run_kd_activate_rwot_js help_kd_activate_rwot_js oneline_help_kd_activate_rwot_js
