#!/bin/bash
# Activates kit workbench development environment


# this is what makes it behave like an integrated CLI
. $KITWB_BASH_DIR/util/cli/helpsystem.sh
. $KITWB_BASH_DIR/util/cli/entrypoint.sh
. $KITWB_BASH_DIR/util/cli/script.sh

# pull in our capabilities to enhance the environment.
#kd require docker
kd require git

# pull in our component specific models
kd require ../components/tool
kd require ../components/kisiakernel
kd require ../components/workbench
kd require ../components/rwotjskernel

export PS1="KD:\W> "
