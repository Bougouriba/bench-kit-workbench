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
	if ! create_python3_env $KWB_VENV_PATH; then
		echo "Failed to create python environment"
		false
	else
		echo "Activating Python3 and Node Environments"
		activate_workbench_environment

		echo "NPM" $(command -v npm)
		pip install -r requirements.txt > /dev/null
		kd wb kernels

		npm install -g yarn
		if yarn install; then
			kd wb regen all
		else
			echo "Yarn install failed, trying to fix this"
		fi

	fi
}
