#!/bin/bash


export BENCH_BASE=$KITWB/bench
export BENCH_NODE_VERSION=v11.6.0
export BENCH_NODE_MODULES=$BENCH_BASE/node_modules

export BENCH_LERNA_PACKAGES=$BENCH_BASE/packages

export BENCH_PYTHON_VERSION=3.6.2
export BENCH_VENV=$BENCH_BASE/venv

export BENCH_LOG=$BENCH_BASE/setup-logs

oneline_description_of_kd_bench() {
  echo "Identity Tech Workbench - powered by JupyterLab"
}
export -f oneline_description_of_kd_bench


describe_environment_kd_bench_help() {
printf "`cat << EOF
The KIT-Workbench provides a set of features for people involved in developing
identity-tech.

EOF
`\n"
}
export -f describe_environment_kd_bench_help

describe_environment_kd_bench() {
  report_heading "Workbench Build Environment"

  report_vars "Settings" \
      BENCH_BASE\
      BENCH_VENV\
      BENCH_PYTHON_VERSION

  report_python_env $BENCH_VENV
  true
}
export -f describe_environment_kd_bench

vet_environment_kd_bench() {
  check_basic_python_ability && check_basic_node_ability
}
export -f vet_environment_kd_bench
