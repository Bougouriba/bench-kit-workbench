#!/bin/bash
clean_environment_kd_credcom_kernel_help() {
  printf "`cat << EOF
${BLUE}kd clean credcom_kernel${NC}

EOF
`\n"
}
export -f clean_environment_kd_credcom_kernel_help

clean_environment_kd_credcom_kernel() {
  echo "Component[credcom_kernel]:clean"
  rm -rf $CREDCOM_NODE_MODULES
}
export -f clean_environment_kd_credcom_kernel
