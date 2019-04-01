#!/bin/bash
# copy kernels

print_help() {
printf "`cat << EOF
${BLUE}kd wb dist${NC}

Run yarn install and yarn tsc in the itypescript
repository, then unlink, then link

EOF
`\n"
}

run() {

	kd wb kernels
	prepare_nvm_and_version $KWB_NODE_VERSION

	cd $KWB_BASE_DIR

	echo ""
	rm -rf node_modules/\@jupyterlab
	rm -rf node_modules/\@phosphor
	yarn install

	if is_windows; then
		echo "Windows not suppported"
	else
		if is_osx; then
			yarn dist:mac
		else
			yarn dist:linux
		fi
	fi

	echo "Relinking Phosphor and Jupyter to use yarn link'd copies"
	# now relink jupyter and phosphor
	#link_phosphor $KWB_BASE_DIR
	#link_jupyterlab $KWB_BASE_DIR

}
