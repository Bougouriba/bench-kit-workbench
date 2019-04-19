#!/bin/bash
# Setup

print_help() {
printf "`cat << EOF
${BLUE}kd setup-nvm${NC}

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash


-e|--echo

EOF
`\n\n"

}

run() {
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
}
