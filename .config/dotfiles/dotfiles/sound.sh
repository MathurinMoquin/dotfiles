#!/bin/bash

function sound() {
    pactl set-sink-volume bluez_output.D2_6B_3C_04_52_41.1 $1%
}

#pactl set-default-sink bluez_output.D2_6B_3C_04_52_41.1
