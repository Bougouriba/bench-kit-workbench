#!/bin/bash


function oneline_help_kd_parallel() {
  echo "Control how many jobs run in parallel."
}

function help_kd_parallel() {
printf "`cat << EOF
${BLUE}kd parallel [VALUE]${NC}

Control how many jobs run in parallel

EOF
`\n"
}

function run_kd_parallel() {
  local NEWVAL=$(slugify $1)
  if help_on_empty_or_help parallel "$NEWVAL"; then
    KXX_MAX_PARALLEL=$NEWVAL
  fi
}
