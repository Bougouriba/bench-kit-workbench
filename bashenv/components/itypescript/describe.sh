#!/bin/bash

export ITYPESCRIPT_BASE=$KITWB/itypescript
export ITYPESCRIPT_NODE_VERSION=v11.6.0
export ITYPESCRIPT_NODE_MODULES=$ITYPESCRIPT_BASE/node_modules

export ITYPESCRIPT_LERNA_PACKAGES=$ITYPESCRIPT_BASE/packages

export ITYPESCRIPT_PYTHON_VERSION=
export ITYPESCRIPT_VENV=$ITYPESCRIPT_BASE/venv

export ITYPESCRIPT_LOG=$ITYPESCRIPT_BASE/setup-logs

oneline_description_of_kd_itypescript() {
  echo "Description of itypescript"
}
export -f oneline_description_of_kd_itypescript

vet_environment_kd_itypescript() {
  check_basic_node_ability
}
export -f vet_environment_kd_itypescript

describe_environment_kd_itypescript_help() {
printf "`cat << EOF
${BLUE}kd describe itypescript${NC}

EOF
`\n"
}
export -f describe_environment_kd_itypescript_help

describe_environment_kd_itypescript() {
  report_heading "ITypescript Library"

  report_vars "Settings" \
      ITYPESCRIPT_BASE\
      ITYPESCRIPT_NODE_MODULES\
      ITYPESCRIPT_NODE_VERSION

  report_node_env $ITYPESCRIPT_BASE
}
export -f describe_environment_kd_itypescript
