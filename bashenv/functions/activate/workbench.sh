#!/bin/bash
function oneline_help_kd_activate_workbench() {
  echo "activate workbench node and python environment"
}

function help_kd_activate_workbench() {
printf "`cat << EOF
${BLUE}kd wbenv activate${NC}

EOF
`\n\n"
}

function run_kd_activate_workbench() {
	vet_environment
	activate_environment
	kd wbenv info
}
export -f run_kd_activate_workbench help_kd_activate_workbench oneline_help_kd_activate_workbench
