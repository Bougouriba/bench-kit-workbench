#!/bin/bash
activate_environment_kd_jupyterlab_help() {
printf "`cat << EOF
${BLUE}kd activate jupyterlab${NC}

EOF
`\n"
}
export -f activate_environment_kd_jupyterlab_help

activate_environment_kd_jupyterlab() {
  echo "Component[jupyterlab]:activate"
  activate_python_env $JLAB_VENV
  prepare_nvm_and_version $JLAB_NODE_VERSION
}
export -f activate_environment_kd_jupyterlab
