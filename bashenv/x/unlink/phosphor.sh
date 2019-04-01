#!/bin/bash
# yarn install and build of phosphor

print_help() {
printf "`cat << EOF
${BLUE}kd wb unlink phosphor${NC}

EOF
`\n"
}

run() {
	local LIST="$PHOSPHOR_PKG_LIST"
	local BASE="$PHOSPHOR_PKG_BASE"
	if [ "$@" != "" ]; then
		LIST="$@"
	fi
	relink_packages_to_workbench "unlink" "PhosphorJS" "@jupyterlab/" "$LIST"
	run_batch_packages_job "unlink" "PhosphorJS" "$LIST" "$BASE"
}
