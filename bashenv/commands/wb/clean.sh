#!/bin/bash
# abc

print_help() {
printf "`cat << EOF
${BLUE}kd wb clean${NC}

Erase virtual environments

EOF
`\n"
}

run() {
  rm -rf $KT_VENV_PATH
  rm -rf $KT_BASE_DIR/node_modules
}
