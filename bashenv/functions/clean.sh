#!/bin/bash
function oneline_help_kd_clean() {
  echo "Remove as many artifacts for [C] as we know about"
}

function run_kd_clean() {
  run_environment_func clean $@
}
export -f run_kd_clean oneline_help_kd_clean
