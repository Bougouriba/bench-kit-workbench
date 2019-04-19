#!/bin/bash

export NTERACT_BASE=$KITWB/nteract
export NTERACT_NODE_VERSION=v11.6.0
export NTERACT_NODE_MODULES=$NTERACT_BASE/node_modules

export NTERACT_LERNA_PACKAGES=$NTERACT_BASE/packages

export NTERACT_PYTHON_VERSION=
export NTERACT_VENV=$NTERACT_BASE/venv

export NTERACT_LOG=$NTERACT_BASE/setup-logs

oneline_description_of_kd_nteract() {
  echo "Description of nteract"
}
export -f oneline_description_of_kd_nteract

vet_environment_kd_nteract() {
  check_basic_node_ability
}
export -f vet_environment_kd_nteract

describe_environment_kd_nteract_help() {
printf "`cat << EOF
${BLUE}kd describe nteract${NC}

EOF
`\n"
}
export -f describe_environment_kd_nteract_help

describe_environment_kd_nteract() {
  report_heading "nteract Library"

  report_vars "Settings" \
      NTERACT_BASE\
      NTERACT_NODE_MODULES\
      NTERACT_NODE_VERSION

  report_node_env $NTERACT_BASE
}
export -f describe_environment_kd_nteract
