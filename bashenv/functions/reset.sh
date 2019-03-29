#!/bin/bash


function oneline_help_kd_reset() {
  echo "Reload the environment."
}

function help_kd_reset() {
printf "`cat << EOF
${BLUE}kd reset${NC}

Load and execute $KITWB_BASH_DIR/activate.sh in this shell.

This will cause the entire kd runtime to be reloaded, so any changes to
functions or core abilities (e.g. kd-repl, kd-help, activate) will be
processed.

Example Run:
  bashenv > kd reset
  Successful Reset : kd setenv =  /Users/kisia/Desktop @test:77eeddf, has changes

EOF
`\n"
}

function run_kd_reset() {
  if [ ! -z "$@" ]; then
    printf "${RED}kd_reset${NC}\n"
    printf "Do not understand arguments '$@'\n"
  else
    export PATH=$ORIGINAL_PATH
    kd setenv $KITWB_BASE_DIR
  fi
}
export -f oneline_help_kd_reset help_kd_reset run_kd_reset
