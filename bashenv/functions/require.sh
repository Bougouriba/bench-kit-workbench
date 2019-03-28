#!/bin/bash
# Bash equivalent of 'require' or 'import'
#
#
function oneline_help_kd_require() {
  echo "import a utility package (Deprecated)"
}

function help_kd_require() {
printf "`cat << EOF
${BLUE}kd require <utility>${NC}

Load and execute $KITWB_BASH_UTIL_DIR/<utility>.sh in this shell.

This was conceived of as an internal scripting system, so that commands
wouldn't need to "always load everything", however, it is now understood
that all elements of util should be loaded.

This is not yet implemented, and kd require can be safely ignored until
it is removed from the kd environment.
EOF
`\n"
}

function run_kd_require() {
  FILE=$KITWB_BASH_UTIL_DIR/$1.sh
  if [ ! -f $FILE ]; then
    printf "${RED}Failed to find $FILE in kd require${NC}"
  else
    . $FILE
  fi
}
export -f oneline_help_kd_require run_kd_require help_kd_require
