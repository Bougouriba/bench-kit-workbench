#!/bin/bash
setup_environment_kd_tool_kernel_help() {
printf "`cat << EOF
${BLUE}kd setup tool_kernel${NC}

EOF
`\n"
}
export -f setup_environment_kd_tool_kernel_help

setup_environment_kd_tool_kernel() {
  default_python_setup $KKTOOL_BASE
}
export -f setup_environment_kd_tool_kernel
