#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

get_tmux_option() {
  local option=$1
  local default_value=$2
  local option_value
  option_value="$(tmux show-option -gqv "$option")"
  if [ -z "$option_value" ]; then
    echo "$default_value"
  else
    echo "$option_value"
  fi
}

# Get user configuration
key_binding="$(get_tmux_option "@cheatsh-key" "C")"
split_direction="$(get_tmux_option "@cheatsh-split" "h")"
split_size="$(get_tmux_option "@cheatsh-split-size" "50")"

# Set up the key binding
tmux bind-key "$key_binding" display-popup -E "$CURRENT_DIR/scripts/cheatsh.sh"
