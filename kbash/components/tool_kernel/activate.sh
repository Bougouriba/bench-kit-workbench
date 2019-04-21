#!/bin/bash
activate_environment_kd_tool_kernel_help() {
printf "`cat << EOF
${BLUE}kd activate tool_kernel${NC}

EOF
`\n"
}
export -f activate_environment_kd_tool_kernel_help

activate_environment_kd_tool_kernel() {
  activate_python_env $KKTOOL_VENV
}
export -f activate_environment_kd_tool_kernel
