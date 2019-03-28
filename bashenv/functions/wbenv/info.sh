#!/bin/bash
function oneline_help_kd_wbenv_info() {
  echo "Workbench environment information"
}

function help_kd_wbenv_info() {
printf "`cat << EOF
${BLUE}kd wbenv info${NC}

EOF
`\n\n"
}

function run_kd_wbenv_info() {
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
}
export -f run_kd_wbenv_info help_kd_wbenv_info oneline_help_kd_wbenv_info
