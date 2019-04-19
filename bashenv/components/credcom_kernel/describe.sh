#!/bin/bash


export CREDCOM_BASE=$KITWB/credcom_kernel
export CREDCOM_NODE_VERSION=v11.6.0
export CREDCOM_NODE_MODULES=$CREDCOM_BASE/node_modules

export CREDCOM_LERNA_PACKAGES=$CREDCOM_BASE/packages

export CREDCOM_PYTHON_VERSION=
export CREDCOM_VENV=$CREDCOM_BASE/venv

export CREDCOM_LOG=$CREDCOM_BASE/setup-logs

oneline_description_of_kd_credcom_kernel() {
  echo "Description of credcom_kernel"
}
export -f oneline_description_of_kd_credcom_kernel

vet_environment_kd_credcom_kernel() {
  echo "Component[credcom_kernel]:vet"
}
export -f vet_environment_kd_credcom_kernel

describe_environment_kd_credcom_kernel_help() {
printf "`cat << EOF
${BLUE}kd describe credcom_kernel${NC}

EOF
`\n"
}
export -f describe_environment_kd_credcom_kernel_help

describe_environment_kd_credcom_kernel() {
  echo "Component[credcom_kernel]:describe"

  report_heading "CREDCOM Library"

  report_vars "Settings" \
      CREDCOM_BASE\
      CREDCOM_NODE_MODULES\
      CREDCOM_NODE_VERSION

  report_node_env $CREDCOM_BASE
}
export -f describe_environment_kd_credcom_kernel
