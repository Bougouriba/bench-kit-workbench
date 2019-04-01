#!/bin/bash
#

print_help() {
printf "`cat << EOF
${BLUE}kd clean all${NC}

EOF
`\n"
}

run() {
	kd clean itypescript
	kd clean phosphor
	kd clean jupyterlab
	kd clean workbench
	kd clean tool
	kd clean kisia-cli
	kd clean kisia-ts
	kd clean rwot-js
}
