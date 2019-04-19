#!/bin/bash
# start

print_help() {
printf "`cat << EOF
${BLUE}kd nteract start${NC}

Info about kd nteract start

EOF
`\n"
}

run() (
  activate_environment_kd_nteract
  cd $NTERACT_BASE/applications/desktop
  #yarn app:desktop
  #yarn build:desktop:watch &
  yarn spawn:debug "$@"
  wait
)
