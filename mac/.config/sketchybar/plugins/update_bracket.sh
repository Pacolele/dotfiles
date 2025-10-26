#!/bin/bash

# Update the left bracket to include all space items
# This script should be called after spaces are created

# Get all space items
SPACES=$(sketchybar --query space | jq -r '.[] | select(.name | startswith("space.")) | .name' | tr '\n' ' ')

# Update the bracket to include all spaces
if [ -n "$SPACES" ]; then
    sketchybar --set left_pill_bg bracket="apple_logo $SPACES space_separator front_app"
fi
