#!/bin/bash

# KT for now - need to merge in gitworm, other

export KT_BASE_DIR=$KITWB_BASE_DIR/tool
export KT_PYTHON=$(command -v python3)
export KT_PIP=$(command -v pip3)
export KT_VIRTUALENV=$(command -v virtualenv)
export KT_VENV_PATH=$KT_BASE_DIR/venv

describe_environment_tool() {
	report_vars KT_BASE_DIR KT_PYTHON KT_PIP KT_VIRTUALENV KT_VIRTUALENV
}

activate_environment_tool() {
	local ACTIVATOR=$KT_VENV_PATH/bin/activate
	if [ -f "$ACTIVATOR" ]; then
		. $ACTIVATOR
		true
	else
		echo "Failed to activate $ACTIVATOR"
		false
	fi
}


vet_environment_tool() (
if [ "$KT_PYTHON" = "" ]; then
        echo "Missing python3"
        exit -1;
fi
if [ "$KT_PIP" = "" ]; then
        echo "Missing pip3"
        exit -1;
fi
if [ "$KT_VIRTUALENV" = "" ]; then
        echo "Missing virtualenv"
        exit -1;
fi
exit 0;
)

