#!/bin/bash
function oneline_help_kd_build() {
  echo "[C] Build [C] using [C] natural build system"
}
function help_kd_build() {

}
function run_kd_build() {
  run_environment_func build $@
}
export -f run_kd_build oneline_help_kd_build



function oneline_help_kd_activate() {
  echo "Configure shell to match build for [C]"
}

function help_kd_activate() {
  print_component_help activate
}

function run_kd_activate() {
  local ENV=$(slugify $1)

  if help_on_empty_or_help "$ENV"; then
    clear

    if run_environment_func activate $@; then
      echo "Activating $ENV"
      echo "   - ran activate_environment_$ENV"
      echo "   - setting KITWB_ACTIVE_DEVENV"
      export KITWB_ACTIVE_DEVENV=$ENV
      echo "   - adjusting prompt"
      reprompt
      echo "   - cd into environment home"
      kd cd $ENV
      echo "   - $PWD"
    fi
  fi

}
