#!/bin/bash

function run_environment_func() {
  FUNC=$1
  local COMPONENT=""
  local CMD=""
  shift 1
  if [ -z "$1$2" ]; then
    COMPONENT="all"
  else
    COMPONENT=$(slugify $1)
    shift 1
  fi

  if [ "$COMPONENT" = "all" ]; then
    for COMPONENT in $KXX_COMPONENT_LIST; do
      run_environment_func $FUNC "$COMPONENT"
    done
  else
    CMD=$FUNC"_environment_"$COMPONENT
    if [ "help" = "$COMPONENT" ]; then
      print_environment_help $FUNC
    else
      if [ "help" = "$1" ]; then
        CMD=$CMD"_help"
        $CMD "$@"
      else
        if [ "--help" = "$1" ]; then
          CMD=$CMD"_help"
          $CMD "$@"
        else
          if vet_environment_$COMPONENT; then
          	if ! $CMD "$@"; then
              echo "Failed to $CMD for $COMPONENT"
            fi
          fi
        fi
      fi
    fi
  fi
}

function print_environment_help() {
  FUNC=$1
  shift 1
  printf "`cat << EOF
${BLUE}kd $FUNC [SUBCOMMAND] ...${NC}

$FUNC one or all of the component environments
EOF
`\n\n"
  echo $FUNC all
  for COMPONENT in $KXX_COMPONENT_LIST; do
    echo $FUNC "$COMPONENT"
  done
}
