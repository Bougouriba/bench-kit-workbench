#!/bin/bash

export DOCS_BASE=$KXX/docs
export DOC_VIEWER_BASE=$KXX/nteract-docs
export DOCS_NODE_VERSION=v11.6.0


clean_environment_docs() {
  echo "clean_environment_docs"
}
clean_environment_docs_help() {
  printf "`cat << EOF
${BLUE}kd build docs${NC}

EOF
`\n"
}


build_environment_docs() {
  prepare_nvm_and_version $DOCS_NODE_VERSION
  cd $DOC_VIEWER_BASE
  yarn clean
  yarn install
  npn run build
}
build_environment_docs_help() {
printf "`cat << EOF
${BLUE}kd build docs${NC}

EOF
`\n"
}


setup_environment_docs() {
  prepare_nvm_and_version $DOCS_NODE_VERSION

  # TODO only if we can't find yarn
  echo "Installing Yarn"
  npm install -g yarn

  # TODO only if we can't find lerna
  echo "Installing Lerna"
  yarn global add lerna
}
setup_environment_docs_help() {
printf "`cat << EOF
${BLUE}kd setup docs${NC}

EOF
`\n"
}


describe_environment_docs() {
  report_vars "docs Build Environment" DOCS_BASE DOCS_NODE_VERSION DOC_VIEWER_BASE
}
describe_environment_docs_help() {
printf "`cat << EOF
${BLUE}kd activate docs${NC}

EOF
`\n"
}



activate_environment_docs() {
  echo "Docs Environment Enabled"
  prepare_nvm_and_version $DOCS_NODE_VERSION
  #export NODE_PATH=$DOCS_NODE_MODULES
}
activate_environment_docs_help() {
printf "`cat << EOF
${BLUE}kd activate docs${NC}

EOF
`\n"
}


vet_environment_docs() {
  if check_basic_node_ability; then
    echo "Veted Environment for Docs - basic node ability for $DOCS_NODE_VERSION confirmed."
    true
  else
    false
  fi
}
