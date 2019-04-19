#!/bin/bash
# install kernel

print_help() {
printf "`cat << EOF
${BLUE}kd credcom_kernel kernel package${NC}

Create Package

EOF
`\n"
}

run() (
  report_heading "Package credcom_kernel"

  local DIST=$(ensure_empty_dir $CREDCOM_BASE/dist)
  cp -r $CREDCOM_BASE/spec/* $DIST
  cp -r $CREDCOM_BASE/package.json $DIST
  mkdir $DIST/working-dir
  mv $DIST/tsconfig.json $DIST/working-dir
  mv $DIST/Introduction.ipynb $DIST/working-dir

  activate_environment_kd_credcom_kernel
  cd $DIST && npm install
)
