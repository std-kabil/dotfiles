#!/bin/bash

# Define the path to the icon
ICON_PATH="$HOME/scripts/icons/Clash_Logo.png"
ICON_INACTIVE_PATH="$HOME/scripts/icons/Clash_Logo_Inactive.png"

# Check if clash is running
if pgrep -x "clash" > /dev/null; then
    # If clash is running, kill it
    pkill -x "clash"
    notify-send -i "$ICON_INACTIVE_PATH" "Clash Stopped" "The Clash process has been terminated."
else
    # If clash is not running, start it
    ~/clash/clash -d ~/clash/ &
    notify-send -i "$ICON_PATH" "Clash Started" "The Clash process has been started."
fi