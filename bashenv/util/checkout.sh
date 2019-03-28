#!/bin/bash

repo_tag_for() {
  PWD=$1
  PWD_NAME=$(basename $PWD)
  PWD_PARENT=$(dirname $PWD)

}

find_git() {
  if [ -z "$1" ]; then
    return -1
  fi
  if [ "/" = "$1" ]; then
    return -1
  fi

  PWD=$1
  PWD_NAME=$(basename $PWD)
  PWD_PARENT=$(dirname $PWD)
  if [ -d  "$PWD/.git" ]; then
    REPO_TAG=${PWD_NAME##kisia-}

    if is_service $REPO_TAG; then
      echo $REPO_TAG
      return 0
    fi
    if is_library $REPO_TAG; then
      echo $REPO_TAG
      return 0
    fi
    return -1
  else
    find_git $PWD_PARENT
  fi

}

guess_current_repo() {
  find_git $PWD
}


repo_make() {
  REPO=$1
  shift 1
  make --no-print-directory -C $KITWB_BASE_DIR/kisia-$REPO/devops "$@"
}

is_everything_checked_out() {
  EVERYTHING_IS_CHECKED_OUT=true
  for REPO_TAG in $KITWB_REPO_TAGS; do
    REPO_DIR="$KITWB_BASE_DIR/kisia-$REPO_TAG"
    if [ ! -d "$REPO_DIR" ]; then
      printf "${RED}Repository 'kisia-$REPO_TAG' not found at $(pathof $REPO_DIR)${NC}\n"
      EVERYTHING_IS_CHECKED_OUT=false
    fi
  done
  $EVERYTHING_IS_CHECKED_OUT
}
list_missing_repos() {
  for REPO_TAG in $KITWB_REPO_TAGS; do
    REPO_DIR="$KITWB_BASE_DIR/kisia-$REPO_TAG"
    if [ ! -d "$REPO_DIR" ]; then
      echo $REPO_TAG
    fi
  done
}
is_not_bootstrapable() {
  SOMETHING_IS_CHECKED_OUT=false
  for REPO_TAG in $KITWB_REPO_TAGS; do
    REPO_DIR="$KITWB_BASE_DIR/kisia-$REPO_TAG"
    if [ -d "$REPO_DIR" ]; then
      printf "${RED}Repository 'kisia-$REPO_TAG' not found at $(pathof $REPO_DIR)${NC}\n"
      SOMETHING_IS_CHECKED_OUT=true
    fi
  done
  $SOMETHING_IS_CHECKED_OUT
}
has_devops_support() {
  HAS_DEVOPS_SUPPORT=true
  for SERVICE in $KITWB_REPO_TAGS; do
    DEVOPS_SUPPORT_DIR="$KITWB_BASE_DIR/kisia-$SERVICE/devops"
    if [ ! -d "$DEVOPS_SUPPORT_DIR" ]; then
      printf "${RED}Repository 'kisia-$SERVICE' was found but is missing 'devops' directory.${NC}\n"
      HAS_DEVOPS_SUPPORT=false
    fi
  done
  $HAS_DEVOPS_SUPPORT
}

build_composition() {

  if [ -z "$COMPOSITION" ]; then
    # build the list of services
    C=""
    C=$C" -f ${KITWB_COMPOSE_DIR}/docker-compose.yml"
    C=$C" -f ${KITWB_COMPOSE_DIR}/nosql/local-dev/docker-compose.yml"
    C=$C" -f ${KITWB_COMPOSE_DIR}/sql/local-dev/docker-compose.yml"
    C=$C" -f ${KITWB_COMPOSE_DIR}/queue/docker-compose.yml"
    C=$C" -f ${KITWB_COMPOSE_DIR}/console/docker-compose.yml"
    C=$C" -f ${KITWB_COMPOSE_DIR}/apim/local-dev/docker-compose.yml"

    for SERVICE in $KITWB_SERVICES; do
      DIR="$KITWB_BASE_DIR/kisia-$SERVICE/devops"
      C=$C" -f $DIR/docker-compose.yml"
      if [ ! -f "$DIR/docker-compose.yml" ]; then
        printf "${RED}Can not find docker-compose file!${NC}\n"
        printf "  Service: %s\n" "$SERVICE"
        printf "  Dir: %s\n" "$(pathof $DIR)"
        printf "Directory Contents:\n"
        ls $DIR
        exit -1
      fi
    done
    COMPOSITION=$C
  fi
}

ensure_valid_checkout() {
  if ! is_everything_checked_out; then
    printf "${RED}Please make sure your kisia-repos are checked out at $(pathof $KITWB_BASE_DIR)${NC}\n"
    printf "Consider the 'kd repos clone' command, see the README.md file for more information\n"
    printf "You may also need to configure your credential helpers at this time, for example\n"
    printf " Windows: https://stackoverflow.com/questions/45925964\n"
    printf "          or, if using https and not ssh, then you can use\n"
    printf "            run git config --global credential.helper cache\n"
    printf "          to cache the https credentials after you enter them.\n"
    exit -1
  else
    if ! has_devops_support; then
      printf "${RED}devops support missing for some repositories - please review your checkout, especially the branches.${NC}\n"
      exit -1
    else
      # if we have devops support, then make sure we have a composition
      build_composition
    fi
  fi
}
