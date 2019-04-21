#!/bin/bash
setup_environment_ENTRYPOINT_docs_help() {
printf "`cat << EOF
${BLUE}ENTRYPOINT setup docs${NC}

EOF
`\n"
}
export -f setup_environment_ENTRYPOINT_docs_help

setup_environment_ENTRYPOINT_docs() {
  default_python_setup $DOCS_BASE
}
export -f setup_environment_ENTRYPOINT_docs
