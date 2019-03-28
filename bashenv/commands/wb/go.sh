#!/bin/bash
# rebuild and run local electron app

print_help() {
printf "`cat << EOF
${BLUE}kd wb go${NC}

Run yarn install and yarn tsc in the itypescript
repository, then unlink, then link

EOF
`\n"
}

run() {
  cd $KT_BASE_DIR
  $KT_YARN build
  kd wb kernels
  electron .
}
