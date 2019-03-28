#!/bin/bash
# REVISIT

print_help() {
printf "`cat << EOF
${BLUE}kd wb go${NC}

Run yarn install and yarn tsc in the itypescript
repository, then unlink, then link

EOF
`\n"
}

run() {
  open dist/KISIA\ Workbench.dmg
  rm -rf ~/Library/Logs/kisia-workbench/log.log
  touch ~/Library/Logs/kisia-workbench/log.log
  tail -f ~/Library/Logs/kisia-workbench/log.log
}
