#!/bin/bash
clean_environment_kd_bench_help() {
  printf "`cat << EOF
${BLUE}kd clean bench${NC}

EOF
`\n"
}
export -f clean_environment_kd_bench_help

clean_environment_kd_bench() {
  echo "Component[bench]:clean"
  rm -rf $BENCH_VENV
}
export -f clean_environment_kd_bench
