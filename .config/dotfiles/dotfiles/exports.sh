#!/bin/bash

export ANDROID_HOME=$HOME/Android/Sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME

export PATH=$ANDROID_HOME/cmdline-tools/latest/bin:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH

export HYPRSHOT_DIR=$HOME/Pictures/screenshots

export ELECTRON_OZONE_PLATFORM_HINT=wayland
