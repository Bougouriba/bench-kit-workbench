#!/bin/bash
# install kernel

print_help() {
printf "`cat << EOF
${BLUE}kd tool_kernel kernel package${NC}

Create Package

EOF
`\n"
}

run() (
  report_heading "Package tool_kernel"

  local DIST=$(ensure_empty_dir $KKTOOL_BASE/dist)
  cp -r $KKTOOL_BASE/spec/* $DIST

  local SRC_ENV=$KKTOOL_BASE/venv
  local DST_ENV=$DIST/venv
  create_python3_env $DST_ENV
  . $DST_ENV/bin/activate
  cd $KKTOOL_BASE && pip install -r $KKTOOL_BASE/kernel-requirements.txt
  rm -rf $DST_ENV/bin
  rm -rf $DST_ENV/man
  rm -rf $DST_ENV/include
  rm -rf $DST_ENV/share/man
)
