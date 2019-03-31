#!/bin/bash
# rebuild and run local electron app

print_help() {
printf "`cat << EOF
${BLUE}kd wb go${NC}

Build and Run

EOF
`\n"
}

run() {
  kd build workbench
  kd wb run
}
