#!/bin/bash
# REVISIT

print_help() {
printf "`cat << EOF
${BLUE}kd tool reset${NC}

Run yarn install and yarn tsc in the itypescript
repository, then unlink, then link

EOF
`\n"
}

run() {
  kd tool clean
  kd tool setup
}
