#!/bin/bash
function oneline_help_kd_clean() {
  echo "manage Tool Environment Variables"
}

function run_kd_clean() {
  run_environment_func clean $@
}
export -f run_kd_clean oneline_help_kd_clean
