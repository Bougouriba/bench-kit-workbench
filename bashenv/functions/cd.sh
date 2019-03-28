#!/bin/bash

function oneline_help_kd_cd() {
  echo "cd into $KITWB_BASE_DIR/<repo>."
}

function help_kd_cd() {
printf "`cat << EOF
${BLUE}kd cd <repo>${NC}

This is a shell function, which changes the current working
directory to $KITWB_BASE_DIR/<repo>
and if no <repo> is provided this is equivalent to ${BLUE}kd home${NC}.

Examples:
kd cd iglu -> cd's into $KITWB_BASE_DIR/iglu

EOF
`\n\n"
}

function run_kd_cd() {
  if [ -z "$1" ]; then
    run_kd_home
  else
    cd $KITWB_BASE_DIR/$1
  fi
}
export -f run_kd_cd help_kd_cd oneline_help_kd_cd
