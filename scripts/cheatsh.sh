#!/usr/bin/env bash
set -eo pipefail

# Read TMux options
split_direction="$(tmux show-option -gqv "@cheatsh-split")"
split_size="$(tmux show-option -gqv "@cheatsh-split-size")"

# Set defaults if not configured
split_direction="${split_direction:-h}"
split_size="${split_size:-50}"

search_term=${*:-$(gum spin --spinner dot --title "Fetching topics..." -- curl -s "https://cheat.sh/:list" | gum filter --no-strict)}
search_term=$(printf '%s' "$search_term" | jq -sRr @uri)

output_command="curl -s \"https://cheat.sh/$search_term\" | gum pager"

if [ -z "$TMUX" ]; then
  eval "$output_command"
  exit 0
fi

# Use configured split direction and size
if [ "$split_direction" = "v" ]; then
  tmux split-window -v -p "$split_size" "$output_command"
else
  tmux split-window -h -p "$split_size" "$output_command"
fi
