#!/bin/bash

source "$CONFIG_DIR/colors.sh"
sketchybar --add item front_app left \
  --set front_app background.drawing=on \
  background.color=$ITEM_BG_COLOR \
  background.corner_radius=8 \
  background.height=26 \
  icon.color=$PRIMARY_COLOR \
  icon.font="sketchybar-app-font:Regular:17.0" \
  icon.padding_left=10 \
  icon.padding_right=0 \
  script="$PLUGIN_DIR/front_app.sh" \
  --subscribe front_app front_app_switched
