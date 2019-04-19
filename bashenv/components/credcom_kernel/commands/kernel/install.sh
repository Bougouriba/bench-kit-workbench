#!/bin/bash
# install kernel

print_help() {
printf "`cat << EOF
${BLUE}kd credcom_kernel kernel install${NC}

Create install

EOF
`\n"
}

run() (
  report_heading "install credcom_kernel"

  local DEST=$(ensure_empty_dir $KITWB_INSTALLED_KERNEL_DIR/credcom_kernel)
  local SRC=$CREDCOM_BASE/dist
  cp -r $SRC/* $DEST

  cat $DEST/kernel.json-template \
      | sed "s|INSTALLATION_BASE|$DEST|g" \
      | sed "s|INSTALLATION_NODE_PATH|$DEST/node_modules|g" \
      > $DEST/kernel.json
  chmod +x $DEST/kernel.json

  report_ok "Installed credcom_kernel in $DEST"
)
