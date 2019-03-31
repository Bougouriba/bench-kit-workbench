#!/bin/bash
function oneline_help_kd_build() {
  echo "manage Tool Environment Variables"
}

function run_kd_build() {
  run_environment_func build $@
}
export -f run_kd_build oneline_help_kd_build
