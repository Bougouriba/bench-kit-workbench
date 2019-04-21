#!/bin/bash
build_environment_kd_itypescript_help() {
printf "`cat << EOF
${BLUE}kd build itypescript${NC}

EOF
`\n"
}
export -f build_environment_kd_itypescript_help

build_environment_kd_itypescript() (
  echo "Component[itypescript]:build"
  cd $ITYPESCRIPT_BASE
  yarn tsc
  yarn pack
  cp itypescript-v0.3.5.tgz $KITWB/tarballs
)
export -f build_environment_kd_itypescript
