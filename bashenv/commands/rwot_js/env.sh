#!/bin/bash
# environment information

print_help() {
printf "`cat << EOF
${BLUE}kd rwot_js env${NC}

EOF
`\n\n"
}

run() {
  activate_rwot_js_environment
  
  echo "RWOT_JS_BASE_DIR        :"$RWOT_JS_BASE_DIR
  echo "RWOT_JS_YARN            :"$RWOT_JS_YARN
  echo "RWOT_JS_NODE_VERSION    :"$RWOT_JS_NODE_VERSION
  echo "RWOT_JS_NODE_MODULES_DIR:"$RWOT_JS_NODE_MODULES_DIR
  echo ""
  echo ""


  activate_devenv rwot_js

  if [ "$KITWB_ACTIVE_DEVENV" = "rwot_js" ]; then
    echo "RWOT_JS Environment is activated"
  else
    echo "Not Activated : RWOT_JS Environment is not activated."
    if [ -d "$RWOT_JS_NODE_MODULES_DIR" ]; then
      echo "The node environment can be activated, there is a node_modules install"
    else
      echo "The node_modules dir is missing"
      echo "try kd rwot_js setup"
    fi
  fi

}
