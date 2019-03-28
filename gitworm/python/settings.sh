#!/bin/bash

export KT_PYTHON_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export KT_PYTHON=$(command -v python3)
export KT_PIP=$(command -v pip3)
export KT_VIRTUALENV=$(command -v virtualenv)
export KT_VENV_PATH=$KT_PYTHON_DIR/venv

vet_environment() {
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
        exit -1; fi
}

is_being_sourced() {
	echo "${BASH_SOURCE[0]}"
	echo "${0}"
	[[ "${BASH_SOURCE[0]}" != "${0}" ]] && true || false
}

