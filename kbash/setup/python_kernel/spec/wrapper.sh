#!/bin/bash
NAME=$1
shift 1
OUTPUT=/tmp/output-$NAME
echo "Starting:" >> $OUTPUT
date >> $OUTPUT
echo "$@" >> $OUTPUT
echo "Environment:" >> $OUTPUT
env | sort >> $OUTPUT
echo "Environment End" >> $OUTPUT
"$@" >>$OUTPUT 2>&1
date >> $OUTPUT
echo "Done" >> $OUTPUT

