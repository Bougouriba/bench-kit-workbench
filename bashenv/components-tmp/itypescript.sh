#!/bin/bash

export ITYPESCRIPT_BASE=$KXX/itypescript
export ITYPESCRIPT_NODE_MODULES=$ITYPESCRIPT_BASE/node_modules
export ITYPESCRIPT_NODE_VERSION=v11.6.0

clean_environment_itypescript() {
  rm -rf $ITYPESCRIPT_NODE_MODULES
}
clean_environment_itypescript_help() {
  echo rm -rf $ITYPESCRIPT_NODE_MODULES
}
build_environment_itypescript() {
  cd $ITYPESCRIPT_BASE && yarn tsc
}
build_environment_itypescript_help() {
printf "`cat << EOF
${BLUE}kd build itypescript${NC}

EOF
`\n"
}
setup_environment_itypescript() {
  cd $ITYPESCRIPT_BASE && yarn install
}
setup_environment_itypescript_help() {
printf "`cat << EOF
${BLUE}kd setup itypescript${NC}

EOF
`\n"
}
describe_environment_itypescript() {
  report_vars "ITypescript Build Environment" ITYPESCRIPT_BASE ITYPESCRIPT_NODE_MODULES ITYPESCRIPT_NODE_VERSION
  if [ -d "$ITYPESCRIPT_NODE_MODULES" ]; then
    echo "... node_modules present"
  else
    echo "... node_modules does not exist"
  fi
}
activate_environment_itypescript() {
  echo "ITypeScript Environment Enabled"
  nvm use $ITYPESCRIPT_NODE_VERSION
  export NODE_PATH=$ITYPESCRIPT_NODE_MODULES
}
activate_environment_itypescript_help() {
printf "`cat << EOF
${BLUE}kd activate itypescript${NC}

EOF
`\n"
}
function vet_environment_itypescript() {
  check_basic_node_ability
}
