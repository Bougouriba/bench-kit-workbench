#!/bin/bash
activate_environment_kd_bench_help() {
printf "`cat << EOF
${BLUE}kd activate bench${NC}

EOF
`\n"
}
export -f activate_environment_kd_bench_help

activate_environment_kd_bench() {
  activate_python_env $BENCH_VENV
  prepare_nvm_and_version $BENCH_NODE_VERSION
  export NODE_PATH=$BENCH_NODE_MODULES
}
export -f activate_environment_kd_bench
