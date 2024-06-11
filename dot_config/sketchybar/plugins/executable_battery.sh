# Battery is here bcause the ICON_COLOR doesn't play well with all background colors

PLUGIN_DIR="$HOME/.config/sketchybar/plugins"
source "$PLUGIN_DIR/colors.sh"

PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(pmset -g batt | grep 'AC Power')

if [ $PERCENTAGE = "" ]; then
  exit 0
fi

case ${PERCENTAGE} in
  [8-9][0-9] | 100)
    ICON=􀛨
    ICON_COLOR=$GREEN
    ;;
  7[0-9])
    ICON=􀺸
    ICON_COLOR=$YELLOW
    ;;
  [4-6][0-9])
    ICON=􀺶
    ICON_COLOR=$PEACH
    ;;
  [1-3][0-9])
    ICON=􀛩
    ICON_COLOR=$MAROON
    ;;
  [0-9])
    ICON=􀛪
    ICON_COLOR=$RED
    ;;
esac

if [[ $CHARGING != "" ]]; then
  ICON=􀢋
  ICON_COLOR=$GREEN
fi

sketchybar --set $NAME \
  icon=$ICON \
  label="${PERCENTAGE}%" \
  icon.color=${ICON_COLOR} \
  click_script="open /System/Library/PreferencePanes/Battery.prefPane"
