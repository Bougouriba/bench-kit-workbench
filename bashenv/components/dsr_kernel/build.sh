#!/bin/bash
build_environment_kd_dsr_kernel_help() {
printf "`cat << EOF
${BLUE}kd build dsr_kernel${NC}

EOF
`\n"
}
export -f build_environment_kd_dsr_kernel_help

build_environment_kd_dsr_kernel() {
  echo "Component[dsr_kernel]:build"
}
export -f build_environment_kd_dsr_kernel
