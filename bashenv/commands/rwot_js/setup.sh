#!/bin/bash
# Setup development environment

print_help() {
printf "`cat << EOF
${BLUE}kd rwot_js setup [OPTIONS]${NC}

EOF
`\n\n"
}

run() (
	prepare_nvm_and_version $RWOT_JS_NODE_VERSION
	cd $RWOT_JS_BASE_DIR
	yarn install
)
