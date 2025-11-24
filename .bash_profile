#
# .bash_profile
#

if [ -f "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
fi

# Launch Hyprland when on tty1 after login
if [[ $(tty) == /dev/tty1 ]]; then
    Hyprland
fi
