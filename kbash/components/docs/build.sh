#!/bin/bash
build_environment_ENTRYPOINT_docs_help() {
printf "`cat << EOF
${BLUE}ENTRYPOINT build docs${NC}

EOF
`\n"
}
export -f build_environment_ENTRYPOINT_docs_help

build_environment_ENTRYPOINT_docs() {
  echo "Component[docs]:build"
}
export -f build_environment_ENTRYPOINT_docs
