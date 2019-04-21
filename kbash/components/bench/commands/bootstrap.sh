#!/bin/bash
# Just fetch updates

print_help() {
printf "`cat << EOF
${BLUE}kd bootstrap ${NC}

EOF
`\n\n"

}

run() {
  if check_basic_node_ability; then
    if check_basic_python_ability; then
  	kd update
  	kd clean
  	kd setup
  	kd build
    else
    	echo "python3 missing - aborting bootstrap"
    fi
  else
    echo "nvm missing - aborting bootstrap"
  fi
}
