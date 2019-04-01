#!/bin/bash
function oneline_help_kd_setup() {
  echo "Initialize a clean environment"
}
function help_kd_setup() {
printf "`cat << EOF
${BLUE}kd setup <COMPONENT>${NC}


  Goal : ${YELLOW}$(oneline_help_kd_setup )${NC}

EOF
`\n\n"
}

function run_kd_setup() {
  run_environment_func setup $@
}
export -f run_kd_setup oneline_help_kd_setup
