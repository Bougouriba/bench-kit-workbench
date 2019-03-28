#!/bin/bash

export JLAB_BASE=$KITWB_BASE_DIR/jupyterlab
export JLAB_PKG_BASE=$JLAB_BASE/packages
#export JLAB_PKG_LIST="application application-extension apputils apputils-extension attachments cells codeeditor codemirror codemirror-extension completer completer-extension console console-extension coreutils csvviewer csvviewer-extension docmanager docmanager-extension docregistry documentsearch documentsearch-extension extensionmanager extensionmanager-extension faq-extension filebrowser filebrowser-extension fileeditor fileeditor-extension help-extension htmlviewer htmlviewer-extension imageviewer imageviewer-extension inspector inspector-extension javascript-extension json-extension launcher launcher-extension mainmenu mainmenu-extension markdownviewer markdownviewer-extension mathjax2 mathjax2-extension metapackage notebook notebook-extension observables outputarea pdf-extension rendermime rendermime-extension rendermime-interfaces running running-extension services settingeditor settingeditor-extension shortcuts-extension statusbar statusbar-extension tabmanager-extension terminal terminal-extension theme-dark-extension theme-light-extension tooltip tooltip-extension ui-components vdom-extension vega4-extension"
export JLAB_PKG_LIST="apputils coreutils docregistry rendermime rendermime-interfaces services"
export JLAB_PKG_LIST="$JLAB_PKG_LIST attachments outputarea fileeditor notebook"
export JLAB_PKG_LIST="$JLAB_PKG_LIST cells application codeeditor codemirror completer console csvviewer docmanager documentsearch extensionmanager filebrowser htmlviewer imageviewer inspector launcher mainmenu markdownviewer mathjax2 metapackage observables running settingeditor statusbar terminal tooltip"
export JLAB_PKG_LIST="$JLAB_PKG_LIST application-extension apputils-extension codemirror-extension completer-extension console-extension csvviewer-extension docmanager-extension documentsearch-extension extensionmanager-extension faq-extension filebrowser-extension fileeditor-extension help-extension htmlviewer-extension imageviewer-extension inspector-extension javascript-extension json-extension launcher-extension mainmenu-extension markdownviewer-extension mathjax2-extension notebook-extension pdf-extension rendermime-extension running-extension settingeditor-extension shortcuts-extension statusbar-extension tabmanager-extension terminal-extension theme-dark-extension theme-light-extension tooltip-extension vdom-extension vega4-extension"

export PHOSPHOR_BASE=$KITWB_BASE_DIR/phosphor
export PHOSPHOR_PKG_BASE=$PHOSPHOR_BASE/packages
export PHOSPHOR_PKG_LIST="algorithm application collections commands coreutils datagrid datastore default-theme disposable domutils dragdrop keyboard messaging properties signaling virtualdom widgets"

export ITYPESCRIPT_BASE=$KITWB_BASE_DIR/itypescript
export ITYPESCRIPT_PKG_BASE=$ITYPESCRIPT_BASE
export ITYPESCRIPT_PKG_LIST="."


# KT for now - need to merge in gitworm, other

export KT_BASE_DIR=$KITWB_BASE_DIR/workbench

export KT_YARN=$(command -v yarn)
export KT_NODE_VERSION=v11.6.0

export KT_PYTHON=$(command -v python3)
export KT_PIP=$(command -v pip3)
export KT_VIRTUALENV=$(command -v virtualenv)
export KT_VENV_PATH=$KT_BASE_DIR/venv

vet_environment() {
	vet_python_environment
	vet_node_environment
}
activate_environment() {
	activate_python_environment
	activate_node_environment
	true
}

setup_nvm() {
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
	[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
	# TODO - check exit code and verify version
	nvm install $KT_NODE_VERSION
}

vet_node_environment() {
if [ "$NVM_DIR" = "" ]; then
	echo "can not find NVM, please visit https://github.com/creationix/nvm"
	exit -1;
fi
if [ "$KT_YARN" = "" ]; then
	echo "Missing yarn"
	exit -1;
fi

setup_nvm
}


activate_node_environment() {
	setup_nvm
	nvm use $KT_NODE_VERSION
	true
	export NODE_OPTIONS="--abort-on-uncaught-exception --max-old-space-size=8192"
}


vet_python_environment() {
if [ "$KT_PYTHON" = "" ]; then
        echo "Missing python3"
        exit -1;
fi
if [ "$KT_PIP" = "" ]; then
        echo "Missing pip3"
        exit -1;
fi
if [ "$KT_VIRTUALENV" = "" ]; then
        echo "Missing virtualenv"
        exit -1; fi
}

activate_python_environment() {
	. $KT_VENV_PATH/bin/activate
	true
}
