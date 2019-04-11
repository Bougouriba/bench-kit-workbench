#!/bin/bash
function oneline_help_kd_clean() {
  echo "Remove as many artifacts for [C] as we know about"
}
function help_kd_clean() {
  print_component_help clean
}

function run_kd_clean() {
  run_component_func clean $@
}
