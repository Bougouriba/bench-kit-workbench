#!/bin/bash
function oneline_help_kd_describe() {
  echo "MacGyver It! : Troubleshooting information"
}

function help_kd_describe() {
  print_component_help describe
}

function run_kd_describe() {
  run_component_func describe $@
}
