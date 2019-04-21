#!/bin/bash
build_environment_kd_credcom_kernel_help() {
printf "`cat << EOF
${BLUE}kd build credcom_kernel${NC}

EOF
`\n"
}
export -f build_environment_kd_credcom_kernel_help

build_environment_kd_credcom_kernel() {
  echo "Component[credcom_kernel]:build"
}
export -f build_environment_kd_credcom_kernel
