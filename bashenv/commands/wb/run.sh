#!/bin/bash
# rebuild and run local electron app

print_help() {
printf "`cat << EOF
${BLUE}kd wb go${NC}

Run yarn install and yarn tsc in the itypescript
repository, then unlink, then link

EOF
`\n"
}

run() {
  cd $KWB_BASE_DIR
  if [ "workbench" = "$KITWB_ACTIVE_DEVENV" ]; then
    electron .
  else
    echo "Need to activate the workbench development environment"
  fi
}
