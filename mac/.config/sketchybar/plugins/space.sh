#!/bin/bash

# Aerospace workspace integration for SketchyBar
# This script handles workspace switching and visual updates
echo "[space.sh] NAME=$NAME SENDER=$SENDER FW=$FOCUSED_WORKSPACE WS_ID=${NAME#space.}" >>/tmp/sb_space.log
source "$CONFIG_DIR/colors.sh" # Loads all defined colors

# Get the workspace ID from the item name (space.1, space.2, etc.)
WORKSPACE_ID=${NAME#space.}

# Get the currently focused workspace from Aerospace
FOCUSED_WORKSPACE=$(aerospace list-workspaces --focused)

# Function to update apps for this workspace
update_workspace_apps() {
  # Get apps on this specific workspace
  APPS=$(aerospace list-windows --workspace "$WORKSPACE_ID" --json | jq -r '.[]."app-name"' | sort -u)

  if [ -n "$APPS" ] && [ "$APPS" != "null" ]; then
    ICON_STRIP=" "
    while IFS= read -r app; do
      if [ -n "$app" ] && [ "$app" != "null" ]; then
        if [ -f "$CONFIG_DIR/plugins/icon_map_fn.sh" ]; then
          ICON_STRIP+=" $("$CONFIG_DIR/plugins/icon_map_fn.sh" "$app")"
        else
          ICON_STRIP+=" :$app:"
        fi
      fi
    done <<<"$APPS"
  else
    ICON_STRIP=" —"
  fi

  sketchybar --set "$NAME" label="$ICON_STRIP"
}

# Handle space selection visual updates
if [ "$SENDER" = "aerospace_workspace_change" ] || [ "$SENDER" = "mouse.clicked" ]; then
  if [ "$WORKSPACE_ID" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set $NAME background.drawing=on \
      background.color=$ITEM_BG_COLOR \
      label.color=$ACCENT_COLOR \
      icon.color=$PRIMARY_COLOR
  else
    sketchybar --set $NAME background.drawing=off \
      label.color=$ACCENT_COLOR \
      icon.color=$PRIMARY_COLOR
  fi

  # Also update the app display for this workspace
  update_workspace_apps
fi

# Handle mouse hover effects (only for mouse events)
if [ "$SENDER" = "mouse.entered" ]; then
  # Show hover effect only if not already selected
  if [ "$WORKSPACE_ID" != "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set $NAME background.drawing=on \
      background.color=$ITEM_BG_COLOR \
      label.color=$WHITE \
      icon.color=$WHITE
  fi
fi

if [ "$SENDER" = "mouse.exited" ]; then
  # Remove hover effect only if not selected
  if [ "$WORKSPACE_ID" != "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set $NAME background.drawing=off \
      label.color=$ACCENT_COLOR \
      icon.color=$PRIMARY_COLOR
  fi
fi
