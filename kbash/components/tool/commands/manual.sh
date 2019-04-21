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
  activate_environment_kd_tool
  cd $KISIA_CLI_BASE/cli
  DOCFILE=$KISIA_CLI_BASE/docs/mkdocs-src/manual.md
  for P in "" $(find . -name \*.py | grep -v __ | sed 's/.py$//g' | colrm 1 2 ); do
    local CMD=$(echo $P | sed 's|/| |g' )
    echo "# $CMD" >> $DOCFILE
    echo "\`\`\`" >> $DOCFILE
    tool $CMD >> $DOCFILE
    echo "\`\`\`" >> $DOCFILE
  done
)
