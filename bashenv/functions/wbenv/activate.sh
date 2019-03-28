#!/bin/bash
function oneline_help_kd_wbenv_activate() {
  echo "activate workbench node and python environment"
}

function help_kd_wbenv_activate() {
printf "`cat << EOF
${BLUE}kd wbenv activate${NC}

EOF
`\n\n"
}

function run_kd_wbenv_activate() {
	vet_environment
	activate_environment
	kd wbenv info
}
export -f run_kd_wbenv_activate help_kd_wbenv_activate oneline_help_kd_wbenv_activate
