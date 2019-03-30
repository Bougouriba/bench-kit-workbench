#!/bin/bash


function oneline_help_kd_troff() {
  echo "Stop trace execution."
}

function help_kd_troff() {
printf "`cat << EOF
${BLUE}kd troff${NC}


EOF
`\n"
}

function run_kd_troff() {
  set +x
}
export -f oneline_help_kd_troff help_kd_troff run_kd_troff
