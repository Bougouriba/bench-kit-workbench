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
  rm -rf $KK_VENV_PATH
}
