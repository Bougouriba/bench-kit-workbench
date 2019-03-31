#!/bin/bash

export KWB_BASE_DIR=$KXX/workbench
export KWB_NODE_PATH=$KWB_BASE_DIR/node_modules
export KWB_VENV_PATH=$KWB_BASE_DIR/venv
export KWB_BIN_DIR=$KWB_NODE_PATH/.bin
export KWB_YARN=$(command -v yarn)
export KWB_NODE_VERSION=v11.6.0








clean_environment_workbench() {
  rm -rf $KWB_VENV_PATH
  rm -rf $KWB_NODE_PATH
}
clean_environment_workbench_help() {
  printf "`cat << EOF
${BLUE}kd build phosphor${NC}

EOF
`\n"
}


build_environment_workbench() (
  cd $KWB_BASE_DIR && yarn build
)
build_environment_workbench_help() {
printf "`cat << EOF
${BLUE}kd build phosphor${NC}

EOF
`\n"
}


setup_environment_workbench() (
	# abort if venv is already present
	if ! create_python3_env $KWB_VENV_PATH; then
		echo "Failed to create python environment"
	fi
	echo "Activating Python3 Environments"
	. $KWB_VENV_PATH/bin/activate
  cd $KWB_BASE_DIR
	pip install -r $KWB_BASE_DIR/requirements.txt > /dev/null
	kd wb kernels

  prepare_nvm_and_version $KWB_NODE_VERSION
  cd $KWB_BASE_DIR
  npm install -g yarn
  link_phosphor $KWB_BASE_DIR
  link_jupyterlab $KWB_BASE_DIR
  if ! yarn install; then
    echo "Yarn install failed, trying to fix this"
    false
  fi
  local DEVPATH = node_modules/electron/dist/Electron.app/Contents/Resources/venv
  rm -rf $DEVPATH
  ln -s $KWB_VENV_DIR $DEVPATH

  true
)
setup_environment_workbench_help() {
printf "`cat << EOF
${BLUE}kd setup phosphor${NC}

EOF
`\n"
}


describe_environment_workbench() {
  report_vars "Workbench" KWB_BASE_DIR KWB_NODE_MODULES_DIR KWB_BIN_DIR KWB_YARN KWB_NODE_VERSION KWB_VENV_PATH
  if [ -d $KWB_VENV_PATH ]; then
    echo "... venv present"
  else
    echo "... venv does not exist"
  fi
  if [ -d $KWB_NODE_PATH ]; then
    echo "... node_modules present"
  else
    echo "... node_modules does not exist"
  fi
  echo "YARN   ",$(command -v yarn)
  echo "NODE   ",$(command -v node)
  echo "PYTHON ",$(command -v python)
}
describe_environment_workbench_help() {
printf "`cat << EOF
${BLUE}kd activate phosphor${NC}

EOF
`\n"
}



activate_environment_workbench() {
  if [ ! -d "$KWB_VENV_PATH" ]; then
    echo "Missing Python VENV"
	else
    if [ ! -d "$KWB_NODE_PATH" ]; then
       echo "Missing Node Modules"
  	else
      export PATH=$ORIGINAL_PATH
      . $KWB_VENV_PATH/bin/activate
    	prepare_nvm_and_version $KWB_NODE_VERSION
      echo "PATH"$PATH
    	export NODE_OPTIONS="--max-old-space-size=8192"
      export NODE_PATH=$KWB_NODE_PATH
    	export PATH=$KWB_BIN_DIR:$PATH
      hash -r
      echo "Workbench Environment Activated"
      describe_environment_workbench
    fi
  fi
}
activate_environment_workbench_help() {
printf "`cat << EOF
${BLUE}kd activate phosphor${NC}

EOF
`\n"
}


vet_environment_workbench() {
  if check_basic_node_ability; then
    if check_basic_python_ability; then
      true
    else
      false
    fi
  else
    false
  fi
}
