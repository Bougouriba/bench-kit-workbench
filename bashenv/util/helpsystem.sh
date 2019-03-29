#!/bin/bash

# --------------------------------------------------------- Help Support
# example: findkids kd-build
# looks for any scripts of the form <base>-<subcommand>, but
# excludes <base>-<subcommand>-<other>, so it returns only the
# immediate subcommands
kd_findkids() {
  pushdir "$KITWB_BASH_COMMAND_DIR"
  echo $(ls -1 *.sh )
  local BASE=$1
  local PREFIX="$BASE-"
  local GLOB="*.sh"
  echo "GLOB:$GLOB"
  for FOO in $GLOB; do
   if [ ! "$FOO" = "$GLOB" ]; then
     echo ${FOO#$PREFIX}
   fi
  done
  popdir
}

# example usage print_kidlist_help kd
#
kd_print_kidlist_help() {
  local WIDTH=18
  local BASE=$KITWB_BASH_COMMAND_DIR/$1
  local KIDS=$(ls -1 $BASE/*.sh  2>/dev/null | xargs -n 1 basename | sed s/\.sh//g | sort)
  #SCOPES=$(ls -1 $KITWB_KD_COMMANDS/$1/*/.scope | xargs -n 1 dirname | xargs -n 1 basename | sort)
  local SCOPES=$(ls -1 $BASE/*/.scope 2>/dev/null)
  if [ ! -z "$SCOPES" ]; then
    SCOPES=$(ls -1 $BASE/*/.scope | xargs -n 1 dirname | xargs -n 1 basename | sort)
  fi

  for KID in $KIDS; do
     local SCRIPT_FILE="$BASE/$KID.sh"
     if [ -f "$SCRIPT_FILE" ]; then
       local ONELINER=$(head -n 2 "$SCRIPT_FILE" | tail -n 1 | colrm 1 2)
       printf "${GREEN}%-${WIDTH}s${NC} %s\n" " $PREFIX$KID" "$ONELINER"
     else
       echo "-no help available-"$SCRIPT_FILE
     fi
   done

   for SCOPE in $SCOPES; do
      local SCRIPT_FILE="$BASE/$SCOPE/.scope"
      if [ -f "$SCRIPT_FILE" ]; then
        local ONELINER=$(head -n 2 "$SCRIPT_FILE" | tail -n 1 | colrm 1 2)
        printf "${GREEN}%-${WIDTH}s${NC} %s\n" " $PREFIX$SCOPE" "$ONELINER"
      else
        echo "-no scope help available-"$SCRIPT_FILE
      fi
    done
}

# print the top level help, subsequent subcommands will override this
# function with the appropriate help
kd_print_help() {
  local FUNCS=$(find_dot_sh $KITWB_BASH_FUNCTION_DIR | sed s/[/]/_/g | sed s/.sh//g | sort )
printf "`cat << EOF
${BLUE}kd <command> [help]${NC}

kd is a bash environment supporting development of the KIT Workbench.

It mixes 'within-environment' mutations along with pure-side-effect script
execution.

It uses a "Convention over Configuration" and heavily seeds a bash operating
environment with functions and variables, supporting multi-tech integration
projects.

It can be rapidly and ad-hoc adjusted, and it is specific to this repository,
meaning that all paths should be known and should be relative to the
KITWB_BASE_DIR directory, which is currently:
 = $KITWB_BASE_DIR

For more information, check out this file:
$KITWB_BASE_DIR/docs/bashenv.md

In general use ${BLUE}kd [cmd] help${NC} for more information.

EOF
`\n\n"
printf "Functions (modify the current shell)\n"
local WIDTH=18
for FUNC in $FUNCS; do
  ONELINER="$(oneline_help_kd_$FUNC)"
  printf "${GREEN}%-${WIDTH}s${NC} %s\n" " $FUNC" "$ONELINER"
done

printf "Commands\n"
kd_print_kidlist_help .

printf "\n"
printf "Use ${BLUE}kd [cmd] help${NC} for more information.\n"

}
# by default, just print the help
run_kd_help() (
  kd_print_help
)
export -f run_kd_help kd_print_help kd_print_kidlist_help kd_findkids
