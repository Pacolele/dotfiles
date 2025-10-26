#!/bin/bash
AERO=/opt/homebrew/bin/aerospace # adjust if needed

# Click: change Aerospace workspace
if [ "$SENDER" = "mouse.clicked" ]; then
  N="${NAME#ws.}"
  "$AERO" workspace "$N"
  exit 0
fi

# Any update: highlight the active workspace & show its apps
ACTIVE=$("$AERO" list-workspaces --monitor focused | awk '/\*/{print $1}')
ME="${NAME#ws.}"

if [ "$ME" = "$ACTIVE" ]; then
  sketchybar --set "$NAME" background.drawing=on \
    background.color=0xff7c7f93 \
    icon.color=0xffffffff label.color=0xffffffff
else
  sketchybar --set "$NAME" background.drawing=off \
    icon.color=$ACCENT_COLOR label.color=$PRIMARY_COLOR
fi

# Build app strip for this workspace (replace icon_map_fn.sh with your mapper)
APPS=$("$AERO" -j query --windows --workspace "$ME" | jq -r '.[].app' | sort -u)
if [ -n "$APPS" ]; then
  STR=" "
  while IFS= read -r app; do
    STR+=" $("$CONFIG_DIR/plugins/icon_map_fn.sh" "$app")"
  done <<<"$APPS"
else
  STR=" —"
fi
sketchybar --set "$NAME" label="$STR"
