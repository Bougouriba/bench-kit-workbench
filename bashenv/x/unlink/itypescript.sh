#!/bin/bash
# unlink pacakges

print_help() {
printf "`cat << EOF
${BLUE}kd wb unllink itypescript${NC}

EOF
`\n"
}

run() {
	relink_packages_to_workbench "unlink" "ITypescript" "" "itypescript"
	run_batch_packages_job "unlink" "ITypescript" "$ITYPESCRIPT_PKG_LIST" "$ITYPESCRIPT_PKG_BASE"
}
