#!/bin/bash
# build local dev version

print_help() {
printf "`cat << EOF
${BLUE}kd wb local${NC}

build local dev version and run it with ```electron .```

EOF
`\n"
}

run() {

	kd wb kernels
	kd wb dev-python
	kd wb dev-node
	yarn build
}
