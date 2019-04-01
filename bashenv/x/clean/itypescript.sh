#!/bin/bash
# yarn install and build of itypescript

print_help() {
printf "`cat << EOF
${BLUE}kd wb itypescript${NC}


EOF
`\n"
}

run() {
  rm -rf $ITYPESCRIPT_NODE_MODULES
}
