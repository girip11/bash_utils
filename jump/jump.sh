#!/bin/bash

# This file should be placed under /etc/profile.d/ folder
function jump() {
  if [[ $# -ne 1 ]]; then
    echo "Enter the folder shortcut name to jump to. To configure the folder shortcuts use jump.conf"
    return
  fi

  local jump_to_shortcut=${1^^}
  declare -A jump_dirs_lookup
  local IFS='='

  while read -r -a kv; do
    # capitalize the keys while storing in the lookup table.
    jump_dirs_lookup["${kv[0]^^}"]="${kv[1]}"
  done < jump.conf

  local jump_to_dir=${jump_dirs_lookup[$jump_to_shortcut]:-''}
  unset -v jump_dirs_lookup

  if [[ $jump_to_dir != '' ]]; then
    echo "Jumping to ${jump_to_dir}"
    cd "$jump_to_dir" || return
  else
    echo "$1 shortcut not found in jump.conf"
  fi
}
