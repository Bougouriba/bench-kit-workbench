#!/bin/bash
activate_environment_kd_tool_help() {
printf "`cat << EOF
${BLUE}kd activate tool${NC}

EOF
`\n"
}
export -f activate_environment_kd_tool_help

activate_environment_kd_tool() {
  activate_python_env $KISIA_CLI_VENV
}
export -f activate_environment_kd_tool
