#!/bin/bash
# rebuild docs and launch server

print_help() {
printf "`cat << EOF
${BLUE}ENTRYPOINT docs info${NC}

Info about ENTRYPOINT docs

EOF
`\n"
}

build_tool_docs() (
  activate_environment_kd_tool
  cd docs
  make html
  mkdocs build
)

run() (
  build_tool_docs

)
