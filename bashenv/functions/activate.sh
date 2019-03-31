#!/bin/bash
function oneline_help_kd_activate() {
  echo "Set up current shell to build component"
}

export KITWB_ACTIVE_DEVENV=

function run_kd_activate() {
  run_environment_func activate $@
  export KITWB_ACTIVE_DEVENV=$(slugify $1)
}
export -f run_kd_activate oneline_help_kd_activate
