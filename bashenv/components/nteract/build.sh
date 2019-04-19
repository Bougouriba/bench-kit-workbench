#!/bin/bash
build_environment_kd_nteract_help() {
printf "`cat << EOF
${BLUE}kd build nteract${NC}

EOF
`\n"
}
export -f build_environment_kd_nteract_help

build_environment_kd_nteract() {
  echo "Component[nteract]:build"
  activate_environment_kd_nteract
  cd $NTERACT_BASE
  yarn app:desktop
}
export -f build_environment_kd_nteract
