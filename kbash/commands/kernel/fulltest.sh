#!/bin/bash
# install kernel

print_help() {
printf "`cat << EOF
${BLUE}kd kernel install${NC}

Info about kd kernel install

EOF
`\n"
}

run() (
  local KERNEL=$1

  kd $KERNEL package
  kd $KERNEL install
  kd kernel spec $KERNEL
  kd $KERNEL launch

)
