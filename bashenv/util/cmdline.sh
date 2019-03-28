#!/bin/bash

all_services() {
  [ "$ALL_SERVICES" = "true" ]
}

not_all_services() {
  [ ! "$ALL_SERVICES" = "true" ]
}

valid_service() {
  [ ! -z "$SERVICE" ]
}

invalid_service() {
  [ -z "$SERVICE" ]
}

pseudo_service() {
  [ ! -z "$PSEUDO_SERVICE" ]
}

total_confusion() {
  printf "${RED}Please provide a service name, do not understand ${BOLD}${ORIGINAL_ARGS}${NORMAL}${NC}\n"
  printf "Argument should be one of\n"
  for SERVICE in $($AVAILABLE_SERVICE_GENERATOR); do
    printf "  $SERVICE\n"
  done
}

_cmdline_requires_service_or_nothing() {

  ORIGINAL_ARGS=$@
  SERVICE=$1
  # these allow you to override the test "is this a service" and the
   # way in which all services are listed. - for example, this allows
  # a test against keyoniq only services, or all services listed (like nosql)
  SERVICE_TEST=${SERVICE_TEST:-is_service}
  AVAILABLE_SERVICE_GENERATOR=${AVAILABLE_SERVICE_GENERATOR:-all_service_list}

  if [ ! -z "$SERVICE" ]; then
    SERVICE_NAME=${SERVICE%-*}
    SERVICE_VERSION=${SERVICE#*-}
    if [ "$SERVICE_NAME" = "$SERVICE_VERSION" ]; then
      SERVICE_VERSION=""
    fi
    if $SERVICE_TEST $SERVICE; then
      if is_defined_service "$SERVICE-test"; then
        SERVICE_VERSION="test"
        SERVICE="$SERVICE_NAME-$SERVICE_VERSION"
      fi
         shift 1
      ARGS=$@
      ALL_SERVICES=false
    else
      if [ -z "$SERVICE_VERSION" ]; then
        # there is no version, so it is a tag like 'workbench' or an unversioned service
        if $SERVICE_TEST $SERVICE_NAME-test; then
           shift 1
          ARGS=$@
          SERVICE_VERSION=test
          SERVICE=$SERVICE_NAME-test
          ALL_SERVICES=false
        else
          shift 1
          ARGS=$@
          ALL_SERVICES=false
          PSEUDO_SERVICE=$SERVICE
          SERVICE_NAME=""
          SERVICE_VERSION=""
          SERVICE=""
        fi
      else
        # there is a version, let's make sure there is a name
        if [ -z "$SERVICE_NAME" ]; then
          # the first argument is like "-XYZ"
          ARGS=$@
          SERVICE=""
          SERVICE_VERSION=""
          ALL_SERVICES=true
        else
          ALL_SERVICES=false
          SERVICE=""
          if $SERVICE_TEST $SERVICE_NAME-test; then
            printf "${RED}Can not find configuration for version ${BOLD}${SERVICE_VERSION}${NORMAL} of ${BOLD}${SERVICE_NAME}${NORMAL}${NC}\n"
            exit -1
          else
            printf "${RED}Can not find version ${BOLD}${SERVICE_VERSION}${NORMAL} of ${BOLD}${SERVICE_NAME}${NORMAL}, service not found.${NC}\n"
            exit -1
          fi
        fi
      fi
    fi
  else
    ALL_SERVICES=true
    SERVICE=""
    ARGS=""
  fi

}

report_service_list() {
  printf "Available Services:\n"
  for SERVICE in $KITWB_SERVICES; do
    printf "  %s\n" "$SERVICE"
  done
}

cmdline_requires_service_or_nothing() {
  SERVICE_TEST=is_service
  AVAILABLE_SERVICE_GENERATOR=defined_service_list
  _cmdline_requires_service_or_nothing "$@"
}

cmdline_requires_keyoniq_service_or_nothing() {

  SERVICE_TEST=is_keyoniq_service
  AVAILABLE_SERVICE_GENERATOR=keyoniq_service_list
  _cmdline_requires_service_or_nothing "$@"
}
cmdline_requires_keyoniq_service() {

  SERVICE_TEST=is_keyoniq_service
  AVAILABLE_SERVICE_GENERATOR=keyoniq_service_list
  cmdline_requires_service_or_nothing "$@"
  if all_services; then
    print_help
    printf "${RED} Service is required${NC}\n"
    exit -1
  else
    if pseudo_service; then
      printf "${RED} A specific service is required, can not work with ${SERVICE_NAME}${NC}\n"
      report_service_list
      exit -1
    fi
  fi
}


# -------------------------------------------------------------------------------- Libraries
all_libraries() {
  [ "$ALL_LIBRARIES" = "true" ]
}

cmdline_requires_library_or_nothing() {
  LIBRARY_NAME=$1
  LIBRARIES="$KITWB_LIBRARIES"

  if [ ! -z "$LIBRARY_NAME" ]; then
    if is_library $LIBRARY_NAME; then
       shift 1
      ALL_LIBRARIES=false
    else
      printf "${RED}Can not find configuration for library ${LIBRARY_NAME}${NC}\n"
      exit -1
    fi
  else
    ALL_LIBRARIES=true
    LIBRARY_NAME=""
  fi
}

cmdline_requires_library() {
  cmdline_requires_library_or_nothing "$@"
  if all_libraries; then
    printf "${RED}Library name required${NC}\n"
    exit -1
  fi
}


# -------------------------------------------------------------------------------- Repository
cmdline_requires_repo_tag() {
  local REPO_TAG=$1
  SELECTED_REPO=
  SELECTED_REPO_DEVOPS=
  SELECTED_REPO_TAG=

  if [ ! -z "$REPO_TAG" ]; then
    if contains "$KITWB_REPO_TAGS" "$REPO_TAG" ; then
      SELECTED_REPO_TAG=$REPO_TAG
      SELECTED_REPO=$KITWB_BASE_DIR/kisia-$REPO_TAG
      SELECTED_REPO_DEVOPS=$KITWB_BASE_DIR/kisia-$REPO_TAG/devops
    else
      printf "${RED}${REPO_TAG} does not appear to be repository.${NC}\n"
      printf "Repository summary:\n"
      kd repos status
      exit -1
    fi
  else
    printf "${RED}Please identify a repository.${NC}\n"
    print_help
    kd repos status
    exit -1
  fi
}

all_repos() {
  [ -z "$ALL_REPOS" ]
}
is_repo() {
  contains "$KITWB_REPO_TAGS" $1
}

cmdline_requires_repo_tag_or_nothing() {
  local REPO_TAG=$1
  ARGS=
  ALL_REPOS=
  SELECTED_REPO=
  SELECTED_REPO_DEVOPS=
  SELECTED_REPO_TAG=

  if [ ! -z "$REPO_TAG" ]; then
    if is_repo "$REPO_TAG" ; then
      SELECTED_REPO_TAG=$REPO_TAG
      shift 1
      ARGS=$@
      SELECTED_REPO=$KITWB_BASE_DIR/kisia-$REPO_TAG
      SELECTED_REPO_DEVOPS=$KITWB_BASE_DIR/kisia-$REPO_TAG/devops
    else
      printf "${RED}${REPO_TAG} does not appear to be repository.${NC}\n"
      printf "Repository summary:\n"
      kd repos status
      exit -1
    fi
  else
    ALL_REPOS=true
  fi
}
