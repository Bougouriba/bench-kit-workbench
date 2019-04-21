#!/bin/bash
# The KIT Workbench Documentation Environment
kd_print_scope_help() {
printf "`cat << EOF
${BLUE}kd nteract [SUBCOMMAND] [OPTIONS]${NC}

kd nteract commands

EOF
`\n\n"
kd_print_subcommand_help_summary nteract
}
