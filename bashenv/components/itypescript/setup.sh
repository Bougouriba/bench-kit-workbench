#!/bin/bash
setup_environment_kd_itypescript_help() {
printf "`cat << EOF
${BLUE}kd setup itypescript${NC}

EOF
`\n"
}
export -f setup_environment_kd_itypescript_help

setup_environment_kd_itypescript() (
  echo "Component[itypescript]:setup"
  cd $ITYPESCRIPT_BASE
  yarn install
)
export -f setup_environment_kd_itypescript
