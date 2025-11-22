#!/bin/bash

TARGET_NAME="Picture-in-Picture"
SCRIPT="$HOME/.script/pip_size.sh"
WIDTH=100
HEIGHT=60

hyprctl --batch 'subclient newwindow' | while read -r line; do
	sleep 0.1

	WINDOW_ADDRESS=$(hyprctl clients -j | jq -r --arg name "$TARGET_NAME" '
		.[] | select(.title | test($name; "i")) | .address
	')

	if [[ -n "$WINDOW_ADDRESS" ]]; then
		$SCRIPT "$TARGET_NAME" "$WIDTH" "$HEIGHT"
	fi
done
