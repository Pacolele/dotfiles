#!/bin/bash

sketchybar --add item clipboard right \
  --set clipboard icon="􀉉" \
  icon.font="sketchybar-app-font:Regular:16.0" \
  icon.width=16 \
  background.drawing=on \
  click_script="$PLUGIN_DIR/clipboard.sh"
