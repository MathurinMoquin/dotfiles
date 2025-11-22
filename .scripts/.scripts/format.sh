#!/bin/bash

read -p "Enter the device you want to format!: " DEVICE

echo "WARNING: This will delete ALL partitions on $DEVICE!"
read -p "Type 'YES' to continue: " confirm

if [[ "$DEVICE" != "/dev/sda" && "$DEVICE" != "/dev/sdb" ]]; then
	echo "Are you really sure you want to delete EVERYTHING from $DEVICE?"
	read -p "Type 'YES' to continue: " secure

	if [[ "$secure" != "YES" ]]; then
		echo "Operation canceled."
		exit 1
	fi
fi

if [[ "$confirm" != "YES" ]]; then
	echo "Operation canceled."
	exit 1
fi

(
	for part in $(sudo fdisk -l $DEVICE | grep "^$DEVICE" | awk '{print $1}' | grep -o '[0-9]*$'); do
		echo "d"
		echo "$part"
	done
	echo "w"
) | echo #sudo fdisk $DEVICE

echo "All partitions on $DEVICE have been deleted."
