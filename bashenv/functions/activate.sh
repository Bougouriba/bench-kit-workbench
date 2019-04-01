#!/bin/bash
function oneline_help_kd_activate() {
  echo "Configure shell to match build for [C]"
}

function help_kd_activate() {
  printf "`cat << EOF
${BLUE}kd activate <COMPONENT>${NC}

  Goal : ${YELLOW}$(oneline_help_kd_activate)${NC}

More Text Here
EOF
`\n"
}

export KITWB_ACTIVE_DEVENV=

function run_kd_activate() {
  run_environment_func activate $@
  export KITWB_ACTIVE_DEVENV=$(slugify $1)
}
export -f run_kd_activate oneline_help_kd_activate
