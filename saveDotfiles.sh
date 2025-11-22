#!/bin/bash

DF="$HOME/.dotfiles"
GITHUB_LINK="git@github.com:MathurinMoquin/dotfiles.git"
GITHUB_REMOTE="origin"
GITHUB_BRANCH="master"

mkdir -p "$DF"

cd "$DF"

if [ ! -d "$DF/.git" ]; then
    /usr/bin/git init
    /usr/bin/git remote add "$GITHUB_REMOTE" "$GITHUB_LINK"
fi

/usr/bin/git pull "$GITHUB_REMOTE" "$GITHUB_BRANCH"

files=(
    "$HOME/.bash_profile"
    "$HOME/.bashrc"
    "$HOME/.scripts"
    "$HOME/.themes"
    "$HOME/.vim"
    "$HOME/.tmux.conf"
    "$HOME/.vimrc"
    "$HOME/.zshrc"
    "$HOME/.dotfiles/install.sh"
    "$HOME/.dotfiles/saveDotfiles.sh"
    "$HOME/.config/dotfiles"
    "$HOME/.config/hypr"
    "$HOME/.config/kitty"
    "$HOME/.config/mako"
    "$HOME/.config/nvim"
    "$HOME/.config/waybar"
    "$HOME/.config/wofi"
    "$HOME/.config/gtk-3.0"
    "$HOME/.config/gtk-4.0"
    "$HOME/.config/qt5ct"
    "$HOME/.config/qt6ct"
    "$HOME/.config/systemd/change-wallpaper.service"
    "$HOME/.config/systemd/check-battery.service"
    )

for file in "${files[@]}"; do
    if [ -e "$file" ]; then
        cp -r "$file" "$DF"
    fi
done

/usr/bin/git add .
/usr/bin/git commit -m "Update config"
/usr/bin/git push "$GITHUB_REMOTE" "$GITHUB_BRANCH"
