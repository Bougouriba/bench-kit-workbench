#!/bin/bash
# Tasks managing the workbench environment
print_help() {
printf "`cat << EOF
${BLUE}kd wb install [OPTIONS]${NC}


EOF
`\n\n"
kd_print_kidlist_help wb
}

run() {
	# verify that the environment is configured
	vet_environment

	cd $KT_BASE_DIR
	git submodule update --init

	# abort if venv is already present
	if [ -d $KT_VENV_PATH ]; then
		echo "Virtual environment has already been set up"
		exit -1;
	fi

	$KT_VIRTUALENV -p $KT_PYTHON $KT_VENV_PATH
	activate_python_environment
	pip install -r requirements.txt
	kd wb kernels

	activate_node_environment
	npm install -g yarn
	yarn install

	kd wb regen all
}
