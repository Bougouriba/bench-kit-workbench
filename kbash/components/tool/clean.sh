#!/bin/bash
clean_environment_kd_tool_help() {
printf "`cat << EOF
${BLUE}kd clean tool${NC}

  rm -rf $KISIA_CLI_VENV
EOF
`\n"
}
export -f clean_environment_kd_tool_help

clean_environment_kd_tool() {
  rm -rf $KISIA_CLI_VENV
}
export -f clean_environment_kd_tool
