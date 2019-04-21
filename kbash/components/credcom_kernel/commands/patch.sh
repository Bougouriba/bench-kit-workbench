#!/bin/bash
# install kernel

print_help() {
printf "`cat << EOF
${BLUE}kd credcom_kernel kernel package${NC}

Create Package

EOF
`\n"
}

run() (
  kd_patch_node_kernel credcom_kernel $CREDCOM_BASE
)
