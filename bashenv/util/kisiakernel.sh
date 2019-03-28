#!/bin/bash


# KT for now - need to merge in gitworm, other

export KK_BASE_DIR=$KITWB_BASE_DIR/kernels/kisia_kernel
export KK_PYTHON=$(command -v python3)
export KK_PIP=$(command -v pip3)
export KK_VIRTUALENV=$(command -v virtualenv)
export KK_VENV_PATH=$KK_BASE_DIR/venv

activate_kisia_kernel_environment() {
	local ACTIVATOR=$KK_VENV_PATH/bin/activate
	if [ -f "$ACTIVATOR" ]; then
		. $ACTIVATOR
		true
	else
		echo "Failed to activate $ACTIVATOR"
		false
	fi
}


vet_kisia_kernel_environment() (
if [ "$KK_PYTHON" = "" ]; then
        echo "Missing python3"
        exit -1;
fi
if [ "$KK_PIP" = "" ]; then
        echo "Missing pip3"
        exit -1;
fi
if [ "$KK_VIRTUALENV" = "" ]; then
        echo "Missing virtualenv"
        exit -1;
fi
exit 0;
)
