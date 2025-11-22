#!/bin/bash

killall waybar
waybar &

if [[ "$1" = "w" ]]; then
	vim w
elif [[ "$1" = "s" ]]; then
	vim $HOME/.config/waybar/style.css
fi

