#!/bin/bash
activate_environment_kd_nteract_help() {
printf "`cat << EOF
${BLUE}kd activate nteract${NC}

EOF
`\n"
}
export -f activate_environment_kd_nteract_help

activate_environment_kd_nteract() {
  echo "Component[nteract]:activate"
  prepare_nvm_and_version $NTERACT_NODE_VERSION
  export NODE_PATH=$NTERACT_NODE_MODULES
  export JUPYTER_PATH=$KITWB/installed-kernels
}
export -f activate_environment_kd_nteract
