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

  if [ "true" = "$KT_ENV_ACTIVATED" ]; then
    echo "Tool Environment is Activated"
  else
    echo "tool environment has not been activated"
    if [ -d "$KT_VENV_PATH" ]; then
      echo "The tool environment can be activated"
    else
      echo "The tool environment is not installed"
      echo "try kd tool install"
    fi
  fi
  if [ "true" = "$KWB_ENV_ACTIVATED" ]; then
    echo "Workbook Environment is Activated"
  else
    echo "Workbook environment has not been activated"
  fi

}
