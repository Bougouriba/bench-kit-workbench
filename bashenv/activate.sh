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

. $__BOOTSTRAP_MY_DIR/util/python.sh
. $__BOOTSTRAP_MY_DIR/util/node.sh
. $__BOOTSTRAP_MY_DIR/util/parallel.sh
. $__BOOTSTRAP_MY_DIR/util/components.sh

# this is what makes it behave like an integrated CLI
. $KXX_BASH_UTIL/cli/helpsystem.sh
. $KXX_BASH_UTIL/cli/entrypoint.sh
. $KXX_BASH_UTIL/cli/script.sh

# pull in our capabilities to enhance the environment.
#kd require docker
#kd require git

export KXX_COMPONENT_LIST="phosphor jupyterlab itypescript workbench tool docs"
#export KXX_COMPONENT_LIST="$KXX_COMPONENT_LIST kisia-cli rwot-js kisia-ts"
export KXX_COMPONENT_LIST="$KXX_COMPONENT_LIST kisia-cli"
for COMPONENT in $KXX_COMPONENT_LIST; do
  . $KXX_BASH/components/$COMPONENT.sh
done
