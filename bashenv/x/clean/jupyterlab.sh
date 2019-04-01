#!/bin/bash
# jupyterlab :q
yarn install and build of jupyterlab

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
	if [ ! -z "$@" ]; then
		LIST="$@"
	fi
	run_batch_packages_job "rm -rf node_modules" "JupyterLab" "$LIST" "$BASE"
}
