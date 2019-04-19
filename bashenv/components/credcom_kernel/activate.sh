#!/bin/bash
activate_environment_kd_credcom_kernel_help() {
printf "`cat << EOF
${BLUE}kd activate credcom_kernel${NC}

EOF
`\n"
}
export -f activate_environment_kd_credcom_kernel_help

activate_environment_kd_credcom_kernel() {
  echo "Component[credcom_kernel]:activate"
  prepare_nvm_and_version $CREDCOM_NODE_VERSION
  export NODE_PATH=$CREDCOM_NODE_MODULES
}
export -f activate_environment_kd_credcom_kernel
