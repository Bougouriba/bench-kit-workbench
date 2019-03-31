#!/bin/bash
# KT for now - need to merge in gitworm, other

export KK_BASE_DIR=$KITWB_BASE_DIR/kernels/kisia_kernel
export KK_PYTHON=$(command -v python3)
export KK_PIP=$(command -v pip3)
export KK_VIRTUALENV=$(command -v virtualenv)
export KK_VENV_PATH=$KK_BASE_DIR/venv

describe_environment_kisia_cli() {
	report_vars KK_BASE_DIR KK_PYTHON KK_PIP KK_VIRTUALENV KK_VENV_PATH
}

activate_environment_kisia_cli() {
	local ACTIVATOR=$KK_VENV_PATH/bin/activate
	if [ -f "$ACTIVATOR" ]; then
		. $ACTIVATOR
		true
	else
		echo "Failed to activate $ACTIVATOR"
		false
	fi
}

vet_environment_kisia_cli() {
  return true
}

