#!/bin/bash

PROGRAM="firefox"

if pgrep -x $PROGRAM > /dev/null; then
	echo "$PROGRAM is running"
else
	echo "$PROGRAM is not running"
fi
