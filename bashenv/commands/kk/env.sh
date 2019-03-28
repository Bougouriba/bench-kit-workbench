#!/bin/bash
# "Workbench environment information"

function print_help() {
printf "`cat << EOF
${BLUE}kd toolenv info${NC}

EOF
`\n\n"
}

function run() {
  echo "KK_BASE_DIR    :"$KK_BASE_DIR
  echo "KK_YARN        :"$KK_YARN
  echo "KK_NODE_VERSION:"$KK_NODE_VERSION
  echo "KK_PYTHON      :"$KK_PYTHON
  echo "KK_PIP         :"$KK_PIP
  echo "KK_VIRTUALENV  :"$KK_VIRTUALENV
  echo "KK_VENV_PATH   :"$KK_VENV_PATH
  echo ""
  echo ""

  if [ "$KITWB_ACTIVE_DEVENV" = "kk" ]; then
    echo "Kisia Kernel Environment is activated"
  else
    echo "Not Activated : Kisia Kernel Environment is not activated."
    if [ -d "$KK_VENV_PATH" ]; then
      echo "The python environment can be activated, there is a valid virtual env"
    else
      echo "The python environment is not installed"
      echo "try kd kk setup"
    fi
  fi

}
