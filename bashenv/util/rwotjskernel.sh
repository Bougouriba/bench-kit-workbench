#!/bin/bash


# KT for now - need to merge in gitworm, other

export RWOT_JS_BASE_DIR=$KITWB_BASE_DIR/kernels/rwot_js_kernel
export RWOT_JS_NODE_MODULES_DIR=$RWOT_JS_BASE_DIR/node_modules
export RWOT_JS_BIN_DIR=$RWOT_JS_NODE_MODULES_DIR/.bin
export RWOT_JS_YARN=$RWOT_JS_BIN_DIR/yarn
export RWOT_JS_NODE_VERSION=v11.6.0


activate_rwot_js_environment() {
	prepare_nvm_and_version $RWOT_JS_NODE_VERSION
	#export NODE_OPTIONS="--abort-on-uncaught-exception --max-old-space-size=8192"
	NODE_OPTIONS="--max-old-space-size=8192"
	RWOT_JS_BASE_DIR=$KITWB_BASE_DIR/kernels/rwot_js_kernel
}
