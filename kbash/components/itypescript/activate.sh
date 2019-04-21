#!/bin/bash
activate_environment_kd_itypescript_help() {
printf "`cat << EOF
${BLUE}kd activate itypescript${NC}

EOF
`\n"
}
export -f activate_environment_kd_itypescript_help

activate_environment_kd_itypescript() {
  echo "Component[itypescript]:activate"
  prepare_nvm_and_version $ITYPESCRIPT_NODE_VERSION
  export NODE_PATH=$ITYPESCRIPT_NODE_MODULES
}
export -f activate_environment_kd_itypescript
