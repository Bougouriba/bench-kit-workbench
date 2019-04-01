#!/bin/bash

function oneline_help_kd_cd() {
  echo "cd home, or into $KXX/[C]."
}

function help_kd_cd() {
printf "`cat << EOF
${BLUE}kd cd <repo>${NC}

This is a shell function, which changes the current working
directory to $KXX/<repo>
and if no <repo> is provided this is equivalent to ${BLUE}kd home${NC}.

EOF
`\n\n"
}

function run_kd_cd() {
  if [ -z "$1" ]; then
    cd $KXX
  else
    cd $KXX/$1
  fi
}
export -f run_kd_cd help_kd_cd oneline_help_kd_cd
