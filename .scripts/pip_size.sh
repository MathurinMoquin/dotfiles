#!/bin/bash

TARGET_NAME="$1"

WIDTH=100
HEIGHT=60

WINDOW_ADDRESS=$(hyprctl clients -j | jq -r --arg name "$TARGET_NAME" '
	.[] | select(.title | test($name; "i")) | .address
')

if [[ -z "$WINDOW_ADDRESS" ]]; then
	echo "No window found: $TARGET_NAME"
	exit 1
fi

hyprctl dispatch togglefloating "$WINDOW_ADDRESS"

hyprctl dispatch resizewindowpixel "$WINDOW_ADDRESS" "$WIDTH" "$HEIGHT"
