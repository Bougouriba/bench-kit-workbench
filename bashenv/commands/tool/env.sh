#!/bin/bash
# "Workbench environment information"

function print_help() {
printf "`cat << EOF
${BLUE}kd toolenv info${NC}

EOF
`\n\n"
}

function run() {
  echo "KT_BASE_DIR    :"$KT_BASE_DIR
  echo "KT_YARN        :"$KT_YARN
  echo "KT_NODE_VERSION:"$KT_NODE_VERSION
  echo "KT_PYTHON      :"$KT_PYTHON
  echo "KT_PIP         :"$KT_PIP
  echo "KT_VIRTUALENV  :"$KT_VIRTUALENV
  echo "KT_VENV_PATH   :"$KT_VENV_PATH
  echo ""
  echo ""
  echo "NVM_DIR       ="$NVM_DIR
  echo "NVM_CD_FLAGS  ="$NVM_CD_FLAGS
  echo "NVM_BIN       ="$NVM_BIN
  echo ""

  if [ "$KITWB_ACTIVE_DEVENV" = "tool" ]; then
    echo "CLI Tool Environment is activated"
  else
    echo "Not Activated : CLI Tool Environment is not activated."
    if [ -d "$KT_VENV_PATH" ]; then
      echo "The python environment can be activated, there is a valid virtual env"
    else
      echo "The python environment is not installed"
      echo "try kd kk setup"
    fi
  fi

}
