#!/bin/bash

function oneline_help_kd_setenv() {
  echo "Change context to another environment."
}

function help_kd_setenv() {
printf "`cat << EOF
${BLUE}kd setenv <path-to-checkout>${NC}

This is used to change context to another environment.

For example, if you have
  * /tmp/checkout-1 - obtained by kd repos clone bootstrap
  * /tmp/checkout-2 - created by kd repos clone new --from /tmp/checkout-1

Then you can move between them by saying
  * kd setenv /tmp/checkout-1
  * kd setenv /tmp/checkout-2

EOF
`\n"
}

function run_kd_setenv() {
  if [ ! -z "$1" ]; then
    ENV="$1/bashenv/activate.sh"
    if [ -f "$ENV" ]; then
      if [ "$1" = "$KITWB_BASE_DIR" ]; then
        MSG="${GREEN}Successful Reset${NC} : kd setenv = "
      else
        MSG="${GREEN}Successful Switch${NC} : kd setenv = "
      fi
      . $ENV
      kd id "$MSG"
    else
      printf "${RED}WARNING: unable to find $ENV ${NC}\n"
    fi
  else
    printf "${RED}kd_setenv <checkout-dir>${NC}\n"
  fi
}
export -f oneline_help_kd_setenv help_kd_setenv run_kd_setenv
