#!/bin/bash
# report KIT-Workbench environment

print_help() {
printf "`cat << EOF
${BLUE}kd env${NC}


EOF
`\n"
}

run() (
  report_heading "KIT-Workbench Environment"

  run_kd_kbash_env

  printf "Talk about Kernels...."

)
