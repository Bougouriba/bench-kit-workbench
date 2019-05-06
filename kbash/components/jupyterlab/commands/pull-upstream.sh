#!/bin/bash
# pull upstream changes into main

print_help() {
printf "`cat << EOF
${BLUE}kd jupyterlab pull-upstream${NC}

Pull upstream

EOF
`\n"
}

run() (
  if [ "upstream" = "$(git remote | grep upstream)" ]; then
    git fetch upstream
    git merge upstream/master
  else
    error "did not find appropriate upstream remote"
  fi
)
