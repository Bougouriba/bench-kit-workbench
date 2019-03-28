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

export KWB_BASE_DIR=$KITWB_BASE_DIR/workbench
export KWB_NODE_MODULES_DIR=$KWB_BASE_DIR/node_modules
export KWB_BIN_DIR=$KWB_NODE_MODULES_DIR/.bin
export KWB_YARN=$(command -v yarn)
export KWB_NODE_VERSION=v11.6.0
export KWB_VENV_PATH=$KWB_BASE_DIR/venv


activate_workbench_environment() {
	export PATH=$ORIGINAL_PATH

	vet_nvm_environment
	vet_python_environment
	prepare_nvm_and_version $KWB_NODE_VERSION
	#export NODE_OPTIONS="--abort-on-uncaught-exception --max-old-space-size=8192"
	export NODE_OPTIONS="--max-old-space-size=8192"

	. $KWB_VENV_PATH/bin/activate
	export PATH=$KWB_BIN_DIR:$PATH

	activate_devenv workbench
}
