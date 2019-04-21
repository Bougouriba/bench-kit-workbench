#!/bin/bash
setup_environment_kd_dsr_kernel_help() {
printf "`cat << EOF
${BLUE}kd setup dsr_kernel${NC}

EOF
`\n"
}
export -f setup_environment_kd_dsr_kernel_help

setup_environment_kd_dsr_kernel() {
  echo "Component[dsr_kernel]:setup"
  cd $DSR_BASE
  yarn install
}
export -f setup_environment_kd_dsr_kernel
