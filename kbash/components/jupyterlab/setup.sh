#!/bin/bash
setup_environment_kd_jupyterlab_help() {
printf "`cat << EOF
${BLUE}kd setup jupyterlab${NC}

EOF
`\n"
}
export -f setup_environment_kd_jupyterlab_help

setup_environment_kd_jupyterlab() {
  echo "Component[jupyterlab]:setup"
  default_python_setup $JLAB_BASE
  #default_node_setup $JLAB_BASE
  #activate_environment_kd_JLAB
  prepare_nvm_and_version $JLAB_NODE_VERSION
  export NODE_PATH=$JLAB_NODE_MODULES
  cd $JLAB_BASE
  lerna bootstrap
}
export -f setup_environment_kd_jupyterlab
