#!/bin/bash
function oneline_help_kd_activate() {
  echo "manage Tool Environment Variables"
}

function help_kd_activate() {
printf "`cat << EOF
${BLUE}kd activate [SUBCOMMAND] ...${NC}

activate one of the development contexts
EOF
`\n\n"

}

export KITWB_ACTIVE_DEVENV=

function activate_devenv() {
	KITWB_ACTIVE_DEVENV=$1
}

function run_kd_activate() {
  if [ "" = "$1" ]; then
    help_kd_activate
  else
    subcmd=run_kd_activate_$(slugify $1)
    shift 1
    $subcmd "$@"
  fi
}
export -f run_kd_activate help_kd_activate oneline_help_kd_activate
