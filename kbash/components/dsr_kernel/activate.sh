#!/bin/bash
activate_environment_kd_dsr_kernel_help() {
printf "`cat << EOF
${BLUE}kd activate dsr_kernel${NC}

EOF
`\n"
}
export -f activate_environment_kd_dsr_kernel_help

activate_environment_kd_dsr_kernel() {
  echo "Component[dsr_kernel]:activate"
  prepare_nvm_and_version $DSR_NODE_VERSION
  export NODE_PATH=$DSR_NODE_MODULES
}
export -f activate_environment_kd_dsr_kernel
