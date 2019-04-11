#!/bin/bash
# clear and copy from seed

print_help() {
printf "`cat << EOF
${BLUE}kd wb phosphor${NC}

Run yarn install and yarn tsc in the itypescript
repository, then unlink, then link

EOF
`\n"
}

run() {
  local WORKSPACE=~/Documents/kisia/jupyterlab-cwd
  rm -rf $WORKSPACE/*
  cp -r $KWB_BASE_DIR/initial-workspace/* $WORKSPACE
}
