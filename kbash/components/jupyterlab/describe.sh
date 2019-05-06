#!/bin/bash


export JLAB_BASE=$KITWB/jupyterlab
export JLAB_NODE_VERSION=v11.6.0
export JLAB_NODE_MODULES=$JLAB_BASE/node_modules

export JLAB_LERNA_PACKAGES=$JLAB_BASE/packages

export JLAB_PYTHON_VERSION=3.6.2
export JLAB_VENV=$JLAB_BASE/venv

export JLAB_LOG=$JLAB_BASE/setup-logs

oneline_description_of_kd_jupyterlab() {
  echo "Description of jupyterlab"
}
export -f oneline_description_of_kd_jupyterlab

vet_environment_kd_jupyterlab() {
  check_basic_python_ability && check_basic_node_ability
}
export -f vet_environment_kd_jupyterlab

describe_environment_kd_jupyterlab_help() {
printf "`cat << EOF
${BLUE}kd describe jupyterlab${NC}

EOF
`\n"
}
export -f describe_environment_kd_jupyterlab_help

describe_environment_kd_jupyterlab() {
  echo "Component[jupyterlab]:describe"

  report_vars "jupyterlab Build Environment" \
      JLAB_BASE\
      JLAB_NODE_VERSION\
      JLAB_PYTHON_VERSION
}
export -f describe_environment_kd_jupyterlab



export JLAB_PACKAGE_LIST=""
JLAB_PACKAGELIST+=" application"
JLAB_PACKAGELIST+=" apputils"
JLAB_PACKAGELIST+=" attachments"
JLAB_PACKAGELIST+=" cells"
JLAB_PACKAGELIST+=" codeeditor"
JLAB_PACKAGELIST+=" codemirror"
JLAB_PACKAGELIST+=" completer"
JLAB_PACKAGELIST+=" console"
JLAB_PACKAGELIST+=" coreutils"
JLAB_PACKAGELIST+=" csvviewer"
JLAB_PACKAGELIST+=" docmanager"
JLAB_PACKAGELIST+=" docregistry"
JLAB_PACKAGELIST+=" documentsearch"
JLAB_PACKAGELIST+=" filebrowser"
JLAB_PACKAGELIST+=" fileeditor"
JLAB_PACKAGELIST+=" htmlviewer"
JLAB_PACKAGELIST+=" imageviewer"
JLAB_PACKAGELIST+=" inspector"
JLAB_PACKAGELIST+=" launcher"
JLAB_PACKAGELIST+=" mainmenu"
JLAB_PACKAGELIST+=" markdownviewer"
JLAB_PACKAGELIST+=" mathjax2"
JLAB_PACKAGELIST+=" notebook"
JLAB_PACKAGELIST+=" observables"
JLAB_PACKAGELIST+=" outputarea"
JLAB_PACKAGELIST+=" rendermime"
JLAB_PACKAGELIST+=" rendermime-interfaces"
JLAB_PACKAGELIST+=" running"
JLAB_PACKAGELIST+=" services"
JLAB_PACKAGELIST+=" settingeditor"
JLAB_PACKAGELIST+=" statusbar"
JLAB_PACKAGELIST+=" terminal"
JLAB_PACKAGELIST+=" tooltip"
JLAB_PACKAGELIST+=" ui-components"
JLAB_PACKAGELIST+=" vdom"

JLAB_PACKAGELIST+=" application-extension"
JLAB_PACKAGELIST+=" apputils-extension"
JLAB_PACKAGELIST+=" codemirror-extension"
JLAB_PACKAGELIST+=" completer-extension"
JLAB_PACKAGELIST+=" console-extension"
JLAB_PACKAGELIST+=" csvviewer-extension"
JLAB_PACKAGELIST+=" docmanager-extension"
JLAB_PACKAGELIST+=" documentsearch-extension"
JLAB_PACKAGELIST+=" extensionmanager"
JLAB_PACKAGELIST+=" extensionmanager-extension"
JLAB_PACKAGELIST+=" faq-extension"
JLAB_PACKAGELIST+=" filebrowser-extension"
JLAB_PACKAGELIST+=" fileeditor-extension"
JLAB_PACKAGELIST+=" help-extension"
JLAB_PACKAGELIST+=" htmlviewer-extension"
JLAB_PACKAGELIST+=" imageviewer-extension"
JLAB_PACKAGELIST+=" inspector-extension"
JLAB_PACKAGELIST+=" javascript-extension"
JLAB_PACKAGELIST+=" json-extension"
JLAB_PACKAGELIST+=" launcher-extension"
JLAB_PACKAGELIST+=" mainmenu-extension"
JLAB_PACKAGELIST+=" markdownviewer-extension"
JLAB_PACKAGELIST+=" mathjax2-extension"
JLAB_PACKAGELIST+=" notebook-extension"
JLAB_PACKAGELIST+=" pdf-extension"
JLAB_PACKAGELIST+=" rendermime-extension"
JLAB_PACKAGELIST+=" running-extension"
JLAB_PACKAGELIST+=" settingeditor-extension"
JLAB_PACKAGELIST+=" shortcuts-extension"
JLAB_PACKAGELIST+=" statusbar-extension"
JLAB_PACKAGELIST+=" tabmanager-extension"
JLAB_PACKAGELIST+=" terminal-extension"
JLAB_PACKAGELIST+=" theme-dark-extension"
JLAB_PACKAGELIST+=" theme-light-extension"
JLAB_PACKAGELIST+=" tooltip-extension"
JLAB_PACKAGELIST+=" vdom-extension"
JLAB_PACKAGELIST+=" vega4-extension"
JLAB_PACKAGELIST+=" vega5-extension"

