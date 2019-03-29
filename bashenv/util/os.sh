#!/bin/bash
shopt -s extglob

# use color codes inside script
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export BLUE='\033[0;34m'
export YELLOW='\033[0;33m'
export NC='\033[0m' # No Color
export BOLD=$(tput bold)
export NORMAL='\033[22m'


# https://stackoverflow.com/questions/360201/how-do-i-kill-background-processes-jobs-when-my-shell-script-exits
# careful - this will also kill your tree when you encounter a command with an
#           error exit, which may not be what you expect when querying external
#           resources.  so we wrap this in an "prepare_for_long_running_kids"
#           function
prepare_for_long_running_kids() {
  #trap 'exit $rc' INT
  #trap 'exit $rc' TERM
  trap 'exit $?' EXIT
}

prepare_nvm_and_version() {
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
	[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

  # if [ "$(nvm ls $1 )" = "$1" ];
	# TODO - check exit code and verify version
	nvm install $1
  nvm use $1
  npm install -g yarn
}

vet_nvm_environment() {
	if [ "$NVM_DIR" = "" ]; then
		echo "can not find NVM, please visit https://github.com/creationix/nvm"
		exit -1;
	fi
}

create_python3_env() {
  if [ -d "$1" ]; then
    echo "Virtual environment has already been set up"
    true
  fi

  echo "Creating python virtualenv using $KITWB_PYTHON3, loc = $1"
  $KITWB_VIRTUALENV -p $KITWB_PYTHON3 $1 > /dev/null
}

vet_python_environment() (
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


is_being_sourced() {
	echo "${BASH_SOURCE[0]}"
	echo "${0}"
	[[ "${BASH_SOURCE[0]}" != "${0}" ]] && true || false
}

# https://stackoverflow.com/questions/3915040/bash-fish-command-to-print-absolute-path-to-a-file
pathof() {
  # $1 : relative filename
  filename=$1
  parentdir=$(dirname "${filename}")

  if [ -d "${filename}" ]; then
      echo "$(cd "${filename}" && pwd)"
  elif [ -d "${parentdir}" ]; then
    echo "$(cd "${parentdir}" && pwd)/$(basename "${filename}")"
  fi
}

contains() {
  [[ $1 =~ (^|[[:space:]])"$2"($|[[:space:]]) ]]
}

is_windows() {
  [ ! -z "$(uname -a | grep Microsoft)" ]
}

is_osx() {
  [ ! -z "$(uname -a | grep Darwin)" ]
}

pushdir() {
  pushd $1 >/dev/null
}
popdir() {
  popd >/dev/null
}

# https://unix.stackexchange.com/questions/26047/how-to-correctly-add-a-path-to-path
pathadd() {
    newelement=${1%/}
    if [ -d "$1" ] && ! echo $PATH | grep -E -q "(^|:)$newelement($|:)" ; then
        if [ "$2" = "after" ] ; then
            PATH="$PATH:$newelement"
        else
            PATH="$newelement:$PATH"
        fi
    fi
}

pathrm() {
    PATH="$(echo $PATH | sed -e "s;\(^\|:\)${1%/}\(:\|\$\);\1\2;g" -e 's;^:\|:$;;g' -e 's;::;:;g')"
}

error() {
  printf "${RED}%s${NC}\n" "$@"
  exit -1
}
visit() {
  FUNCTION=$1
  shift 1
  for ITEM in $@; do
    $FUNCTION $ITEM
  done
}
export -f pushdir popdir is_osx is_windows contains pathadd pathrm error visit



slugify() {
  STRING="$@"
  if is_windows; then
    echo "not-supported"
  else
    if is_osx; then
      echo "$STRING" | iconv -t ascii//TRANSLIT | sed -E s/[^a-zA-Z0-9]+/_/g | sed -E s/^_+\|_+$//g | tr A-Z a-z
    else
      echo "$STRING" | iconv -t ascii//TRANSLIT | sed -r s/[^a-zA-Z0-9]+/_/g | sed -r s/^_+\|_+$//g | tr A-Z a-z
    fi
  fi
}
export -f slugify

find_dot_sh() (

  DIR="$1"
  if is_windows; then
    echo "not-supported"
  else
    if is_osx; then
      cd $DIR
      find . -name \*.sh | colrm 1 2
    else
      find $DIR -name \*.sh -printf "%P\n"
    fi
  fi
)
export -f find_dot_sh
