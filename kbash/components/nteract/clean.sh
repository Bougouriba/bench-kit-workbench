#!/bin/bash
clean_environment_kd_nteract_help() {
  printf "`cat << EOF
${BLUE}kd clean nteract${NC}

EOF
`\n"
}
export -f clean_environment_kd_nteract_help

clean_environment_kd_nteract() {
  cd $NTERACT_BASE
  yarn clean
}
export -f clean_environment_kd_nteract
