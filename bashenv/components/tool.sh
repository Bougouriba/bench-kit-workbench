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
	  cd $KISIA_CLI_BASE
    local SETUP_LOG=.kd-setup/tool
    rm -rf $SETUP_LOG
    mkdir -p $SETUP_LOG
    date > $SETUP_LOG/start-timestamp.txt
    echo "Starting installation, trace is in $SETUP_LOG"
    pip install . > $SETUP_LOG/main.txt
    echo "Installing development requirements"
    pip install -e .[dev] > $SETUP_LOG/dev.txt
    echo "Installing local pacakge and ../gitworm/python for edit "
    pip install -r local-requirements.txt > $SETUP_LOG/local.txt
    date > $SETUP_LOG/end-timestamp.txt
    echo "Python env configuration complete"
  fi
)
setup_environment_tool_help() {
printf "`cat << EOF
${BLUE}kd setup tool${NC}

- Activates the python environment at $KISIA_CLI_VENV
- installs project and install_requires section of setup.py
- installs 'extras_require.dev' section of setup.py

Results in $SETUP_LOG

Here is the code
$(declare -f setup_environment_tool)
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
  echo "PYTHON=$(command -v python)"
  echo "TOOL (optional) = $(command -v tool)"
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
