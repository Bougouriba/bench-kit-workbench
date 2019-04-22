#!/bin/bash
# rebuild docs and launch server

print_help() {
printf "`cat << EOF
${BLUE}ENTRYPOINT docs info${NC}

Info about ENTRYPOINT docs

EOF
`\n"
}


run() (
  build_global_docs

)
