#!/bin/bash

export KITWB=$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )
. /home/ewelton/.k-bashenv/util/activation/activate.sh\
  "kd"  \
  "KITWB" \
  "util/kernels.sh"    \
  ""
