#!/bin/bash
function oneline_help_kd_describe() {
  echo "MacGyver It! : Troubleshooting information"
}

function run_kd_describe() {
  run_environment_func describe $@
}
export -f run_kd_describe oneline_help_kd_describe
