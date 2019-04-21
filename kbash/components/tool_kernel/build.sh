#!/bin/bash
build_environment_kd_tool_kernel_help() {
printf "`cat << EOF
${BLUE}kd build tool_kernel${NC}

EOF
`\n"
}
export -f build_environment_kd_tool_kernel_help

build_environment_kd_tool_kernel() {
  echo "Component[tool_kernel]:build"
}
export -f build_environment_kd_tool_kernel
