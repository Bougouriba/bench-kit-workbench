#!/bin/bash


export KKTOOL_BASE=$KITWB/tool_kernel
export KKTOOL_NODE_VERSION=
export KKTOOL_NODE_MODULES=$KKTOOL_BASE/node_modules

export KKTOOL_LERNA_PACKAGES=$KKTOOL_BASE/packages

export KKTOOL_PYTHON_VERSION=
export KKTOOL_VENV=$KKTOOL_BASE/venv

export KKTOOL_LOG=$KKTOOL_BASE/setup-logs

oneline_description_of_kd_tool_kernel() {
  echo "Description of tool_kernel"
}
export -f oneline_description_of_kd_tool_kernel

vet_environment_kd_tool_kernel() {
  check_basic_python_ability
}
export -f vet_environment_kd_tool_kernel

describe_environment_kd_tool_kernel_help() {
printf "`cat << EOF
${BLUE}kd describe tool_kernel${NC}

EOF
`\n"
}
export -f describe_environment_kd_tool_kernel_help

describe_environment_kd_tool_kernel() {
  report_heading "Tool_Kernel Build Environment"

  report_vars "Settings" \
      KKTOOL_BASE\
      KKTOOL_NODE_VERSION\
      KKTOOL_PYTHON_VERSION\
      KKTOOL_LOG

  report_python_env $KKTOOL_VENV

  #report_heading "KISIA-CLI Environments"

  true
}
export -f describe_environment_kd_tool_kernel
