#!/bin/bash
# report KIT-Workbench environment

print_help() {
printf "`cat << EOF
get updates
update all submodules
EOF
`\n"
}

run() (
  cd $KITWB

  report_heading "Fetching --all Data"
  git fetch --all

  report_heading "Applying Updates"
  git pull

  report_heading "Updating Submodules"
  git submodule update --init

  report_ok "Done"

)
