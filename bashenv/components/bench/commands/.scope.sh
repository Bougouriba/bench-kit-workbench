#!/bin/bash
# The KIT Workbench Documentation Environment
kd_print_scope_help() {
printf "`cat << EOF
${BLUE}kd bench [SUBCOMMAND] [OPTIONS]${NC}

kd bench commands

EOF
`\n\n"
kd_print_subcommand_help_summary bench
}
