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
	run_batch_packages_job install "PhosphorJS" "$PHOSPHOR_PKG_LIST" "$PHOSPHOR_PKG_BASE"
	run_batch_packages_job "tsc" "PhosphorJS" "$PHOSPHOR_PKG_LIST" "$PHOSPHOR_PKG_BASE"
	run_batch_packages_job "unlink" "PhosphorJS" "$PHOSPHOR_PKG_LIST" "$PHOSPHOR_PKG_BASE"
	run_batch_packages_job "link" "PhosphorJS" "$PHOSPHOR_PKG_LIST" "$PHOSPHOR_PKG_BASE"
	relink_packages_to_workbench "link" "PhosphorJS" "@phosphor/" "$PHOSPHOR_PKG_LIST"
}
