#!/bin/bash

export RWOT_JS_BASE=$KXX/kernels/rwot_js
export RWOT_JS_NODE_MODULES=$RWOT_JS_BASE/node_modules
export RWOT_JS_NODE_VERSION=v11.6.0

clean_environment_rwot_js() {
  rm -rf $RWOT_JS_NODE_MODULES
}
clean_environment_rwot_js_help() {
  echo rm -rf $RWOT_JS_NODE_MODULES
}
build_environment_rwot_js() {
  cd $RWOT_JS_BASE && yarn tsc
}
build_environment_rwot_js_help() {
printf "`cat << EOF
${BLUE}kd build rwot_js${NC}

EOF
`\n"
}
setup_environment_rwot_js() (
  cd $RWOT_JS_BASE && yarn install
)
setup_environment_rwot_js_help() {
printf "`cat << EOF
${BLUE}kd setup rwot_js${NC}

EOF
`\n"
}
describe_environment_rwot_js() {
  report_vars "RWOT-Javascript Build Environment" RWOT_JS_BASE RWOT_JS_NODE_MODULES RWOT_JS_NODE_VERSION
  if [ -d "$RWOT_JS_NODE_MODULES" ]; then
    echo "... node_modules present"
  else
    echo "... node_modules does not exist"
  fi
}
activate_environment_rwot_js() {
  echo "ITypeScript Environment Enabled"
  nvm use $RWOT_JS_NODE_VERSION
  export NODE_PATH=$RWOT_JS_NODE_MODULES
}
activate_environment_rwot_js_help() {
printf "`cat << EOF
${BLUE}kd activate rwot_js${NC}

EOF
`\n"
}
function vet_environment_rwot_js() {
  check_basic_node_ability
}
