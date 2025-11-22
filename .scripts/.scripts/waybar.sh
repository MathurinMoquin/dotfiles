#!/bin/bash

if pgrep -x "waybar" > /dev/null; then
	echo "Test Kill"
	killall waybar
else
	echo "Test waybar"
	waybar &
fi
