#!/bin/bash
# Search source
print_help() {
printf "`cat << EOF
${BLUE}kd wb search term${NC}


EOF
`\n\n"
}

run() (
	cd $KWB_BASE_DIR
  find src -type f -exec grep -H "$@" {} \; | colrm 500 1000000
  find venv -type f -name \*.py -exec grep -H "$@" {} \; | colrm 500 1000000
  find ../jupyterlab -name \*.ts -type f -exec grep -H "$@" {} \; | colrm 500 1000000
  find ../phosphor -name \*.ts -type f -exec grep -H "$@" {} \; | colrm 500 1000000
)
