#!/bin/bash
#
# Given a base directory and a command
#
kd_execute() (
  local FILE=$1
  local HELP=$2
  shift 1
  . $FILE
  if [ "$HELP" = "help" ]; then
    print_help
  else
    run $@
  fi
)

kd_locate_subcommand() {
  local BASE_DIR=$1
  local COMMAND=$2
  shift 2
  local FILE=$BASE_DIR/$COMMAND.sh
  if [ -f "$FILE" ]; then
    kd_execute $FILE $@
  else
    local SCOPE=$BASE_DIR/.scope
    if [ -f "$SCOPE" ]; then
      . $SCOPE
    fi
    if [ -z "$COMMAND" ] || [ "help" = "$COMMAND" ]; then
      print_help
    else
      local DIR=$BASE_DIR/$COMMAND
      if [ -d "$DIR" ]; then
        kd_locate_subcommand $DIR $@
      else
        echo "Command not found"
        echo "   COMMAND = "$COMMAND
        echo "   FUNC = run_kd_"$(slugify $COMMAND)
        echo "   BASE_DIR = "$BASE_DIR
        echo "   FILE = "$FILE
        echo "   CLI = "$@
      fi
    fi
  fi
}


# this is the entry point
kd() {
  if [ -z "$1" ]; then
     kd_print_help
  else
     local TAG=$(slugify $1)
     local FUNC=run_kd_$TAG
     shift 1
     TYPE="$(type -t $FUNC)"
     if [ "$TYPE" = "function" ]; then
       if [ "$1" == "help" ]; then
         help_kd_$TAG
       else
         $FUNC "$@"
       fi
     else
       kd_locate_subcommand $KITWB_BASH_COMMAND_DIR $TAG $@
     fi
  fi
}
export -f kd kd_locate_subcommand kd_execute
