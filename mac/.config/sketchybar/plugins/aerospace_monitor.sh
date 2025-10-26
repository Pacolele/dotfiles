#!/bin/bash

# Aerospace workspace monitor for SketchyBar
# This script monitors Aerospace workspace changes and triggers SketchyBar updates

# Load colors
CONFIG_DIR="/Users/kasken/dotfiles/mac/.config/sketchybar"
source "$CONFIG_DIR/colors.sh"

# Function to update all space items when workspace changes
update_spaces() {
  # Get all space items
  SPACES=$(sketchybar --query space | jq -r '.[] | select(.name | startswith("space.")) | .name')

  # First, clear all space backgrounds
  for space in $SPACES; do
    sketchybar --set "$space" background.drawing=off \
      label.color=$PRIMARY_COLOR \
      icon.color=$ACCENT_COLOR
  done

  # Then update each space with proper highlighting and apps
  for space in $SPACES; do
    CONFIG_DIR="/Users/kasken/dotfiles/mac/.config/sketchybar" NAME="$space" SENDER="aerospace_workspace_change" bash /Users/kasken/dotfiles/mac/.config/sketchybar/plugins/space.sh
  done
}

# Monitor Aerospace workspace changes
while true; do
  # Get current focused workspace
  CURRENT_WORKSPACE=$(aerospace list-workspaces --focused)

  # If workspace changed, update SketchyBar
  if [ "$CURRENT_WORKSPACE" != "$LAST_WORKSPACE" ]; then
    update_spaces
    LAST_WORKSPACE="$CURRENT_WORKSPACE"
  fi

  # Check every 0.5 seconds
  sleep 0.5
done
