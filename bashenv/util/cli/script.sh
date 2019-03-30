#!/bin/bash


print_kd_script() {
  INIT_SCRIPT=("$@")
  for CMDLINE in "${INIT_SCRIPT[@]}"; do
    echo "$CMDLINE"
  done
}
exec_kd_script() {
  INIT_SCRIPT=("$@")
  print_kd_script "${INIT_SCRIPT[@]}"
  local LABEL
  local RESULT
  for CMDLINE in "${INIT_SCRIPT[@]}"; do
    LABEL="${BLUE}kd $CMDLINE${NC}\n"
    if kd $CMDLINE; then
      RESULT="${GREEN}Passed${NC}"
      printf "$RESULT $LABEL"
    else
      RESULT="${RED}Failed${NC}"
      printf "$RESULT $LABEL"
      return -1
    fi
  done
}

exec_silent_kd_script() {
  INIT_SCRIPT=("$@")
  for CMDLINE in "${INIT_SCRIPT[@]}"; do
    if ! kd $CMDLINE; then
      return -1
    fi
  done
}

exec_silent_ballistic_kd_script() {
  INIT_SCRIPT=("$@")
  # set +e
  for CMDLINE in "${INIT_SCRIPT[@]}"; do
    kd $CMDLINE;
  done
}
