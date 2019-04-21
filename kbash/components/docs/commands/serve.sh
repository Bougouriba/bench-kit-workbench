#!/bin/bash
# view docs

print_help() {
printf "`cat << EOF
${BLUE}ENTRYPOINT docs info${NC}

Info about ENTRYPOINT docs

EOF
`\n"
}

run() (
  kbash_trace docs-serve "Serving Docs"
  activate_environment_kd_docs
  #report_python_env $DOCS_BASE
  cd $DOCS_BASE/mkdocs-src
  mkdocs serve
)
