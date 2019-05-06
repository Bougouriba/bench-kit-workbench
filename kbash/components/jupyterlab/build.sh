#!/bin/bash
build_environment_kd_jupyterlab_help() {
printf "`cat << EOF
${BLUE}kd build jupyterlab${NC}

EOF
`\n"
}
export -f build_environment_kd_jupyterlab_help

build_environment_kd_jupyterlab() {
  echo "Component[jupyterlab]:build"
}
export -f build_environment_kd_jupyterlab
