#!/bin/bash

on_workspace_change() {
	if [[ "$1" == "2" ]]; then
		killall waybar
	else
		killall waybar
		waybar &
	fi
}

hyprctl --subscribe workspace | while read -r line; do
	workspace_id=$(echo "$line" | cut -d'>' -f3)
	on_workspace_change "$workspace_id"
done

#hyprctl --batch 'subevent workspacev2' | while read -r line; do
#	workspace_id=$(echo "$line" | jq -r '.workspace.name')
#
#	if [[ -n "$workspace_id" ]]; then
#		on_workspace_change "$workspace_id"
#	fi
#done
