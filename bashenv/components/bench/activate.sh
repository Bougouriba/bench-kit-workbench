#!/bin/bash
activate_environment_kd_bench_help() {
printf "`cat << EOF
${BLUE}kd activate bench${NC}

EOF
`\n"
}
export -f activate_environment_kd_bench_help

activate_environment_kd_bench() {
  echo "Component[bench]:activate"
}
export -f activate_environment_kd_bench
