#!/bin/bash
# initsheets

print_help() {
printf "`cat << EOF
${BLUE}kd py nteract${NC}

write out commands to add and tag initial sheets

EOF
`\n"
}

run() (
	cd $HOME/Desktop/kisia-gitworm
	. ~/.kit-workbench/venv/bin/activate
	export KITWB_KERNELSPECS=$HOME/.kit-workbench/venv/share/jupyter/kernels
	open -a /Applications/nteract.app ./binder/Intro.ipynb
)
