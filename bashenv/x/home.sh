#!/bin/bash

function oneline_help_kd_home() {
  echo "cd into $KXX."
}

function help_kd_home() {
printf "`cat << EOF
${BLUE}kd home${NC}

Just changes directory to $KXX
EOF
`\n"
}

function run_kd_home() {
  cd $KXX
}
export -f oneline_help_kd_home help_kd_home run_kd_home
