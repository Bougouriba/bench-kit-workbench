#!/bin/bash
# load all the KITWB global directory pointers
export               KXX=$(pathof $__BOOTSTRAP_MY_DIR/..)

export          KXX_BASH=$KXX/bash
export     KXX_BASH_UTIL=$KXX_BASH/util
export  KXX_BASH_COMMAND=$KXX_BASH/commands
export KXX_BASH_FUNCTION=$KXX_BASH/functions
export       KXX_SCRIPTS=$KXX_BASH/scripts
export         KXX_FILES=$KXX_BASH/files

# devops python
export    KXX_PYTHON_ENV=$KXX/venv
function report_python_environmet() {
  report_vars "Active Node Variables" KXX_PYTHON_ENV PYTHONPATH
}

# devops node
export      KXX_NODE_ENV=$KXX/node_modules
function report_node_environmet() {
  report_vars "Active Node Variables" KXX_NODE_ENV NVM_DIR NODE_PATH
}

# key devops executables
export       KXX_PYTHON3=$(command -v python3)
export    KXX_VIRTUALENV=$(command -v virtualenv)
export          KXX_NODE=$(command -v node)
export          KXX_YARN=$(command -v yarn)
function report_active_execution_environment() {
  report_vars "Active Execution Variables" KXX_PYTHON3 KXX_VIRTUALENV KXX_NODE KXX_YARN
}


function report_environment() {
  report_active_execution_environment
  report_node_environmet
  report_python_environmet
}

# support legacy naming - ne want to replace this with the KXX_<function> model
# soon.  But this can be done slowly.
export KITWB_BASH_UTIL_DIR=$KITWB_BASH_DIR/util
export KITWB_BASH_COMMAND_DIR=$KITWB_BASH_DIR/commands
export KITWB_BASH_FUNCTION_DIR=$KITWB_BASH_DIR/functions
export KITWB_SCRIPTS_DIR=$KITWB_BASH_DIR/scripts
export KITWB_TEMPLATES_DIR=$KITWB_BASH_DIR/templates
export KITWB_FILES_DIR=$KITWB_BASH_DIR/files
export KITWB_BASE_DIR=$(pathof $KITWB_BASH_DIR/..)
export KITWB_PYTHON3=$(command -v python3)
export KITWB_VIRTUALENV=$(command -v virtualenv)
export KITWB_BASE_DIR=$__BOOTSTRAP_MY_DIR
