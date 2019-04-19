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
  report_heading "Patch credcom_kernel"

  local DIST=$CREDCOM_BASE/dist
  cp -r $CREDCOM_BASE/spec/* $DIST
  cp -r $CREDCOM_BASE/package.json $DIST
  mv $DIST/tsconfig.json $DIST/working-dir
  mv $DIST/Introduction.ipynb $DIST/working-dir
)
