#!/bin/bash
# Just fetch updates

print_help() {
printf "`cat << EOF
${BLUE}kd bootstrap ${NC}

EOF
`\n\n"

}

run() {
  git pull origin init
  kd clean
  echo " CLEANED"
  kd setup
  kd build
}
