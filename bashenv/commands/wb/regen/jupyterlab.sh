#!/bin/bash
# yarn install and build of jupyterlab

print_help() {
printf "`cat << EOF
${BLUE}kd wb jupyterlab${NC}

Run yarn install and yarn tsc in the jupyterlab packages
repository, then unlink, then link

EOF
`\n"
}

run() {
	local LIST="$JLAB_PKG_LIST"
	local BASE="$JLAB_PKG_BASE"
	if [ "$@" != "" ]; then
		LIST="$@"
	fi
	#relink_packages_to_workbench "unlink" "JupyterLab" "@jupyterlab/" "$LIST"
	#run_batch_packages_job "unlink" "JupyterLab" "$LIST" "$BASE"
	#run_batch_packages_job install "JupyterLab" "$LIST" "$BASE"
	#run_batch_packages_job "tsc" "JupyterLab" "$LIST" "$BASE"
	#run_batch_packages_job "link" "JupyterLab" "$LIST" "$BASE"
	relink_packages_to_workbench "link" "JupyterLab" "@jupyterlab/" "$LIST"
}
