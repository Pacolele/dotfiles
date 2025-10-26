#!/bin/bash

sketchybar --add item apple_logo left \
  --set apple_logo icon=􀣺 \
  icon.font="SF Pro:Black:18.0" \
  icon.color=$OPTIONAL_COLOR \
  label.drawing=off \
  padding_left=6 \
  padding_right=10 \
  icon.padding_left=6 \
  icon.padding_right=6 \
  background.corner_radius=8 \
  background.height=26 \
  background.color=$ITEM_BG_COLOR \
  background.drawing=on \
  click_script="$PLUGIN_DIR/apple_menu.sh"
