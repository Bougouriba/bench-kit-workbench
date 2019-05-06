#!/bin/bash
setup_environment_kd_bench_help() {
printf "`cat << EOF
${BLUE}kd setup bench${NC}

EOF
`\n"
}
export -f setup_environment_kd_bench_help

setup_environment_kd_bench() {


  prepare_nvm_and_version $BENCH_NODE_VERSION
  export NODE_PATH=$BENCH_NODE_MODULES
  cd $BENCH_BASE
  npm install
  # if this is not done, then python environment activation will throw away
  # the PATH adjustment in BENCH_NODE_VERSION
  unset _OLD_VIRTUAL_PATH
  default_python_setup $BENCH_BASE

  # make python availabe for dev mode
  if is_osx; then
    VENV_LINK=$BENCH_BASE/node_modules/electron/dist/Electron.app/Contents/Resources/venv
  fi

  rm -f $VENV_LINK
  ln -s $BENCH_VENV $VENV_LINK
}
export -f setup_environment_kd_bench
