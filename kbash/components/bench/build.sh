#!/bin/bash
build_environment_kd_bench_help() {
printf "`cat << EOF
${BLUE}kd build bench${NC}

EOF
`\n"
}
export -f build_environment_kd_bench_help

build_environment_kd_bench() {
  activate_environment_kd_bench
  cd $BENCH_BASE
  yarn build
}
export -f build_environment_kd_bench
