#!/bin/bash
# view docs

print_help() {
printf "`cat << EOF
${BLUE}kd docs open${NC}

Run newly built nteract

EOF
`\n"
}

run() (
  activate_environment_docs
  cd $KXX/docs
  if is_osx; then
	open ../nteract-docs/applications/desktop/dist/mac/nteract.app/ ../nteract-docs/applications/desktop/ ./Intro.ipynb
  else
	echo "only osx supported at the moment"
  fi
)
