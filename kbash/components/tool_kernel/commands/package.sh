#!/bin/bash
# create package in $KKTOOL_BASE/dist

print_help() {
printf "`cat << EOF
${BLUE}kd tool_kernel kernel package${NC}

Create Package

EOF
`\n"
}

run() (
  kd_package_python_kernel tool_kernel $KKTOOL_BASE
)
