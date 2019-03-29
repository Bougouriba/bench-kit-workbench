#!/bin/bash
# yarn install and build of itypescript

print_help() {
printf "`cat << EOF
${BLUE}kd wb itypescript${NC}

Run yarn install and yarn tsc in the itypescript
repository, then unlink, then link

EOF
`\n"
}

run() {
	relink_packages_to_workbench "unlink" "ITypescript" "" "itypescript"
	run_batch_packages_job "unlink" "ITypescript" "$ITYPESCRIPT_PKG_LIST" "$ITYPESCRIPT_PKG_BASE"
	run_batch_packages_job install "ITypescript" "$ITYPESCRIPT_PKG_LIST" "$ITYPESCRIPT_PKG_BASE"
	run_batch_packages_job "tsc" "ITypescript" "$ITYPESCRIPT_PKG_LIST" "$ITYPESCRIPT_PKG_BASE"
	run_batch_packages_job "link" "ITypescript" "$ITYPESCRIPT_PKG_LIST" "$ITYPESCRIPT_PKG_BASE"
	relink_packages_to_workbench "link" "ITypescript" "" "itypescript"
}
