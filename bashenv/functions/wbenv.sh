#!/bin/bash
function oneline_help_kd_wbenv() {
  echo "manage Workbench Environment Variables"
}

function help_kd_wbenv() {
printf "`cat << EOF
${BLUE}kd wbenv [SUBCOMMAND] ...${NC}

EOF
`\n\n"

print_kidlist_help wbenv
}

function run_kd_wbenv() {
  subcmd=run_kd_wbenv_$(slugify $1)
  shift 1
  $subcmd "$@"
#  run_kd_wbenv_$2
}
export -f run_kd_wbenv help_kd_wbenv oneline_help_kd_wbenv
