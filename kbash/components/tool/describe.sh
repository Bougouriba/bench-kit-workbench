#!/bin/bash

export KISIA_CLI_BASE=$KITWB/tool
export KISIA_CLI_VENV=$KISIA_CLI_BASE/venv
export KISIA_CLI_SETUP_LOG=$KISIA_CLI_BASE/setup-logs

oneline_description_of_kd_tool() {
  echo "Python CLI"
}

describe_environment_kd_tool_help() {
printf "`cat << EOF
${BLUE}kd build tool${NC}

EOF
`\n"
}
export -f describe_environment_kd_tool_help

describe_environment_kd_tool() {
  report_heading "KISIA-CLI Build Environment"

  report_vars "Settings" \
      KISIA_CLI_BASE \
      KISIA_CLI_VENV \
      KISIA_CLI_SETUP_LOG

  report_python_env $KISIA_CLI_VENV

  report_heading "KISIA-CLI Runtime Environment"
  echo "  TOOL (optional) = $(command -v tool)"
  true
}
export -f describe_environment_kd_tool

vet_environment_kd_tool() {
  check_basic_python_ability
}
export -f vet_environment_kd_tool
