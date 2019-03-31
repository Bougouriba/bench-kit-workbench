#!/bin/bash
# Tasks managing the workbench environment

run_batch_packages_job() {
	local CMD="$1"
	local SCOPE="$2"
	local ELT_LIST="$3"
	local BASE="$4"

	local MAX=5

	local COUNT=0
	echo "$SCOPE:run_batch_packages_job $CMD, parallel running of :"
	for x in $ELT_LIST; do
		echo -n "   $x -> $CMD, "
		cd $BASE/$x && $CMD &
		COUNT=$(expr $COUNT + 1 )
		if [ $(expr $COUNT % $MAX ) == 0 ]; then
			echo
			wait
			echo "Continuing run_batch_packages_job $CMD for $SCOPE : "
		fi
	done
	echo
	wait
}

visit() {
  FUNCTION=$1
  shift 1
  for ITEM in $@; do
    $FUNCTION $ITEM
  done
}
export -f visit run_batch_packages_job
