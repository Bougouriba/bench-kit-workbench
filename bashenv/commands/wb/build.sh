#!/bin/bash
# rebuild and run local electron app

print_help() {
printf "`cat << EOF
${BLUE}kd wb build${NC}


EOF
`\n"
}

run() {
  require_active_environment

  local KWB_DEVENV_VENV=$KWB_BASE_DIR/node_modules/electron/dist/resources/venv
  cd $KWB_BASE_DIR
  $KWB_YARN build
  # copy kernels into local venv
  kd wb kernels

  # link electron venv
  rm -rf $KWB_DEVENV_VENV
  ln -s $KWB_BASE_DIR/venv $KWB_DEVENV_VENV
}
