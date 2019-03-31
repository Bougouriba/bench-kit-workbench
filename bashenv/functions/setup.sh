#!/bin/bash
function oneline_help_kd_setup() {
  echo "manage Tool Environment Variables"
}

function run_kd_setup() {
  run_environment_func setup $@
}
export -f run_kd_setup oneline_help_kd_setup
