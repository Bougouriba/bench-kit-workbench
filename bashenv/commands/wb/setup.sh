#!/bin/bash
# Tasks managing the workbench environment
print_help() {
printf "`cat << EOF
${BLUE}kd wb setup [OPTIONS]${NC}


EOF
`\n\n"
}

run() {
	# verify that the environment is configured
	vet_python_environment
	vet_nvm_environment

	cd $KWB_BASE_DIR
	git submodule update --init

	# abort if venv is already present
	create_python3_env $KWB_VENV_PATH
	activate_workbench_environment
	pip install -r requirements.txt
	kd wb kernels
	npm install -g yarn
	yarn install

#	kd wb regen all
}
