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

  local DIST=$KITWB_INSTALLED_KERNEL_DIR/$1

  echo "Looking in $DIST/kernel.json"
  cat $DIST/kernel.json
)
