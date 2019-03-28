#!/bin/bash
# This activates the current environment and executes a shell.
# This serves as as an entry point for terminal launches, but
# is otherwise equivalent to the activate.sh, which simply
# applies the system to the current shell.

# where are we?
KITWB_BASH_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
#set -x
. $KITWB_BASH_DIR/activate.sh

# go to the home directory
#kd cd

# and run a shell
exec /bin/bash "$@"

