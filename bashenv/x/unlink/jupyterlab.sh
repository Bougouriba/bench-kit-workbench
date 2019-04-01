#!/bin/bash
# yarn install and build of jupyterlab

print_help() {
printf "`cat << EOF
${BLUE}kd wb jupyterlab${NC}

EOF
`\n"
}

run() {
	local LIST="$JLAB_PKG_LIST"
	local BASE="$JLAB_PKG_BASE"
	if [ "$@" != "" ]; then
		LIST="$@"
	fi
	relink_packages_to_workbench "unlink" "JupyterLab" "@jupyterlab/" "$LIST"
	run_batch_packages_job "unlink" "JupyterLab" "$LIST" "$BASE"
}
