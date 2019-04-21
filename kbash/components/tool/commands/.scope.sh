#!/bin/bash
# Tasks managing the workbench environment
kd_print_scope_help() {
printf "`cat << EOF
${BLUE}kd tool <SUBCOMMAND> [OPTIONS]${NC}


EOF
`\n\n"
kd_print_subcommand_help_summary tool
}
