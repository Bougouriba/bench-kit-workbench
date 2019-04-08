#!/bin/bash
# copy kernels

print_help() {
printf "`cat << EOF
${BLUE}kd wb dist${NC}

Run yarn install and yarn tsc in the itypescript
repository, then unlink, then link

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

}
