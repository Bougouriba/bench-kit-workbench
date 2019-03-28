#!/bin/bash

function oneline_help_kd_id() {
  echo "Branch, Hash, Change/NoChange of current KD environment."
}

function help_kd_id() {
printf "`cat << EOF
${BLUE}kd id${NC}

Returns the identity of this environment.

For Example:
 $KITWB_BASE_DIR @test:77eeddf, has changes

This indicates that the \$KITWB_BASE_DIR is $KITWB_BASE_DIR,
and that it is checked out to branch 'test', at commiet 77eedf, and that
the bashenv repository itself has changes that are not part of the
public record - it is a custom environment.

EOF
`\n"
}

function run_kd_id() {
  kd require git
  set_git_status .
  printf "$@ $KITWB_BASE_DIR @$BRANCH:$HASH, $STATUS\n"
}
export -f oneline_help_kd_id help_kd_id run_kd_id
