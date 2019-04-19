#!/bin/bash


export BENCH_BASE=$KITWB/bench
export BENCH_NODE_VERSION=
export BENCH_NODE_MODULES=$BENCH_BASE/node_modules

export BENCH_LERNA_PACKAGES=$BENCH_BASE/packages

export BENCH_PYTHON_VERSION=
export BENCH_VENV=$BENCH_BASE/venv

export BENCH_LOG=$BENCH_BASE/setup-logs

oneline_description_of_kd_bench() {
  echo "Description of bench"
}
export -f oneline_description_of_kd_bench

vet_environment_kd_bench() {
  echo "Component[bench]:vet"
}
export -f vet_environment_kd_bench

describe_environment_kd_bench_help() {
printf "`cat << EOF
${BLUE}kd describe bench${NC}

EOF
`\n"
}
export -f describe_environment_kd_bench_help

describe_environment_kd_bench() {
  echo "Component[bench]:describe"

  report_vars "bench Build Environment" \
      BENCH_BASE\
      BENCH_NODE_VERSION\
      BENCH_PYTHON_VERSION
}
export -f describe_environment_kd_bench
