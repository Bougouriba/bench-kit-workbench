#!/bin/bash
# abc

print_help() {
printf "`cat << EOF
${BLUE}kd wb go${NC}

Run yarn install and yarn tsc in the itypescript
repository, then unlink, then link

EOF
`\n"
}

run() {
  rm -rf venv
  rm -rf node_modules
}
