#!/bin/bash


function oneline_help_kd_init() {
  echo "Completely initalize a new environment."
}

function help_kd_init() {
printf "`cat << EOF
${BLUE}kd init${NC}

${BOLD}kd init${NORMAL} performs the following:
 1 validates system pre-requisites and installs missing components
    (see ${BLUE}kd setup help${NC} for more information)
    This command can take up to an hour or more to run, but don't
    forget, sometimes you need to 'tickle' a windows machine.
 2 checks out all repositories from git
    (see ${BLUE}kd clone init help${NC} for more information)
 3 downloads all 3rd part images and caches them
    (see ${BLUE}kd cache help${NC} for more information)
 4 builds everything:
    * see ${BLUE}kd build help${NC} for more information
    * stores NuPkg and NPM artifacts in ${KITWB_PACKAGES}
    * pushes all docker images to local docker instance
    * builds support for ${BLUE}kd cli${NC}, allowing control of
      all REST and
 5 launches the workbench (see README.md for more informatoin)

EOF
`\n"
}

function run_kd_init() {
  local INIT_SCRIPT=(\
      "setup" \
      "cache pull" \
      "cache snapshot" \
      "repos clone bootstrap" \
      "repos status" \
      "repos develop" \
      "repos status" \
      "build all --quiet" \
      "bench create all" \
      "bench start" \
      "bench info running" \
      "docker ps" \
      )

  local DRY_RUN=false
  local POSITIONAL=()
  while [[ $# -gt 0 ]]
  do
  key="$1"

  case $key in
      -d|--dry)
      DRY_RUN=true
      shift # past argument
      ;;
      *)    # unknown option
      POSITIONAL+=("$1") # save it in an array for later
      shift # past argument
      ;;
  esac
  done
  if $DRY_RUN; then
    print_kd_script "${INIT_SCRIPT[@]}"
  else
    if ! exec_kd_script "${INIT_SCRIPT[@]}" ; then
      printf "${RED}Bootstrap Failed${NC}\n"
      return -1
    fi
  fi
  return 0
}
export -f oneline_help_kd_init help_kd_init run_kd_init
