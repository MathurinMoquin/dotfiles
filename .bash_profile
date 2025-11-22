#
# .bash_profile
#

# Launch Hyprland when on tty1 after login
if [[ $(tty) == /dev/tty1 ]]; then
    Hyprland
fi
