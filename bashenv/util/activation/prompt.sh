#!/bin/bash
# Sets up prompt

#called by 'activate' to keep the prompt active
reprompt() {
  export PS1="KD[$KITWB_ACTIVE_DEVENV/$KITWB_ACTIVATION_COUNT]:\W> "
}
reprompt
