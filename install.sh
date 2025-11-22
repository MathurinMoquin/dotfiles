#!/bin/bash

sudo pacman -S \
    firefox \
    git \
    gcc \
    gdb \
    vim \
    neovim \
    discord \
    pipewire \
    pipewire-pulse

sudo systemctl enable --now pipewire pipewire-pulse


