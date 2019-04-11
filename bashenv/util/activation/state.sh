#!/bin/bash
# load all the KITWB global directory pointers
export               KXX=$(pathof $__BOOTSTRAP_MY_DIR/..)

export          KXX_BASH=$KXX/bashenv
export     KXX_BASH_UTIL=$KXX_BASH/util
export  KXX_BASH_COMMAND=$KXX_BASH/commands
export KXX_BASH_FUNCTION=$KXX_BASH/functions
export       KXX_SCRIPTS=$KXX_BASH/scripts
export         KXX_FILES=$KXX_BASH/files

export KXX_MAX_PARALLEL=5
export KXX_LOGS=$KXX/build-logs

rm -rf $KXX_LOGS
mkdir $KXX_LOGS


export KITWB_ACTIVE_DEVENV=

function report_environment() {
  report_node_environmet
  report_python_environment
  if [ ! -z "$KITWB_ACTIVE_DEVENV" ]; then
    echo "Active Bash environment:$KITWB_ACTIVE_DEVENV"
    describe_environment_$KITWB_ACTIVE_DEVENV
  else
    echo "No environment activated"
  fi
}

# support legacy naming - ne want to replace this with the KXX_<function> model
# soon.  But this can be done slowly.
export KITWB_BASH_DIR=$KXX/bashenv
export KITWB_BASH_UTIL_DIR=$KITWB_BASH_DIR/util
export KITWB_BASH_COMMAND_DIR=$KITWB_BASH_DIR/commands
export KITWB_BASH_FUNCTION_DIR=$KITWB_BASH_DIR/functions
export KITWB_SCRIPTS_DIR=$KITWB_BASH_DIR/scripts
export KITWB_TEMPLATES_DIR=$KITWB_BASH_DIR/templates
export KITWB_FILES_DIR=$KITWB_BASH_DIR/files
export KITWB_BASE_DIR=$(pathof $KITWB_BASH_DIR/..)
export KITWB_PYTHON3=$(command -v python3)
export KITWB_VIRTUALENV=$(command -v virtualenv)
export KITWB_BASE_DIR=$KXX
