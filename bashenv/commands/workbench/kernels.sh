#!/bin/bash
# copy kernels

print_help() {
printf "`cat << EOF
${BLUE}kd wb kernels${NC}

Run yarn install and yarn tsc in the itypescript
repository, then unlink, then link

EOF
`\n"
}

run() {

	local KDIR=$KWB_VENV_PATH/share/jupyter/kernels
	rm -rf $KDIR/*
	local KERNELS=$(ls -1 $KWB_BASE_DIR/kernel-specs)
	for KERNEL in $KERNELS; do
		echo "Copying Kernel-Spec $KERNEL from kernel-specs/$KERNEL"
		cp -r $KWB_BASE_DIR/kernel-specs/$KERNEL $KDIR/$KERNEL
	done

	local KK_VENV=$KXX/kernels/kisia_cli/venv
	local TARGET=$KDIR/kisia-cli/venv
	rm -rf $TARGET
	echo "Copying Kisia-CLI from $KK_VENV to $TARGET"
	cp -r $KK_VENV $TARGET

}
