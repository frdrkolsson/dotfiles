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

TEXT_COLOR=0xaa000000
BACKGROUND_COLOR=$RANDOM_CAT_COLOR

case $INFO in
  "Arc")
    ICON_PADDING_RIGHT=5
    ICON=󰞍
    ;;
  "Bitwarden")
    ICON=􀙨
    BACKGROUND_COLOR=$BLUE
    ;;
  "Code")
    ICON_PADDING_RIGHT=2
    BACKGROUND_COLOR=0xff22a1f0
    ICON=󰨞
    ;;
  "Kalender")
    ICON=􀉉
    ;;
  "Kartor")
    ICON=􀙋
    BACKGROUND_COLOR=$GREEN
    ;;
  "Påminnelser")
    ICON=􀷾
    ;;
  "Mail")
    ICON=􀍖
    BACKGROUND_COLOR=$SAPPHIRE
    ;;
  "Discord")
    BACKGROUND_COLOR=$LAVENDER
    ICON=󰙯
    ;;
  "FaceTime")
    ICON=􀌿
    BACKGROUND_COLOR=$GREEN
    ;;
  "Finder")
    BACKGROUND_COLOR=$SKY
    ICON=󰀶
    ;;
  "Firefox")
    ICON=󰈹
    BACKGROUND_COLOR=$RED
    ;;
  "Google Chrome")
    ICON=
    ;;
  "IINA")
    ICON=󰕼
    BACKGROUND_COLOR=$MAROON
    ;;
  "Infuse")
    ICON=􀊃
    BACKGROUND_COLOR=$PEACH
    ;;
  "iTerm")
    ICON=󰄛
    ;;
  "Logic Pro")
    ICON=
    BACKGROUND_COLOR=$FLAMINGO
    ;;
  "Meddelanden")
    ICON=􀌥
    BACKGROUND_COLOR=$GREEN
    ;;
  "Notion")
    BACKGROUND_COLOR=$TEXT
    ICON=󰰒
    ;;
  "Förhandsvisning")
    BACKGROUND_COLOR=$BLUE
    ICON=􀏆
    ;;
  "Bilder")
    BACKGROUND_COLOR=$BLUE
    ICON=􀏬
    ;;
  "PS Remote Play")
    ICON=
    ;;
  "Riot Client")
    ICON=
    BACKGROUND_COLOR=$TEXT
    ;;
  "League of Legends")
    ICON=􀀚
    BACKGROUND_COLOR=$YELLOW
    ;;
  "Cider")
    BACKGROUND_COLOR=0xff24D44E
    ICON=
    ;;
  "Musik")
    BACKGROUND_COLOR=$RED
    ICON=
    ;;
  "TextEdit")
    ICON=
    ;;
  "Fork")
    ICON=􀸩
    BACKGROUND_COLOR=$SKY
    ;;
  "Safari")
    ICON=
    BACKGROUND_COLOR=$SAPPHIRE
    ;;
  "Slack")
    ICON=
    BACKGROUND_COLOR=$MAROON
    ;;
  "kitty")
    ICON=􀪏
    BACKGROUND_COLOR=$MAUVE
    ;;
  "zoom.us")
    ICON=􀊬
    BACKGROUND_COLOR=$BLUE
    ;;
  "Väder")
    ICON=􀇔
    BACKGROUND_COLOR=$YELLOW
    ;;
  *)
    BACKGROUND_COLOR=0xffff94c6
    ICON=􀏜
    ;;
esac

sketchybar --set $NAME \
           label="$INFO"

sketchybar --animate sin 15 --set $NAME \
           icon.color=$TEXT_COLOR label.color=$TEXT_COLOR \
           icon=$ICON \
           background.color=$BACKGROUND_COLOR
