#!/bin/bash
# build local dev version

print_help() {
printf "`cat << EOF
${BLUE}kd wb dev-python${NC}

copy the active python into the dev-mode directory.

also regenerate the kernels.


EOF
`\n"
}

run() {
	copy_python_for_workbench_dev_install
	kd wb kernels
}
