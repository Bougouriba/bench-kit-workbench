#!/bin/bash
# The KIT Workbench Documentation Environment
kd_print_scope_help() {
printf "`cat << EOF
${BLUE}kd itypescript [SUBCOMMAND] [OPTIONS]${NC}

kd itypescript commands

EOF
`\n\n"
kd_print_subcommand_help_summary itypescript
}
