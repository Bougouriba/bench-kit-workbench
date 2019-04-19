#!/bin/bash
clean_environment_kd_itypescript_help() {
  printf "`cat << EOF
${BLUE}kd clean itypescript${NC}

EOF
`\n"
}
export -f clean_environment_kd_itypescript_help

clean_environment_kd_itypescript() {
  rm -rf $ITYPESCRIPT_NODE_MODULES
}
export -f clean_environment_kd_itypescript
