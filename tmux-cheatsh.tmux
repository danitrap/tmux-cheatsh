#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$CURRENT_DIR/scripts/helpers.sh"

key_binding="$(get_tmux_option "@cheatsh-key" "C")"

tmux bind-key "$key_binding" display-popup -E "$CURRENT_DIR/scripts/cheatsh.sh"
