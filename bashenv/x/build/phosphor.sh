#!/bin/bash
# yarn install and build of phosphor

print_help() {
printf "`cat << EOF
${BLUE}kd wb phosphor${NC}

Run yarn install and yarn tsc in the itypescript
repository, then unlink, then link

EOF
`\n"
}

run() {
	local LIST="$PHOSPHOR_PKG_LIST"
	local BASE="$PHOSPHOR_PKG_BASE"
	if [ "$@" != "" ]; then
		LIST="$@"
	fi
	run_batch_packages_job install "PhosphorJS" "$LIST" "$BASE"
	run_batch_packages_job "tsc" "PhosphorJS" "$LIST" "$BASE"
}
