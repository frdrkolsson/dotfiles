#!/usr/bin/env bash

set REPEAT_INTERVAL 20
set DELAY 250

gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval $REPEAT_INTERVAL
gsettings set org.gnome.desktop.peripherals.keyboard delay $DELAY

