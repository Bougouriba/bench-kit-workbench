#!/bin/bash
# install kernel

print_help() {
printf "`cat << EOF
${BLUE}kd credcom_kernel kernel install${NC}

Create install

EOF
`\n"
}

run() (
  kd nteract start $CREDCOM_BASE/spec/Introduction.ipynb
)
