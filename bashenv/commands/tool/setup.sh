#!/bin/bash
# Setup a workbench environment
print_help() {
printf "`cat << EOF
${BLUE}kd wb setup [OPTIONS]${NC}


EOF
`\n\n"
}

run() (
	# verify that the environment is configured
	vet_tool_environment

	# abort if venv is already present
	if [ -d $KT_VENV_PATH ]; then
		echo "Virtual environment has already been set up"
		exit -1;
	fi

	$KT_VIRTUALENV -p $KT_PYTHON $KT_VENV_PATH
	activate_tool_environment
	cd $KT_BASE_DIR
	pip install -r requirements.txt
)
