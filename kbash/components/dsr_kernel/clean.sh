#!/bin/bash
clean_environment_kd_dsr_kernel_help() {
  printf "`cat << EOF
${BLUE}kd clean dsr_kernel${NC}

EOF
`\n"
}
export -f clean_environment_kd_dsr_kernel_help

clean_environment_kd_dsr_kernel() {
  echo "Component[dsr_kernel]:clean"
  rm -rf $DSR_NODE_MODULES
}
export -f clean_environment_kd_dsr_kernel
