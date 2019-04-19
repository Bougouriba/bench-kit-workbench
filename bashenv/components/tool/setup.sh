#!/bin/bash
setup_environment_kd_tool_help() {
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
export -f setup_environment_kd_tool_help


setup_environment_kd_tool() (
  default_python_setup $KISIA_CLI_BASE
)
export -f setup_environment_kd_tool
