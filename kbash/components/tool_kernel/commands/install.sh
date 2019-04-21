#!/bin/bash
# install kernel

print_help() {
printf "`cat << EOF
${BLUE}kd tool_kernel kernel install${NC}

Create install

EOF
`\n"
}

run() (
  kd_install_python_kernel tool_kernel $KKTOOL_BASE
)
