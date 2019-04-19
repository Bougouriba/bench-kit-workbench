#!/bin/bash
# KT for now - need to merge in gitworm, other

export KISIA_CLI_KERNEL_BASE=$KXX/kernels/kisia_cli
export KISIA_CLI_KERNEL_VENV=$KISIA_CLI_KERNEL_BASE/venv


clean_environment_kisia_cli() {
  rm -rf $KISIA_CLI_KERNEL_VENV
}
clean_environment_kisia_cli_help() {
  echo rm -rf $KISIA_CLI_KERNEL_VENV
}
build_environment_kisia_cli() {
  cd $KISIA_CLI_KERNEL_BASE && yarn tsc
}
build_environment_kisia_cli_help() {
printf "`cat << EOF
${BLUE}kd build kisia_cli${NC}

EOF
`\n"
}
setup_environment_kisia_cli() (
  if create_python3_env $KISIA_CLI_KERNEL_VENV; then
    activate_environment_kisia_cli
	 cd $KISIA_CLI_KERNEL_BASE && pip install -r requirements.txt
  fi	
)
setup_environment_kisia_cli_help() {
printf "`cat << EOF
${BLUE}kd setup kisia_cli${NC}

EOF
`\n"
}
describe_environment_kisia_cli() {
  report_vars "KISIA-CLI Build Environment" KISIA_CLI_KERNEL_BASE KISIA_CLI_KERNEL_VENV
  if [ -d "$KISIA_CLI_KERNEL_VENV" ]; then
    echo "... venv present"
  else
    echo "... venv does not exist"
  fi
}
activate_environment_kisia_cli() {
  . $KISIA_CLI_KERNEL_VENV/bin/activate
  echo "KISIA-CLI Environment Activated"
}
activate_environment_kisia_cli_help() {
printf "`cat << EOF
${BLUE}kd activate kisia_cli${NC}

EOF
`\n"
}
function vet_environment_kisia_cli() {
  check_basic_python_ability
}
