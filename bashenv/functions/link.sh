#!/bin/bash
function oneline_help_kd_link() {
  echo "manage yarn-package linking"
}

function run_kd_link() {
  run_environment_func link $@
}
export -f run_kd_link oneline_help_kd_link
