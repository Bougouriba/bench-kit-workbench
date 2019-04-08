#!/bin/bash
# initsheets

print_help() {
printf "`cat << EOF
${BLUE}kd py shell${NC}

write out commands to add and tag initial sheets

EOF
`\n"
}

run() {
	local CONFIG="$HOME/.kit-workbench"
	if [ ! -d "$CONFIG" ]; then
		mkdir $CONFIG
	fi

	local VENV="$CONFIG/venv"
        if [ ! -d "$VENV" ]; then
                mkdir $VENV
		virtualenv -p python3 $VENV
		. $VENV/bin/activate
		pip install ipykernel
		pip install ~/Desktop/kit-workbench/workbench/kernel-env-adapter
		kd wb kernels
		cp -r ~/Desktop/kit-workbench/workbench/venv/share/jupyter/kernels/* ~/.kit-workbench/venv/share/jupyter/kernels/
	fi

	exec /bin/bash --init-file "$KXX/activate.sh" --init-file "$VENV/bin/activate"
}
