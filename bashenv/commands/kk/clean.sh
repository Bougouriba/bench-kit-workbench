#!/bin/bash
# get rid of python virtual environment

print_help() {
printf "`cat << EOF
${BLUE}kd tool clean${NC}

Erase Kisia Kernel python virtual environment at $KK_VENV_PATH

EOF
`\n"
}

run() {
  rm -rf $KK_VENV_PATH
}
