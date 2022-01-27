#!/usr/bin/env bash

check_if_user_is_logged() {
  local authentication_status=`echo `bw status 2> /dev/null` | dasel -p json '.status'`

  if "$authentication_status" == "unauthenticated" ; then
    echo teste 
  fi
}
