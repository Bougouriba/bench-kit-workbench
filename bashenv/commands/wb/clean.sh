#!/bin/bash
# Remove virtualenv & node modules

print_help() {
printf "`cat << EOF
${BLUE}kd wb clean${NC}

Erase virtual environment containers
   - rm -rf $KWB_VENV_PATH
   - rm -rf $KWB_BASE_DIR/node_modules

EOF
`\n"
}

run() {
  rm -rf $KWB_VENV_PATH
  rm -rf $KWB_BASE_DIR/node_modules
}
