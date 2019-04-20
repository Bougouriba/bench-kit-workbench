#!/bin/bash
setup_environment_kd_bench_help() {
printf "`cat << EOF
${BLUE}kd setup bench${NC}

EOF
`\n"
}
export -f setup_environment_kd_bench_help

setup_environment_kd_bench() {
  echo "Component[bench]:setup"
  default_python_setup $KISIA_CLI_BASE
}
export -f setup_environment_kd_bench
