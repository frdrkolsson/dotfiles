#!/bin/sh

PLUGIN_DIR="$HOME/.config/sketchybar/plugins"
source "$PLUGIN_DIR/colors.sh"

SSID="$(networksetup -listallhardwareports | awk '/Wi-Fi/{getline; print $2}' | xargs networksetup -getairportnetwork | sed "s/Current Wi-Fi Network: //")"

sketchybar --set $NAME \
  icon=􀙇  icon.color=$SAPPHIRE \
  label="$SSID"
