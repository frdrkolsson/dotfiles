#!/bin/sh

PLUGIN_DIR="$HOME/.config/sketchybar/plugins"
source "$PLUGIN_DIR/colors.sh"

sketchybar --set $NAME \
  label="Loading..." \
  icon.color=$LAVENDER

# fetch weather data
LOCATION="Uppsala+Sweden"

WEATHER_JSON=$(curl -s "https://wttr.in/$LOCATION?format=j1")

# Fallback if empty
if [ -z $WEATHER_JSON ]; then
  sketchybar --set $NAME label="$LOCATION"
  return
fi

TEMPERATURE=$(echo $WEATHER_JSON | jq '.current_condition[0].temp_C' | tr -d '"')
WEATHER_DESCRIPTION=$(echo $WEATHER_JSON | jq '.current_condition[0].weatherDesc[0].value' | tr -d '"' | sed 's/\(.\{16\}\).*/\1.../')

case ${WEATHER_DESCRIPTION} in
  "Sunny")
    ICON=􀆭
    COLOR="$YELLOW"
    ;;
  "Partly cloudy")
    ICON=􀇔
    COLOR="$LAVENDER"
    ;;
  "Cloudy")
    ICON=􀇂
    COLOR="$LAVENDER"
    ;;
  "Overcast")
    ICON=􀇂
    COLOR="$LAVENDER"
    ;;
  "Fog")
    ICON=􀇊
    COLOR="$LAVENDER"
    ;;
  "Clear")
    ICON=􀆭
    COLOR="$YELLOW"
    ;;
  "Mist")
    ICON="􀇊 "
    COLOR="$SAPPHIRE"
    ;;
  "Patchy rain possible")
    ICON="☁"
    COLOR="$SAPPHIRE"
    ;;
  "Patchy snow possible")
    ICON="􀇥"
    COLOR="$SAPPHIRE"
    ;;
  "Patchy sleet possible")
    ICON="􀇥"
    COLOR="$SAPPHIRE"
    ;;
  "Patchy freezing drizzle possible")
    ICON="􀇥"
    COLOR="$SAPPHIRE"
    ;;
  "Thundery outbreaks possible")
    ICON="􀇒"
    COLOR="$SAPPHIRE"
    ;;
  "Blowing snow")
    ICON="􀇦"
    COLOR="$SAPPHIRE"
    ;;
  "Blizzard")
    ICON="􀇦"
    COLOR="$SAPPHIRE"
    ;;
  "Freezing fog")
    ICON="􀇊 "
    COLOR="$SAPPHIRE"
    ;;
  "Patchy light drizzle")
    ICON=
    COLOR="$SAPPHIRE"
    ;;
  "Light drizzle")
    ICON=
    COLOR="$SAPPHIRE"
    ;;
  "Freezing drizzle")
    ICON=
    COLOR="$SAPPHIRE"
    ;;
  "Heavy freezing drizzle")
    ICON="􀇎"
    COLOR="$SAPPHIRE"
    ;;
  "Patchy light rain")
    ICON="􀙖"
    COLOR="$SAPPHIRE"
    ;;
  "Light rain")
    ICON="􀙖"
    COLOR="$SAPPHIRE"
    ;;
  "Moderate rain at times")
    ICON="􀙖"
    COLOR="$SAPPHIRE"
    ;;
  "Moderate rain")
    ICON="􀙖"
    COLOR="$SAPPHIRE"
    ;;
  "Heavy rain at times")
    ICON="􀙖"
    COLOR="$BLUE"
    ;;
  "Heavy rain")
    ICON="􀙖"
    COLOR="$BLUE"
    ;;
  "Light freezing rain")
    ICON="􀙖"
    COLOR="$SAPPHIRE"
    ;;
  "Moderate or heavy freezing rain")
    ICON="􀙖"
    COLOR="$SAPPHIRE"
    ;;
  "Light sleet")
    ICON="􀇎"
    COLOR="$SAPPHIRE"
    ;;
  "Moderate or heavy sleet")
    ICON="􀇎"
    COLOR="$SAPPHIRE"
    ;;
  "Patchy light snow")
    ICON="􀇎"
    COLOR="$SAPPHIRE"
    ;;
  "Light snow")
    ICON="􀇎"
    COLOR="$SAPPHIRE"
    ;;
  "Patchy moderate snow")
    ICON="􀇎"
    COLOR="$SAPPHIRE"
    ;;
  "Moderate snow")
    ICON="􀇎"
    COLOR="$SAPPHIRE"
    ;;
  "Patchy heavy snow")
    ICON="􀇎"
    COLOR="$SAPPHIRE"
    ;;
  "Heavy snow")
    ICON="􀇎"
    COLOR="$SAPPHIRE"
    ;;
  "Ice pellets")
    ICON="􀇎"
    COLOR="$SAPPHIRE"
    ;;
  "Light rain shower")
    ICON="􀙖"
    COLOR="$SAPPHIRE"
    ;;
  "Moderate or heavy rain shower")
    ICON="􀙖"
    COLOR="$SAPPHIRE"
    ;;
  "Torrential rain shower")
    ICON="􀙖"
    COLOR="$SAPPHIRE"
    ;;
  "Light sleet showers")
    ICON="􀇎"
    COLOR="$SAPPHIRE"
    ;;
  "Moderate or heavy sleet showers")
    ICON="􀇎"
    COLOR="$SAPPHIRE"
    ;;
  "Light snow showers")
    ICON=
    COLOR="$SAPPHIRE"
    ;;
  "Moderate or heavy snow showers")
    ICON=""
    COLOR="$SAPPHIRE"
    ;;
  "Patchy light rain with thunder")
    ICON=􀇞
    COLOR="$SAPPHIRE"
    ;;
  "Moderate or heavy rain with thunder")
    ICON=􀇞
    COLOR="$SAPPHIRE"
    ;;
  "Patchy light snow with thunder")
    ICON=
    COLOR="$SAPPHIRE"
    ;;
  "Moderate or heavy snow with thunder")
    ICON=
    COLOR="$SAPPHIRE"
esac

sketchybar --set $NAME \
  label="$TEMPERATURE$(echo '°')C • $WEATHER_DESCRIPTION" \
  icon=$ICON \
  icon.color=$COLOR
