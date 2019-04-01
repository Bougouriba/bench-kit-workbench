#!/bin/bash
# abc

print_help() {
printf "`cat << EOF
${BLUE}kd tool clean${NC}

Erase virtual environments

EOF
`\n"
}

run() {
  rm -rf $KT_VENV_PATH
}
