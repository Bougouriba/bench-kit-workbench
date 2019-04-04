#!/bin/bash
# clean and setup environment

print_help() {
printf "`cat << EOF
${BLUE}kd kk reset${NC}

Run yarn install and yarn tsc in the itypescript
repository, then unlink, then link

EOF
`\n"
}

run() {
  kd kk clean
  kd kk setup
}
