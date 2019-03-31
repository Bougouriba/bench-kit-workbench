#!/bin/bash

export JLAB_BASE=$KXX/jupyterlab
export JLAB_PKG_BASE=$JLAB_BASE/packages
#export JLAB_PKG_LIST="application application-extension apputils apputils-extension attachments cells codeeditor codemirror codemirror-extension completer completer-extension console console-extension coreutils csvviewer csvviewer-extension docmanager docmanager-extension docregistry documentsearch documentsearch-extension extensionmanager extensionmanager-extension faq-extension filebrowser filebrowser-extension fileeditor fileeditor-extension help-extension htmlviewer htmlviewer-extension imageviewer imageviewer-extension inspector inspector-extension javascript-extension json-extension launcher launcher-extension mainmenu mainmenu-extension markdownviewer markdownviewer-extension mathjax2 mathjax2-extension metapackage notebook notebook-extension observables outputarea pdf-extension rendermime rendermime-extension rendermime-interfaces running running-extension services settingeditor settingeditor-extension shortcuts-extension statusbar statusbar-extension tabmanager-extension terminal terminal-extension theme-dark-extension theme-light-extension tooltip tooltip-extension ui-components vdom-extension vega4-extension"
export JLAB_PKG_LIST="apputils coreutils docregistry rendermime rendermime-interfaces services"
export JLAB_PKG_LIST="$JLAB_PKG_LIST attachments outputarea fileeditor notebook"
export JLAB_PKG_LIST="$JLAB_PKG_LIST cells application codeeditor codemirror completer console csvviewer docmanager documentsearch extensionmanager filebrowser htmlviewer imageviewer inspector launcher mainmenu markdownviewer mathjax2 metapackage observables running settingeditor statusbar terminal tooltip"
export JLAB_PKG_LIST="$JLAB_PKG_LIST application-extension apputils-extension codemirror-extension completer-extension console-extension csvviewer-extension docmanager-extension documentsearch-extension extensionmanager-extension faq-extension filebrowser-extension fileeditor-extension help-extension htmlviewer-extension imageviewer-extension inspector-extension javascript-extension json-extension launcher-extension mainmenu-extension markdownviewer-extension mathjax2-extension notebook-extension pdf-extension rendermime-extension running-extension settingeditor-extension shortcuts-extension statusbar-extension tabmanager-extension terminal-extension theme-dark-extension theme-light-extension tooltip-extension vdom-extension vega4-extension"

export PHOSPHOR_BASE=$KXX/phosphor
export PHOSPHOR_PKG_BASE=$PHOSPHOR_BASE/packages
export PHOSPHOR_PKG_LIST="algorithm application collections commands coreutils datagrid datastore default-theme disposable domutils dragdrop keyboard messaging properties signaling virtualdom widgets"

export ITYPESCRIPT_BASE=$KXX/itypescript
export ITYPESCRIPT_PKG_BASE=$ITYPESCRIPT_BASE
export ITYPESCRIPT_PKG_LIST="."


# KT for now - need to merge in gitworm, other

export KWB_BASE_DIR=$KXX/workbench
export KWB_NODE_PATH=$KWB_BASE_DIR/node_modules
export KWB_VENV_PATH=$KWB_BASE_DIR/venv
export KWB_BIN_DIR=$KWB_NODE_PATH/.bin
export KWB_YARN=$(command -v yarn)
export KWB_NODE_VERSION=v11.6.0

describe_environment_workbench() {
 report_vars KWB_BASE_DIR KWB_NODE_MODULES_DIR KWB_BIN_DIR KWB_YARN KWB_NODE_VERSION KWB_VENV_PATH
}

activate_environment_workbench() {
	export PATH=$ORIGINAL_PATH

	vet_nvm_environment
	vet_python_environment
	prepare_nvm_and_version $KWB_NODE_VERSION

   if [ ! -d "$KWB_VENV_PATH" ]; then
		kd wb setup
	fi
	#export NODE_OPTIONS="--abort-on-uncaught-exception --max-old-space-size=8192"
	export NODE_OPTIONS="--max-old-space-size=8192"

	export PATH=$KWB_BIN_DIR:$ORIGINAL_PATH
   if [ ! -d "$KWB_VENV_PATH" ]; then
		setup_python_for_workbench
	else
	  . $KWB_VENV_PATH/bin/activate
	fi

   if [ ! -d "$KWB_NODE_PATH" ]; then
		setup_node_for_workbench
	else
    nvm use $KWB_NODE_VERSION
	fi
}

vet_environment_workbench() {
	vet_nvm_environment
	vet_python_environment
}

setup_python_for_workbench() (
	# abort if venv is already present
	if ! create_python3_env $KWB_VENV_PATH; then
		echo "Failed to create python environment"
	fi
	echo "Activating Python3 Environments"
	. $KWB_VENV_PATH/bin/activate
	pip install -r $KWB_BASE_DIR/requirements.txt > /dev/null
	kd wb kernels
)

setup_node_for_workbench() (
  nvm use $KWB_NODE_VERSION

  cd $KWB_BASE_DIR
  npm install -g yarn
  if yarn install; then
	  kd wb regen all
  else
    echo "Yarn install failed, trying to fix this"
  fi
)
