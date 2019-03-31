#!/bin/bash

export JLAB_BASE=$KXX/jupyterlab
export JLAB_PKG_BASE=$JLAB_BASE/packages
#export JLAB_PKG_LIST="application application-extension apputils apputils-extension attachments cells codeeditor codemirror codemirror-extension completer completer-extension console console-extension coreutils csvviewer csvviewer-extension docmanager docmanager-extension docregistry documentsearch documentsearch-extension extensionmanager extensionmanager-extension faq-extension filebrowser filebrowser-extension fileeditor fileeditor-extension help-extension htmlviewer htmlviewer-extension imageviewer imageviewer-extension inspector inspector-extension javascript-extension json-extension launcher launcher-extension mainmenu mainmenu-extension markdownviewer markdownviewer-extension mathjax2 mathjax2-extension metapackage notebook notebook-extension observables outputarea pdf-extension rendermime rendermime-extension rendermime-interfaces running running-extension services settingeditor settingeditor-extension shortcuts-extension statusbar statusbar-extension tabmanager-extension terminal terminal-extension theme-dark-extension theme-light-extension tooltip tooltip-extension ui-components vdom-extension vega4-extension"
export JLAB_PKG_LIST="apputils coreutils docregistry rendermime rendermime-interfaces services"
export JLAB_PKG_LIST="$JLAB_PKG_LIST attachments outputarea fileeditor notebook"
export JLAB_PKG_LIST="$JLAB_PKG_LIST cells application codeeditor codemirror completer console csvviewer docmanager documentsearch extensionmanager filebrowser htmlviewer imageviewer inspector launcher mainmenu markdownviewer mathjax2 metapackage observables running settingeditor statusbar terminal tooltip"
export JLAB_PKG_LIST="$JLAB_PKG_LIST application-extension apputils-extension codemirror-extension completer-extension console-extension csvviewer-extension docmanager-extension documentsearch-extension extensionmanager-extension faq-extension filebrowser-extension fileeditor-extension help-extension htmlviewer-extension imageviewer-extension inspector-extension javascript-extension json-extension launcher-extension mainmenu-extension markdownviewer-extension mathjax2-extension notebook-extension pdf-extension rendermime-extension running-extension settingeditor-extension shortcuts-extension statusbar-extension tabmanager-extension terminal-extension theme-dark-extension theme-light-extension tooltip-extension vdom-extension vega4-extension"
export JLAB_NODE_VERSION=v11.6.0




clean_environment_jupyterlab() {
  local LIST="$JLAB_PKG_LIST"
  if [ ! -z "$@" ]; then
          LIST="$@"
  fi
  run_batch_packages_job "rm -rf node_modules" "JupyterLab" "$LIST" "$JLAB_PKG_BASE"
}
clean_environment_jupyterlab_help() {
  printf "`cat << EOF
${BLUE}kd build phosphor${NC}

EOF
`\n"
}


build_environment_jupyterlab() {
  local LIST="$JLAB_PKG_LIST"
  if [ ! -z "$@" ]; then
          LIST="$@"
  fi
  run_batch_packages_job "yarn --silent build" "JupyterLab" "$LIST" "$PHOSPHOR_PKG_BASE"
}
build_environment_jupyterlab_help() {
printf "`cat << EOF
${BLUE}kd build phosphor${NC}

EOF
`\n"
}


setup_environment_jupyterlab() {
  local LIST="$JLAB_PKG_LIST"
  if [ ! -z "$@" ]; then
          LIST="$@"
  fi
  prepare_nvm_and_version $JLAB_NODE_VERSION
  yarn --silent global add typescript
  run_batch_packages_job "yarn --silent install" "JupyterLab" "$LIST" "$JLAB_PKG_BASE"
  run_batch_packages_job "yarn --silent build" "JupyterLab" "$LIST" "$JLAB_PKG_BASE"
  run_batch_packages_job "yarn --silent link" "JupyterLab" "$LIST" "$JLAB_PKG_BASE"
}
setup_environment_jupyterlab_help() {
printf "`cat << EOF
${BLUE}kd setup phosphor${NC}

EOF
`\n"
}


describe_environment_jupyterlab() {
  local LIST="$JLAB_PKG_LIST"
  if [ ! -z "$@" ]; then
          LIST="$@"
  fi
  report_vars "phosphor Build Environment" JLAB_BASE JLAB_NODE_MODULES JLAB_NODE_VERSION
  local COMPONENT
  for COMPONENT in $LIST; do
    local DIR="$JLAB_PKG_BASE/$COMPONENT/node_modules"
    if [ -d $DIR ]; then
      echo "... $COMPONENT : node_modules present"
    else
      echo "... $COMPONENT : node_modules does not exist"
    fi
  done
  rm -rf ~/.config/yarn/link/\@jupyterlab

}
describe_environment_jupyterlab_help() {
printf "`cat << EOF
${BLUE}kd activate jupyterlab${NC}

EOF
`\n"
}



activate_environment_jupyterlab() {
  echo "JupyterLab Environment Enabled"
  prepare_nvm_and_version $JLAB_NODE_VERSION
  #export NODE_PATH=$JLAB_NODE_MODULES
}
activate_environment_jupyterlab_help() {
printf "`cat << EOF
${BLUE}kd activate
${NC}

EOF
`\n"
}


vet_environment_jupyterlab() {
  if check_basic_node_ability; then
    echo "Vet Environment JupyterLab"
    true
  else
    false
  fi
}
