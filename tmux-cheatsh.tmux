#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
tmux bind-key C display-popup -E "$CURRENT_DIR/scripts/cheatsh.sh"
