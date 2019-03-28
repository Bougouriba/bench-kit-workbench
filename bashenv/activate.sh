#!/bin/bash
# Activates bash utility framework
#

# where are we?
export KITWB_BASH_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# load os utilities
. $KITWB_BASH_DIR/util/os.sh

# load all the KITWB global variables
export KITWB_BASH_UTIL_DIR=$KITWB_BASH_DIR/util
export KITWB_BASH_COMMAND_DIR=$KITWB_BASH_DIR/commands
export KITWB_BASH_FUNCTION_DIR=$KITWB_BASH_DIR/functions
export KITWB_SCRIPTS_DIR=$KITWB_BASH_DIR/scripts
export KITWB_TEMPLATES_DIR=$KITWB_BASH_DIR/templates
export KITWB_FILES_DIR=$KITWB_BASH_DIR/files

export KITWB_BASE_DIR=$(pathof $KITWB_BASH_DIR/..)
export KITWB_PYTHON3=$(command -v python3)
export KITWB_VIRTUALENV=$(command -v virtualenv)

# this just keeps an activation count, for reference
if [ -z "$KITWB_ACTIVATION_COUNT" ]; then
  KITWB_ACTIVATION_COUNT=0
  ORIGINAL_PATH=$PATH
else
  KITWB_ACTIVATION_COUNT=$(expr $KITWB_ACTIVATION_COUNT + 1 )
fi
export KITWB_ACTIVATION_COUNT

. $KITWB_BASH_DIR/util/helpsystem.sh
. $KITWB_BASH_DIR/util/entrypoint.sh

# pull in our utilities and functions to create the environment.  The functions
# were broken into external files to improve organization and readability, but
# these are not used by other scripts - just here.
#
kd require completion
#kd require docker
kd require git
kd require script

# now include components
kd require tool
kd require kisiakernel
kd require workbench
kd require rwotjskernel

export PS1="KD:\W> "
