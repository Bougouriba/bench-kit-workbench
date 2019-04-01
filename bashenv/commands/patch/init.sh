#!/bin/bash
# init

print_help() {
printf "`cat << EOF
${BLUE}kd tool init${NC}

write out commands to add and tag initial sheets

EOF
`\n"
}

run() {
tool docptr clear
tool docptr --name "Root" add --tag folder --update google-folder --folder 1yps_2jM0npAXUX1mfn-ibuQN2uE3_sOD
tool docptr --name "Model" add --tag folder --update google-folder --folder 1MQLshPVNmaqv4Iw3o6T1L9b70kaLj7X5
tool docptr list
tool google drive-scan --folder Model --type folder --docptrs --tag model --tag sheets --tag all --json w:model-folder-scan.json --json-dp-create
tool google drive-scan --folder sovrin --type worksheet --docptrs --tag sovrin --tag sheets --tag all --json w:sovrin-scan.json --json-dp-create
tool google drive-scan --folder Model --type worksheet --docptrs --tag model --tag global --json w:global-scan.json --json-dp-create
tool google model-download --using sovrin --json w:result
tool docptr resolve --using sovrin
}
