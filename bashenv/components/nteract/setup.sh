#!/bin/bash
setup_environment_kd_nteract_help() {
printf "`cat << EOF
${BLUE}kd setup nteract${NC}

EOF
`\n"
}
export -f setup_environment_kd_nteract_help

setup_environment_kd_nteract() (
  echo "Component[nteract]:setup"
  activate_environment_kd_nteract
  cd $NTERACT_BASE
  yarn install
)
export -f setup_environment_kd_nteract
