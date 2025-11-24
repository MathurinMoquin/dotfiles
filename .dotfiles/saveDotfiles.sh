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
    ".bash_profile"
    ".bashrc"
    ".scripts"
    ".themes"
    ".vim"
    ".tmux.conf"
    ".vimrc"
    ".zshrc"
    ".dotfiles/install.sh"
    ".dotfiles/saveDotfiles.sh"
    ".config/dotfiles"
    ".config/hypr"
    ".config/kitty"
    ".config/mako"
    ".config/nvim"
    ".config/waybar"
    ".config/wofi"
    ".config/gtk-3.0"
    ".config/gtk-4.0"
    ".config/qt5ct"
    ".config/qt6ct"
    ".config/systemd/change-wallpaper.service"
    ".config/systemd/check-battery.service"
    )

for file in "${files[@]}"; do
    HF="$HOME/$file"
    if [ -e "$HF" ]; then
        dest="$DF/$file"
        mkdir -p "$(dirname "$dest")"
        cp -r "$HF" "$dest"
    fi
done

commit="Update config"

if [ "$#" -eq 0 ]; then
    $commit="$1"
fi

/usr/bin/git add .
/usr/bin/git commit -m "$commit"
/usr/bin/git push "$GITHUB_REMOTE" "$GITHUB_BRANCH"
