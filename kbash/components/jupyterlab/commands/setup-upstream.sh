#!/bin/bash
# setup upstream

print_help() {
printf "`cat << EOF
${BLUE}kd jupyterlab setup-upstream${NC}

Add origin to https://github.com/jupyterlab/jupyterlab

EOF
`\n"
}

run() (
  cd $JLAB_BASE
  git remote add upstream https://github.com/jupyterlab/jupyterlab
  git remove -v
)
