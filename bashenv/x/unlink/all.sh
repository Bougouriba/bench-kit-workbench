#!/bin/bash
# blah

print_help() {
printf "`cat << EOF
${BLUE}kd wb unlink all${NC}

EOF
`\n"
}

run() {
	kd wb unlink itypescript
	kd wb unlink phosphor
	kd wb unlink jupyterlab
}
