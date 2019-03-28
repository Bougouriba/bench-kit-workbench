#!/bin/bash
# get rid of python virtual environment

print_help() {
printf "`cat << EOF
${BLUE}kd rwot_js clean${NC}

Erase Kisia Kernel python virtual environment at $RWOT_JS_VENV_PATH

EOF
`\n"
}

run() {
  rm -rf $RWOT_JS_VENV_PATH
}
