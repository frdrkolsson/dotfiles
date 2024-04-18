#!/bin/zsh

PLUGIN_DIR="$HOME/.config/sketchybar/plugins"
source "$PLUGIN_DIR/colors.sh"

# Some events send additional information specific to the event in the $INFO
# variable. E.g. the front_app_switched event sends the name of the newly
# focused application in the $INFO variable:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting

if [ "$SENDER" = "front_app_switched" ]; then
  sketchybar --set "$NAME" label="$INFO"
fi

ICON_COLOR=$RANDOM_CAT_COLOR

case $INFO in
  "Arc")
    ICON_PADDING_RIGHT=5
    ICON=󰞍
    ;;
  "Bitwarden")
    ICON=󰞀
    ICON_COLOR=$BLUE
    ;;
  "vscode")
    ICON_PADDING_RIGHT=2
    ICON_COLOR=0xff22a1f0
    ICON=󰨞
    ;;
  "Kalender")
    ICON=
    ;;
  "Kartor")
    ICON=
    ICON_COLOR=$GREEN
    ;;
  "Påminnelser")
    ICON=
    ;;
  "Mail")
    ICON=
    ICON_COLOR=$SAPPHIRE
    ;;
  "Discord")
    ICON_COLOR=$LAVENDER
    ICON=󰙯
    ;;
  "FaceTime")
    ICON=
    ICON_COLOR=$GREEN
    ;;
  "Finder")
    ICON_COLOR=$SKY
    ICON=󰀶
    ;;
  "Firefox")
    ICON=󰈹
    ;;
  "Google Chrome")
    ICON=
    ;;
  "IINA")
    ICON=󰕼
    ICON_COLOR=$MAROON
    ;;
  "Infuse")
    ICON=󰕼
    ICON_COLOR=$PEACH
    ;;
  "iTerm")
    ICON=󰄛
    ;;
  "Logic Pro")
    ICON=
    ICON_COLOR=$FLAMINGO
    ;;
  "Meddelanden")
    ICON=󰍦
    ICON_COLOR=$GREEN
    ;;
  "Notion")
    ICON_COLOR=$TEXT
    ICON=󰰒
    ;;
  "Förhandsvisning")
    ICON_COLOR=$BLUE
    ICON=
    ;;
  "PS Remote Play")
    ICON=
    ;;
  "Riot Client")
    ICON=
    ICON_COLOR=$TEXT
    ;;
  "League of Legends")
    ICON=󰰎
    ICON_COLOR=$YELLOW
    ;;
  "Cider")
    ICON_COLOR=0xff24D44E
    ICON=
    ;;
  "Musik")
    ICON_COLOR=$RED
    ICON=
    ;;
  "TextEdit")
    ICON=
    ;;
  "Transmission")
    ICON=󰶘
    ;;
  "Safari")
    ICON=
    ICON_COLOR=$SAPPHIRE
    ;;
  "Slack")
    ICON=
    ICON_COLOR=$MAROON
    ;;
  "kitty")
    ICON=
    ICON_COLOR=$MAUVE
    ;;
  "zoom.us")
    ICON=
    ICON_COLOR=0xff2D8CFF
    ;;
  *)
    # INFO="Unknown"
    ICON_COLOR=0xffff94c6
    ICON=﯂
    ;;
esac

sketchybar --set $NAME \
  icon=$ICON icon.color=$ICON_COLOR \
  label="$INFO"
