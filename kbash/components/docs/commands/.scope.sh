#!/bin/bash
# Not-used

ENTRYPOINT_scope_usage() {
  echo "<<DESCRIBE ANY OPTIONS FOR THIS SCOPE>>"
}
ENTRYPOINT_scope_help() {
printf "`cat << EOF

ENTRYPOINT docs commands

EOF
`\n\n"
}
build_global_docs() (
  activate_environment_kd_docs
  cd docs

  report_heading "Building MkDocs"
  mkdocs build
  report_ok "Docs Built"
)
export -f build_tool_docs
