#!/bin/bash
# Activation count


# this just keeps an activation count, for reference
if [ -z "$KITWB_ACTIVATION_COUNT" ]; then
  KITWB_ACTIVATION_COUNT=0
  export ORIGINAL_PATH=$PATH
else
  KITWB_ACTIVATION_COUNT=$(expr $KITWB_ACTIVATION_COUNT + 1 )
fi
export KITWB_ACTIVATION_COUNT
