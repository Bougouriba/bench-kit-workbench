#!/bin/bash
activate_environment_ENTRYPOINT_docs_help() {
printf "`cat << EOF
${BLUE}ENTRYPOINT activate docs${NC}

EOF
`\n"
}
export -f activate_environment_ENTRYPOINT_docs_help

activate_environment_ENTRYPOINT_docs() {
  activate_python_env $DOCS_VENV
}
export -f activate_environment_ENTRYPOINT_docs
