#!/bin/bash


export DOCS_BASE=$KITWB/docs
export DOCS_NODE_VERSION=
export DOCS_NODE_MODULES=$DOCS_BASE/node_modules

export DOCS_LERNA_PACKAGES=$DOCS_BASE/packages

export DOCS_RUBY_VERSION=ruby-head

export DOCS_PYTHON_VERSION=3.6.2
export DOCS_VENV=$DOCS_BASE/venv

export DOCS_LOG=$DOCS_BASE/setup-logs

oneline_description_of_ENTRYPOINT_docs() {
  echo "Description of docs"
}
export -f oneline_description_of_ENTRYPOINT_docs

vet_environment_ENTRYPOINT_docs() {
  check_basic_python_ability
}
export -f vet_environment_ENTRYPOINT_docs

describe_environment_ENTRYPOINT_docs_help() {
printf "`cat << EOF
${BLUE}ENTRYPOINT describe docs${NC}

EOF
`\n"
}
export -f describe_environment_ENTRYPOINT_docs_help

describe_environment_ENTRYPOINT_docs() {
  echo "Component[docs]:describe"

  report_vars "docs Build Environment" \
    DOCS \
    DOCS_BASE \
    rvm_path \
    DOCS_RUBY_VERSION\
    DOCS_PYTHON_VERSION\
    DOCS_VENV
}
export -f describe_environment_ENTRYPOINT_docs
