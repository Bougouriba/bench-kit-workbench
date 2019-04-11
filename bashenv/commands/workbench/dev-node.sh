#!/bin/bash
# build local dev version

print_help() {
printf "`cat << EOF
${BLUE}kd wb dev-node${NC}

set up for dev mode node_modules

EOF
`\n"
}

run() {

	prepare_nvm_and_version $KWB_NODE_VERSION
	cd $KWB_BASE_DIR
	rm -rf node_modules/\@phosphor
	rm -rf node_modules/\@jupyterlab
	link_phosphor $KWB_BASE_DIR
	link_jupyterlab $KWB_BASE_DIR
}
