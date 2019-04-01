#!/bin/bash
function oneline_help_kd_build() {
  echo "[C] Build [C] using [C] natural build system"
}
function help_kd_build() {
  printf "`cat << EOF
${BLUE}kd build <COMPONENT>${NC}

  Goal : ${YELLOW}$(oneline_help_kd_build)${NC}

This is going to try to match the
EOF
`\n"
}
function run_kd_build() {
  run_environment_func build $@
}
export -f run_kd_build oneline_help_kd_build
