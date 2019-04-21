#!/bin/bash
clean_environment_ENTRYPOINT_docs_help() {
  printf "`cat << EOF
${BLUE}ENTRYPOINT clean docs${NC}

EOF
`\n"
}
export -f clean_environment_ENTRYPOINT_docs_help

clean_environment_ENTRYPOINT_docs() {
  report_progress "rm -rf $DOCS_VENV"
  rm -rf $DOCS_VENV
}
export -f clean_environment_ENTRYPOINT_docs
