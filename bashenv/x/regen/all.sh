#!/bin/bash
# yarn install and build of itypescript

print_help() {
printf "`cat << EOF
${BLUE}kd wb regen all${NC}

Run yarn install and yarn tsc in the itypescript
repository, then unlink, then link

EOF
`\n"
}

run() {
	kd wb regen itypescript
	kd wb regen phosphor
	kd wb regen jupyterlab
}
