#!/bin/bash
# copy kernels

print_help() {
printf "`cat << EOF
${BLUE}kd wb dist${NC}

Install tarballs of dependencies to make sure that electron-builder
can follow the links

EOF
`\n"
}

run() {

	kd wb kernels
	prepare_nvm_and_version $KWB_NODE_VERSION

	cd $KWB_BASE_DIR

	echo ""

	#for P in $PHOSPHOR_PKG_LIST; do
	#	yarn install \@phosphor/$P
	#done
	#for J in $JLAB_PKG_LIST; do
	#	yarn install \@jupyterlab/$J
	#done

	#rm -rf node_modules/\@phosphor
	#for P in $PHOSPHOR_PKG_LIST; do
	#	yarn unlink \@phosphor/$P
	#done
	#yarn install --force


	#for J in $JLAB_PKG_LIST; do
	#	yarn unlink \@jupyterlab/$J
	#done
	#rm -rf node_modules/\@jupyterlab
	#yarn install --force

	rm -rf node_modules
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
	link_phosphor $KWB_BASE_DIR
	link_jupyterlab $KWB_BASE_DIR

}
