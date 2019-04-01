#!/bin/bash
# yarn install and build of itypescript

print_help() {
printf "`cat << EOF
${BLUE}kd wb build all${NC}

Run yarn install and yarn tsc in the itypescript
repository, then unlink, then link

EOF
`\n"
}

run() {
	kd wb build itypescript
	kd wb build phosphor
	kd wb build jupyterlab
}
