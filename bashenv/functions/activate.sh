#!/bin/bash
function oneline_help_kd_activate() {
  echo "manage Tool Environment Variables"
}

function help_kd_activate() {
printf "`cat << EOF
${BLUE}kd activate [SUBCOMMAND] ...${NC}

activate one of the development contexts
EOF
`\n\n"

}

export KITWB_ACTIVE_DEVENV=


function run_kd_activate() {
  TAG=$(slugify $1)
  if [ "" = "$1" ]; then
    help_kd_activate
  else
    if vet_environment_$TAG; then
    	if activate_environment_$TAG; then
         KITWB_ACTIVE_DEVENV=$TAG
	      kd $1 env 
      else
        echo "Unable to activate environment for $1, try kd $TAG reset"
      fi
    else
      echo "Unable to activate environment for $1"
    fi
  fi
}
export -f run_kd_activate help_kd_activate oneline_help_kd_activate
