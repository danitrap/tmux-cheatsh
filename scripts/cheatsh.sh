#!/usr/bin/env bash
set -eo pipefail

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$CURRENT_DIR/helpers.sh"

split_direction="$(get_tmux_option "@cheatsh-split" "h")"
split_size="$(get_tmux_option "@cheatsh-split-size" "50")"

search_term=${*:-$(gum spin --spinner dot --title "Fetching topics..." -- curl -s "https://cheat.sh/:list" | gum filter --no-strict)}
search_term=$(printf '%s' "$search_term" | jq -sRr @uri)

output_command="curl -s \"https://cheat.sh/$search_term\" | gum pager"

if [ -z "$TMUX" ]; then
  eval "$output_command"
  exit 0
fi

if [ "$split_direction" = "v" ]; then
  tmux split-window -v -p "$split_size" "$output_command"
else
  tmux split-window -h -p "$split_size" "$output_command"
fi
