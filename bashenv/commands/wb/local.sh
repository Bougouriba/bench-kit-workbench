#!/bin/bash
# build local dev version

print_help() {
printf "`cat << EOF
${BLUE}kd wb local${NC}

build local dev version and run it with ```electron .```

EOF
`\n"
}

run() {

	kd wb kernels
	prepare_nvm_and_version $KWB_NODE_VERSION
	cd $KWB_BASE_DIR
	rm -rf node_modules/\@phosphor
	rm -rf node_modules/\@jupyterlab
	link_phosphor $KWB_BASE_DIR
	link_jupyterlab $KWB_BASE_DIR
	copy_python_for_workbench_dev_install
	yarn build
}
