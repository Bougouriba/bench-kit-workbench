#!/bin/bash
setup_environment_kd_credcom_kernel_help() {
printf "`cat << EOF
${BLUE}kd setup credcom_kernel${NC}

EOF
`\n"
}
export -f setup_environment_kd_credcom_kernel_help

setup_environment_kd_credcom_kernel() {
  echo "Component[credcom_kernel]:setup"
  cd $CREDCOM_BASE
  yarn install
}
export -f setup_environment_kd_credcom_kernel
