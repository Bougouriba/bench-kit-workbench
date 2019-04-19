#!/bin/bash

export KISIA_TS_BASE=$KXX/kernels/kisia_ts
export KISIA_TS_NODE_MODULES=$KISIA_TS_BASE/node_modules
export KISIA_TS_NODE_VERSION=v11.6.0

clean_environment_kisia_ts() {
  rm -rf $KISIA_TS_NODE_MODULES
}
clean_environment_kisia_ts_help() {
  echo rm -rf $KISIA_TS_NODE_MODULES
}
build_environment_kisia_ts() {
  cd $KISIA_TS_BASE && yarn tsc
}
build_environment_kisia_ts_help() {
printf "`cat << EOF
${BLUE}kd build kisia_ts${NC}

EOF
`\n"
}
setup_environment_kisia_ts() (
  cd $KISIA_TS_BASE && yarn install
)
setup_environment_kisia_ts_help() {
printf "`cat << EOF
${BLUE}kd setup kisia_ts${NC}

EOF
`\n"
}
describe_environment_kisia_ts() {
  report_vars "KISIA-Typescript Build Environment" KISIA_TS_BASE KISIA_TS_NODE_MODULES KISIA_TS_NODE_VERSION
  if [ -d "$KISIA_TS_NODE_MODULES" ]; then
    echo "... node_modules present"
  else
    echo "... node_modules does not exist"
  fi
}
activate_environment_kisia_ts() {
  echo "ITypeScript Environment Enabled"
  nvm use $KISIA_TS_NODE_VERSION
  export NODE_PATH=$KISIA_TS_NODE_MODULES
}
activate_environment_kisia_ts_help() {
printf "`cat << EOF
${BLUE}kd activate kisia_ts${NC}

EOF
`\n"
}
function vet_environment_kisia_ts() {
  check_basic_node_ability
}
