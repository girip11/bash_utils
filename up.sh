#!/bin/bash

# This script should be copied to /etc/profile.d/ in ubuntu
function up() {
  if [[ $# -ne 1 ]]; then
    echo "Enter the directory levels to go up"
    return
  fi

  declare -i levels_up=$1

  for ((i = 1; i <= levels_up; i++)); do
    cwd=$(pwd)

    if [[ $cwd = '/' ]]; then
      break
    fi

    cd ..
  done

  unset -v levels_up
}
