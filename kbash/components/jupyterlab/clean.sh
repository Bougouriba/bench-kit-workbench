#!/bin/bash
clean_environment_kd_jupyterlab_help() {
  printf "`cat << EOF
${BLUE}kd clean jupyterlab${NC}

EOF
`\n"
}
export -f clean_environment_kd_jupyterlab_help

clean_environment_kd_jupyterlab() {
  rm -rf JLAB_VENV
  rm -rf JLAB_NODE_MODULES
}
export -f clean_environment_kd_jupyterlab
