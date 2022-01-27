#!/usr/bin/env bash

get_binary_path(){
  local binary_name=$1
  local binary_path=`whereis -b ${binary_name} | cut -d\  -f2`

  echo $binary_path
}

check_tmux_required_version() {
  local tmux_binary_path=`get_binary_path tmux`
  local tmux_minimum_required_version=$1
  local local_tmux_version=`${tmux_binary_path} -V | sed 's/[^0-9]*\([0-9.]\+\).*/\1/'`

  if (( $(echo "$local_tmux_version < $tmux_minimum_required_version" | bc -l) )); then
    trigger_tmux_message "tmux minimum required version is ${tmux_minimum_required_version}"
    return 1
  fi
}

check_required_packages() {
  local REQUIRED_PACKAGES=$@
  
  for binary in $REQUIRED_PACKAGES; do
    if ! check_if_binary_exists "$binary"; then
      trigger_tmux_message "binary $binary does not exist"
      return 1
    fi
  done
}

check_if_binary_exists() {
  local binary_path=`get_binary_path $1` 
  command -v "${binary_path}" &> /dev/null
  return $?
}

trigger_tmux_message() {
  local message=$1
  tmux display-message "tmux-bitwarden: ${message}"
}
