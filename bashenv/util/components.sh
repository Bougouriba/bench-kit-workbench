#!/bin/bash

KITWB_LIBRARIES=$(echo "$KITWB_LIBRARIES" | tr " " "\n" | sort -u | tr "\n" " " )

is_library() {
  contains "$KITWB_LIBRARIES" $1
}

KITWB_SERVICES=$(echo "$KITWB_SERVICES" | tr " " "\n" | sort -u | tr "\n" " " )

all_service_list() {
  ALL_SERVICES=$(echo "$KITWB_SERVICES $(defined_service_list)" | tr " " "\n" | sort -u | tr "\n" " " )
  echo $ALL_SERVICES
}
is_service() {
  contains "$(all_service_list)" $1
}

is_defined_service() {
  contains "$(defined_service_list)" $1
}
is_keyoniq_service() {
  contains "$KITWB_SERVICES" $1
}
keyoniq_service_list() {
  echo $KITWB_SERVICES
}
defined_service_list() {
  VAL=$(docker-compose config --services 2>/dev/null)
  VAL=$(echo "$VAL" | tr " " "\n" | sort -u | tr "\n" " " )
  echo $VAL
}
container_of() {
  VAL=$(docker-compose ps -q $1 2>/dev/null)
  echo $VAL
}
is_running() {
  CHECK="$(docker-compose exec $1 echo true 2>/dev/null)"
  [ ! -z "$CHECK" ]
}
