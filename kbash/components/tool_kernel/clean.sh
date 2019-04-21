#!/bin/bash
clean_environment_kd_tool_kernel_help() {
  printf "`cat << EOF
${BLUE}kd clean tool_kernel${NC}

EOF
`\n"
}
export -f clean_environment_kd_tool_kernel_help

clean_environment_kd_tool_kernel() {
  rm -rf $KKTOOL_VENV
}
export -f clean_environment_kd_tool_kernel
