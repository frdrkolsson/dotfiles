#!/bin/sh

# The $NAME variable is passed from sketchybar and holds the name of
# the item invoking this script:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting

PLUGIN_DIR="$HOME/.config/sketchybar/plugins"
source "$PLUGIN_DIR/colors.sh"

sketchybar --set $NAME \
  label="$(date '+%a %d %b %Y %H:%M:%S')" \
  icon= icon.color=$MAROON \
  click_script="open -a 'Calendar'"
