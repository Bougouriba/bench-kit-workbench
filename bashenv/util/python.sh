#!/bin/bash

create_python3_env() {
  if [ -d "$1" ]; then
    echo "Virtual environment has already been set up"
    echo "Location: $1"
    true
  fi

  echo "#--------------------- Creating Python Venv (start)"
  echo "#"
  echo "python interpreter = $KITWB_PYTHON3"
  echo "venv installation @ $1"
  $KITWB_VIRTUALENV -p $KITWB_PYTHON3 $1 > /dev/null
  echo "#--------------------- Creating Python Venv (end)"
}

check_basic_python_ability() (
if [ "$KITWB_PYTHON3" = "" ]; then
        echo "Missing python3"
        exit -1;
fi
if [ "$KITWB_VIRTUALENV" = "" ]; then
        echo "Missing virtualenv"
        exit -1;
fi
exit 0;
)
