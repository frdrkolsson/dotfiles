#!/usr/bin/env bash

# FIXME: Running an osascript on an application target opens that app
# This sleep is needed to try and ensure that theres enough time to
# quit the app before the next osascript command is called. I assume
# com.apple.iTunes.playerInfo fires off an event when the player quits
# so it imediately runs before the process is killed
sleep 1

PLUGIN_DIR="$HOME/.config/sketchybar/plugins"
source "$PLUGIN_DIR/colors.sh"

APP_STATE=$(pgrep -x Music)
if [[ ! $APP_STATE ]]; then
    sketchybar -m --set music drawing=off
    exit 0
fi

PLAYER_STATE=$(osascript -e "tell application \"Music\" to set playerState to (get player state) as text")
if [[ $PLAYER_STATE == "stopped" ]]; then
    sketchybar --set music drawing=off
    exit 0
fi

title=$(osascript -e 'tell application "Music" to get name of current track')
artist=$(osascript -e 'tell application "Music" to get artist of current track')
# ALBUM=$(osascript -e 'tell application "Music" to get album of current track')
loved=$(osascript -l JavaScript -e "Application('Music').currentTrack().loved()")
if [[ $loved ]]; then
    icon=""
    ICON_COLOR=$MAROON
fi

if [[ $PLAYER_STATE == "paused" ]]; then
    icon="􀊄"
    ICON_COLOR=$TEAL
fi

if [[ $PLAYER_STATE == "playing" ]]; then
    icon="􀊆"
    ICON_COLOR=$GREEN
fi

if [[ ${#title} -gt 25 ]]; then
TITLE=$(printf "$(echo $title | cut -c 1-25)…")
fi

if [[ ${#artist} -gt 25 ]]; then
ARTIST=$(printf "$(echo $artist | cut -c 1-25)…")
fi

# if [[ ${#ALBUM} -gt 25 ]]; then
#   ALBUM=$(printf "$(echo $ALBUM | cut -c 1-12)…")
# fi

sketchybar -m --set music icon="$icon" icon.color="$ICON_COLOR" \
    --set music label="${title} x ${artist}" label.padding_right=20    \
    --set music drawing=on \
    --set music label.max_chars=40 \
    --set music scroll_texts=on \
    --set music label.scroll_duration=500
