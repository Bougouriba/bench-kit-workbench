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
  rm -rf $KWB_VENV_PATH
  rm -rf $KWB_BASE_DIR/node_modules
}
