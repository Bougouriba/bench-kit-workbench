#
# snapshot

print_help() {
printf "`cat << EOF
${BLUE}kd wb nb snapshot${NC}

Run yarn install and yarn tsc in the itypescript
repository, then unlink, then link

EOF
`\n"
}

run() {
  local WORKSPACE=~/Documents/kisia/jupyterlab-cwd
  cp $WORKSPACE/* $KWB_BASE_DIR/initial-workspace
  rm -rf $KWB_BASE_DIR/initial-workspace/Untitled*
}
