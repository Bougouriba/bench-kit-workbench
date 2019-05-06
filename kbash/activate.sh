#!/bin/bash

# uncommenting this line will cause trace output
#export KBASH_TRACE=true

export KITWB="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"

# change this if you did not clone into ~/.kbash
. ~/.kbash/boot.sh\
    "kd"  \
    "KITWB"  \
    "kernels.sh"            \
    "python node ruby"
#:
#: # activate.sh
#:
#:
#:
#:
#:
#:
#:
