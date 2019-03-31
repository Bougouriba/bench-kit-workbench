#!/bin/bash
# Activates kit workbench development environment
#
# Overall Plan
#
# - establlish base directory and update an activation count

#
#
#

# where are we?
__BOOTSTRAP_MY_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# load os utilities
. $__BOOTSTRAP_MY_DIR/util/os.sh

. $__BOOTSTRAP_MY_DIR/util/activation/count.sh
. $__BOOTSTRAP_MY_DIR/util/activation/prompt.sh
. $__BOOTSTRAP_MY_DIR/util/activation/state.sh

# this is what makes it behave like an integrated CLI
. $KXX_BASH_UTIL/cli/helpsystem.sh
. $KXX_BASH_UTIL/cli/entrypoint.sh
. $KXX_BASH_UTIL/cli/script.sh

# pull in our capabilities to enhance the environment.
#kd require docker
#kd require git

# pull in our component specific models
kd require ../components/tool
kd require ../components/kisia-cli
kd require ../components/workbench
kd require ../components/rwot-js

