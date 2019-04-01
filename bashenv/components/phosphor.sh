#!/bin/bash

export PHOSPHOR_BASE=$KXX/phosphor
export PHOSPHOR_PKG_BASE=$PHOSPHOR_BASE/packages
# leaving out default-theme
export PHOSPHOR_PKG_LIST="algorithm collections commands coreutils datagrid datastore disposable domutils dragdrop keyboard messaging properties signaling virtualdom widgets"
export PHOSPHOR_PKG_LIST="$PHOSPHOR_PKG_LIST application"
export PHOSPHOR_NODE_VERSION=v11.6.0

link_phosphor() (
    cd $1
    local COMPONENT
    mkdir ./node_modules
    rm -rf ./node_modules/\@phosphor
    mkdir ./node_modules/\@phosphor
    for COMPONENT in $PHOSPHOR_PKG_LIST; do
 	   #yarn link @phosphor/$COMPONENT
    	local LOCAL=./node_modules/\@phosphor/$COMPONENT
    	rm -rf $LOCAL
    	ln -s $PHOSPHOR_BASE/packages/$COMPONENT $LOCAL
    done
)

clean_environment_phosphor() {
  local LIST="$PHOSPHOR_PKG_LIST"
  if [ ! -z "$@" ]; then
          LIST="$@"
  fi
  run_batch_packages_job "rm -rf node_modules" "PhosphorJS" "$LIST" "$PHOSPHOR_PKG_BASE"
  ls -al $PHOSPHOR_BASE/node_modules
  rm -rf $PHOSPHOR_BASE/node_modules
  rm -rf ~/.config/yarn/link/\@phosphor
}
clean_environment_phosphor_help() {
  printf "`cat << EOF
${BLUE}kd build phosphor${NC}

EOF
`\n"
}


build_environment_phosphor() {
  local LIST="$PHOSPHOR_PKG_LIST"
  if [ ! -z "$@" ]; then
          LIST="$@"
  fi
  run_batch_packages_job "yarn --silent build" "PhosphorJS" "$LIST" "$PHOSPHOR_PKG_BASE"
}
build_environment_phosphor_help() {
printf "`cat << EOF
${BLUE}kd build phosphor${NC}

EOF
`\n"
}


setup_environment_phosphor() {
  local LIST="$PHOSPHOR_PKG_LIST"
  if [ ! -z "$@" ]; then
          LIST="$@"
  fi
  prepare_nvm_and_version $PHOSPHOR_NODE_VERSION
  yarn --silent global add typescript
  run_batch_packages_job "yarn --silent install" "PhosphorJS" "$LIST" "$PHOSPHOR_PKG_BASE"
  run_batch_packages_job "yarn --silent build" "PhosphorJS" "$LIST" "$PHOSPHOR_PKG_BASE"
  run_batch_packages_job "yarn --silent link" "PhosphorJS" "$LIST" "$PHOSPHOR_PKG_BASE"
}
setup_environment_phosphor_help() {
printf "`cat << EOF
${BLUE}kd setup phosphor${NC}

EOF
`\n"
}


describe_environment_phosphor() {
  local LIST="$PHOSPHOR_PKG_LIST"
  if [ ! -z "$@" ]; then
          LIST="$@"
  fi
  report_vars "phosphor Build Environment" PHOSPHOR_BASE PHOSPHOR_NODE_MODULES PHOSPHOR_NODE_VERSION
  local COMPONENT
  for COMPONENT in $LIST; do
    local DIR="$PHOSPHOR_PKG_BASE/$COMPONENT/node_modules"
    if [ -d $DIR ]; then
      echo "... $COMPONENT : node_modules present"
    else
      echo "... $COMPONENT : node_modules does not exist"
    fi
  done
}
describe_environment_phosphor_help() {
printf "`cat << EOF
${BLUE}kd activate phosphor${NC}

EOF
`\n"
}



activate_environment_phosphor() {
  echo "Phosphor Environment Enabled"
  prepare_nvm_and_version $PHOSPHOR_NODE_VERSION
  #export NODE_PATH=$PHOSPHOR_NODE_MODULES
}
activate_environment_phosphor_help() {
printf "`cat << EOF
${BLUE}kd activate phosphor${NC}

EOF
`\n"
}


vet_environment_phosphor() {
  if check_basic_node_ability; then
    echo "Vet Environment Phosphor"
    true
  else
    false
  fi
}
