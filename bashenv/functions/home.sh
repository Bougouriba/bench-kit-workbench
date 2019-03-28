#!/bin/bash

function oneline_help_kd_home() {
  echo "cd into $KITWB_BASE_DIR."
}

function help_kd_home() {
printf "`cat << EOF
${BLUE}kd home${NC}

Just changes directory to $KITWB_BASE_DIR
EOF
`\n"
}

function run_kd_home() {
  cd $KITWB_BASE_DIR
}
export -f oneline_help_kd_home help_kd_home run_kd_home
