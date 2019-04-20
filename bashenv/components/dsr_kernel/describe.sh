#!/bin/bash


export DSR_BASE=$KITWB/dsr_kernel
export DSR_NODE_VERSION=v11.6.0
export DSR_NODE_MODULES=$DSR_BASE/node_modules

export DSR_LERNA_PACKAGES=$DSR_BASE/packages

export DSR_PYTHON_VERSION=
export DSR_VENV=$DSR_BASE/venv

export DSR_LOG=$DSR_BASE/setup-logs

oneline_description_of_kd_dsr_kernel() {
  echo "Description of dsr_kernel"
}
export -f oneline_description_of_kd_dsr_kernel

vet_environment_kd_dsr_kernel() {
  echo "Component[dsr_kernel]:vet"
}
export -f vet_environment_kd_dsr_kernel

describe_environment_kd_dsr_kernel_help() {
printf "`cat << EOF
${BLUE}kd describe dsr_kernel${NC}

EOF
`\n"
}
export -f describe_environment_kd_dsr_kernel_help

describe_environment_kd_dsr_kernel() {
  echo "Component[dsr_kernel]:describe"

  report_heading "DSR Library"

  report_vars "Settings" \
      DSR_BASE\
      DSR_NODE_MODULES\
      DSR_NODE_VERSION

  report_node_env $DSR_BASE
}
export -f describe_environment_kd_dsr_kernel
