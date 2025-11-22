#!/bin/bash

LAST_ALERT="none"

upower --monitor | while read -r _; do
    BATTERY_INFO=$(upower -i "$(upower -e | grep BAT)")
    BATTERY_LEVEL=$(echo "$BATTERY_INFO" | awk '/percentage/ {gsub("%",""); print $2}')
    BATTERY_STATE=$(echo "$BATTERY_INFO" | awk '/state/ {print $2}')

    if [ "$BATTERY_STATE" = "discharging" ]; then
        if [ "$BATTERY_LEVEL" -le 10 ] && [ "$LAST_ALERT" != "critical" ]; then
            notify-send -u critical "⚠️ Battery Critically Low" "Battery level is ${BATTERY_LEVEL}%"
            LAST_ALERT="critical"
        elif [ "$BATTERY_LEVEL" -le 20 ] && [ "$LAST_ALERT" != "low" ]; then
            notify-send -u normal "🔋 Battery Low" "Battery level is ${BATTERY_LEVEL}%"
            LAST_ALERT="low"
        elif [ "$BATTERY_LEVEL" -gt 20 ]; then
            LAST_ALERT="none"
        fi
    fi
done
