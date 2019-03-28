#!/bin/bash

function oneline_help_kd_env() {
  echo "Display current environment settings."
}

function help_kd_env() {
printf "`cat << EOF
${BLUE}kd env${NC}

EOF
`\n"
}

function run_kd_env() {
  local WIDTH=28
  printf "Environment settings\n"
  printf "%${WIDTH}s %s\n" "KITWB_BASE_DIR" "$KITWB_BASE_DIR"
  printf "%${WIDTH}s %s\n" "KITWB_COMPOSE_DIR" "$KITWB_COMPOSE_DIR"
  printf "%${WIDTH}s %s\n" "KITWB_DEVOPS_DIR" "$KITWB_DEVOPS_DIR"
  printf "%${WIDTH}s %s\n" "KITWB_DOCKER_COMPOSE_PATH" "$KITWB_DOCKER_COMPOSE_PATH"
  printf "%${WIDTH}s %s\n" "KITWB_DOCKER_PATH" "$KITWB_DOCKER_PATH"
  printf "%${WIDTH}s %s\n" "KITWB_DOCKER_VERBOSE" "$KITWB_DOCKER_VERBOSE"
  printf "%${WIDTH}s %s\n" "KITWB_BASH_COMMAND_DIR" "$KITWB_BASH_COMMAND_DIR"
  printf "%${WIDTH}s %s\n" "KITWB_BASH_FUNCTION_DIR" "$KITWB_BASH_FUNCTION_DIR"
  printf "%${WIDTH}s %s\n" "KITWB_BASH_UTIL_DIR" "$KITWB_BASH_UTIL_DIR"
  printf "%${WIDTH}s %s\n" "KITWB_LIBRARIES" "$KITWB_LIBRARIES"
  printf "%${WIDTH}s %s\n" "KITWB_NODE_PATH" "$KITWB_NODE_PATH"
  printf "%${WIDTH}s %s\n" "KITWB_PACKAGES" "$KITWB_PACKAGES"
  printf "%${WIDTH}s %s\n" "KITWB_REPO_TAGS" "$KITWB_REPO_TAGS"
  printf "%${WIDTH}s %s\n" "KITWB_SCRIPTS_DIR" "$KITWB_SCRIPTS_DIR"
  printf "%${WIDTH}s %s\n" "KITWB_SERVICES" "$KITWB_SERVICES"
  printf "%${WIDTH}s %s\n" "KITWB_TEMPLATES_DIR" "$KITWB_TEMPLATES_DIR"

  run_kd_wbenv_info
  run_kd_toolenv_info
}
export -f run_kd_env help_kd_env oneline_help_kd_env
