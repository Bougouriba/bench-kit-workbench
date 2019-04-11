#!/bin/bash
function oneline_help_kd_setup() {
  echo "Initialize a setup environment"
}
function help_kd_setup() {
  print_component_help setup
}

function run_kd_setup() {
  local ENV=$(slugify $1)

  if [ "all" = "$ENV" ]; then
    for COMPONENT in $KXX_COMPONENT_LIST ; do
      run_component_func setup $COMPONENT
    done
  else
    if help_on_empty_or_help setup "$ENV"; then
      clear

      if run_component_func setup $@; then
        echo "Setup"
      fi
    else
      echo "kd setup all to setup all"
    fi
  fi
}
