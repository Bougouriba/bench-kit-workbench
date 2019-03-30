#!/bin/bash
# Why is this paths

function print_help() {
printf "`cat << EOF
${BLUE}kd wb env${NC}

EOF
`\n\n"
}

function run() {
  echo "KWB_BASE_DIR    :"$KWB_BASE_DIR
  echo "KWB_YARN        :"$KWB_YARN
  echo "KWB_NODE_VERSION:"$KWB_NODE_VERSION
  echo "KWB_PYTHON      :"$KWB_PYTHON
  echo "KWB_PIP         :"$KWB_PIP
  echo "KWB_VIRTUALENV  :"$KWB_VIRTUALENV
  echo "KWB_VENV_PATH   :"$KWB_VENV_PATH
  echo ""
  echo ""
  report_node_env

  echo ""
  echo "PATH:"
  echo $PATH

  if [ "$KITWB_ACTIVE_DEVENV" = "workbench" ]; then
    echo "Workbench Development Environment is activated"
  else
    echo "Not Activated : Workbench Development Environment is not activated."
    if [ -d "$KWB_VENV_PATH" ]; then
      echo "The python environment can be activated, there is a valid virtual env"
    else
      echo "The python environment is not installed"
      echo "try kd kk setup"
    fi
  fi

}
