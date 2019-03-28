#!/bin/bash
# Setup development environment

print_help() {
printf "`cat << EOF
${BLUE}kd kk setup [OPTIONS]${NC}

EOF
`\n\n"
}

run() (
	# verify that the environment is configured
	vet_tool_environment

	# abort if venv is already present
	if [ -d $KK_VENV_PATH ]; then
		echo "Virtual environment has already been set up"
		exit -1;
	fi

	$KK_VIRTUALENV -p $KK_PYTHON $KK_VENV_PATH
	activate_kisia_kernel_environment
	cd $KK_BASE_DIR
	pip install -r requirements.txt
)
