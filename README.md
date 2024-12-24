# Cheat.sh TMux Plugin

A simple TMux plugin that provides quick access to [cheat.sh](https://cheat.sh/) directly from your terminal.

## Prerequisites

- [gum](https://github.com/charmbracelet/gum)
- curl
- tmux

## Installation

Add this to your `.tmux.conf`:

```bash
set -g @plugin 'danitrap/tmux-cheatsh'
```

## Usage

1. Press `<prefix> + C` to activate the plugin
2. Either:
   - Type a search term directly, or
   - Browse and filter through available topics
3. Results will appear in a split pane if you're in TMux, or directly in your terminal otherwise

The script will fetch and display programming language references, command examples, and code snippets from cheat.sh.

## Features

- Interactive topic filtering
- TMux-aware (splits window when in TMux session)
- Paged output for better readability
- Works standalone or within TMux
