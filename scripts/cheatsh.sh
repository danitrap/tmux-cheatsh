#!/usr/bin/env bash
set -eo pipefail

search_term=${*:-$(gum spin --spinner dot --title "Fetching topics..." -- curl -s "https://cheat.sh/:list" | gum filter --no-strict)}
search_term=$(printf '%s' "$search_term" | jq -sRr @uri)

echo "Searching for '$search_term'..."
if [ -z "$search_term" ]; then
  exit 0
fi

output_command="curl -s \"https://cheat.sh/$search_term\" | gum pager"

if [ -z "$TMUX" ]; then
  eval "$output_command"
  exit 0
fi

tmux split-window -h -p 50 "$output_command"
