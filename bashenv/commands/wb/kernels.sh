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

	rm -rf $KT_VENV_PATH/share/jupyter/kernels/*
	for KERNEL in sovrin kisia-ts kisia-cli veres.one vc-test-suite rwot-js; do
		echo "Copying Kernel-Spec $KERNEL from kernels/$KERNEL"
		cp -r $KT_BASE_DIR/kernels/$KERNEL $KT_VENV_PATH/share/jupyter/kernels/$KERNEL
	done

}
