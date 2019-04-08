#!/bin/bash

# KT for now - need to merge in gitworm, other

export KISIA_CLI_BASE=$KXX/tool
export KISIA_CLI_VENV=$KISIA_CLI_BASE/venv


clean_environment_tool() {
  rm -rf $KISIA_CLI_VENV
}
clean_environment_tool_help() {
  echo rm -rf $KISIA_CLI_VENV
}
build_environment_tool() {
  echo "build environment tool"
}
build_environment_tool_help() {
printf "`cat << EOF
${BLUE}kd build tool${NC}

EOF
`\n"
}
setup_environment_tool() (
  if create_python3_env $KISIA_CLI_VENV; then
    activate_environment_tool
	 cd $KISIA_CLI_BASE && pip install -r requirements.txt
  fi	
)
setup_environment_tool_help() {
printf "`cat << EOF
${BLUE}kd setup tool${NC}

EOF
`\n"
}
describe_environment_tool() {
  report_vars "KISIA-CLI Build Environment" KISIA_CLI_BASE KISIA_CLI_VENV
  if [ -d "$KISIA_CLI_VENV" ]; then
    echo "... venv present"
  else
    echo "... venv does not exist"
  fi
}
activate_environment_tool() {
  . $KISIA_CLI_VENV/bin/activate
  echo "KISIA-CLI Environment Activated"
}
activate_environment_tool_help() {
printf "`cat << EOF
${BLUE}kd activate tool${NC}

EOF
`\n"
}
function vet_environment_tool() {
  check_basic_python_ability
}
