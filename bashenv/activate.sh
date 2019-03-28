#!/bin/bash
# Activates bash utility framework
#

# where are we?
export KITWB_BASH_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# load os utilities
. $KITWB_BASH_DIR/util/os.sh

# load all the KITWB global variables
. $KITWB_BASH_DIR/util/variables.sh

# this just keeps an activation count, for reference
if [ -z "$KITWB_ACTIVATION_COUNT" ]; then
  KITWB_ACTIVATION_COUNT=0
else
  KITWB_ACTIVATION_COUNT=$(expr $KITWB_ACTIVATION_COUNT + 1 )
fi

# load commands into the core that can manipulate the
# existing state - this allows us to maintain live state
# via the CLI.
for FUNC in $(find $KITWB_BASH_FUNCTION_DIR -name \*.sh); do
  . $FUNC
done

. $KITWB_BASH_DIR/util/helpsystem.sh
. $KITWB_BASH_DIR/util/entrypoint.sh
. $KITWB_BASH_DIR/util/completion.sh
# this is the default run function which just prints help.  This is
# mostly used in group parent commands, like kd-bench.
run() {
  print_help
}

# pull in our utilities and functions to create the environment.  The functions
# were broken into external files to improve organization and readability, but
# these are not used by other scripts - just here.
#
#kd require components
#kd require checkout
#kd require docker
kd require git
kd require script
kd require workbench
