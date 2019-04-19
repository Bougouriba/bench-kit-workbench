#!/bin/bash
# install kernel

print_help() {
printf "`cat << EOF
${BLUE}kd tool_kernel kernel install${NC}

Create install

EOF
`\n"
}

run() (
  report_heading "install tool_kernel"

  local DEST=$(ensure_empty_dir $KITWB_INSTALLED_KERNEL_DIR/tool_kernel)
  local SRC=$KKTOOL_BASE/dist
  cp -r $SRC/* $DEST

  cat $DEST/kernel.json-template \
      | sed "s|INSTALLATION_BASE|$DEST|g" \
      | sed "s|INSTALLATION_PYTHON_PATH|$DEST/venv/lib/python3.6/site-packages|g" \
      > $DEST/kernel.json
  chmod +x $DEST/kernel.json

  report_ok "Installed tool_kernel in $DEST"
)
