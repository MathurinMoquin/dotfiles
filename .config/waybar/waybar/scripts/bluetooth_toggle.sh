#!/bin/bash

STATUS=$(bluetoothctl show | grep "Powered:" | awk '{print $2}')

if [ "$STATUS" = "yes" ]; then
	bluetoothctl disconnect D2:6B:3C:04:52:41
	bluetoothctl power off
else
	bluetoothctl power on
	bluetoothctl connect D2:6B:3C:04:52:41
fi

