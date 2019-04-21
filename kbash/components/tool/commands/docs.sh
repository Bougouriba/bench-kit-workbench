#!/bin/bash
# init

print_help() {
printf "`cat << EOF
${BLUE}kd tool init${NC}

write out commands to add and tag initial sheets

EOF
`\n"
}

run() (
  cd $KISIA_CLI_BASE/docs
  activate_environment_kd_tool
  make html
  mkdocs build
  mkdocs serve
)
