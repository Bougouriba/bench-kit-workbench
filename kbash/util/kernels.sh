#!/bin/bash

export KITWB_INSTALLED_KERNEL_DIR=$KITWB/installed-kernels/kernels

kd_install_node_kernel() {
  local KERNEL=$1
  local BASE=$2
  report_heading "Install $KERNEL"

  local DEST=$(ensure_empty_dir $KITWB_INSTALLED_KERNEL_DIR/$KERNEL)
  local SRC=$BASE/dist
  cp -r $SRC/* $DEST

  cat $DEST/kernel.json-template \
      | sed "s|INSTALLATION_BASE|$DEST|g" \
      | sed "s|INSTALLATION_NODE_PATH|$DEST/node_modules|g" \
      > $DEST/kernel.json
  chmod +x $DEST/wrapper.sh

  report_ok "Installed $KERNEL in $DEST"
}
export -f kd_install_node_kernel

kd_package_node_kernel() (
  local KERNEL=$1
  local BASE=$2
  report_heading "Package $KERNEL"

  local DIST=$(ensure_empty_dir $BASE/dist)
  cp -r $BASE/spec/* $DIST
  cp -r $BASE/package.json $DIST
  mkdir $DIST/working-dir
  mv $DIST/tsconfig.json $DIST/working-dir
  mv $DIST/Introduction.ipynb $DIST/working-dir

  activate_environment_kd_$KERNEL
  cd $DIST && npm install
)
export -f kd_package_node_kernel

kd_patch_node_kernel() (
  local KERNEL=$1
  local BASE=$2
  report_heading "Patch $KERNEL"

  local DIST=$BASE/dist
  cp -r $BASE/spec/* $DIST
  cp -r $BASE/package.json $DIST
  mv $DIST/tsconfig.json $DIST/working-dir
  mv $DIST/Introduction.ipynb $DIST/working-dir
)
export -f kd_patch_node_kernel



kd_install_python_kernel() (
  local KERNEL=$1
  local BASE=$2
  report_heading "install tool_kernel"

  local DEST=$(ensure_empty_dir $KITWB_INSTALLED_KERNEL_DIR/$KERNEL)
  local SRC=$BASE/dist
  cp -r $SRC/* $DEST

  local PP="$DEST/venv/lib/python3.6/site-packages:$DEST/venv/lib/python3.7/site-packages"
  cat $DEST/kernel.json-template \
      | sed "s|INSTALLATION_BASE|$DEST|g" \
      | sed "s|INSTALLATION_PYTHON_PATH|$PP|g" \
      > $DEST/kernel.json
  chmod +x $DEST/wrapper.sh

  report_ok "Installed $KERNEL in $DEST"
)
export -f kd_install_python_kernel

kd_package_python_kernel() (
  local KERNEL=$1
  local BASE=$2
  report_heading "Package $KERNEL"

  local DIST=$(ensure_empty_dir $BASE/dist)
  cp -r $BASE/spec/* $DIST

  local SRC_ENV=$BASE/venv
  local DST_ENV=$DIST/venv
  create_python3_env $DST_ENV
  . $DST_ENV/bin/activate
  cd $BASE && pip install -r $BASE/kernel-requirements.txt
  rm -rf $DST_ENV/bin
  rm -rf $DST_ENV/man
  rm -rf $DST_ENV/include
  rm -rf $DST_ENV/share/man
)
export -f kd_package_python_kernel
