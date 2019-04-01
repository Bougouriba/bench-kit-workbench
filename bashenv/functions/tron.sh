#!/bin/bash


function oneline_help_kd_tron() {
  echo "Start trace execution."
}

function help_kd_tron() {
printf "`cat << EOF
${BLUE}kd tron${NC}


EOF
`\n"
}

function run_kd_tron() {
  set -x
}
export -f oneline_help_kd_tron help_kd_tron run_kd_tron
