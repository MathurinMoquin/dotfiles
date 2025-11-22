#!/bin/bash

DF="$HOME/.dotfiles"
GITHUB_LINK="git@github.com:MathurinMoquin/dotfiles.git"
GITHUB_REMOTE="origin"
GITHUB_BRANCH="updateScript"

mkdir -p "$DF"

cd "$DF"

dotfiles()
{
    /usr/bin/git --git-dir="$DF" --work-tree="$HOME" "$@"
}

if [ ! -d "$DF/HEAD" ]; then
    /usr/bin/git init --bare
    dotfiles config --local status.showUntrackedFiles no
    dotfiles remote add "$GITHUB_REMOTE" "$GITHUB_LINK"
fi

files=(
    "$HOME/.bash_profile"
    "$HOME/.bashrc"
    "$HOME/.scripts"
    "$HOME/.themes"
    "$HOME/.vim"
    "$HOME/.tmux.conf"
    "$HOME/.vimrc"
    "$HOME/.zshrc"
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
    "$HOME/plsgit/updatemaster.txt"
    )

for file in "${files[@]}"; do
    if [ -e "$file" ]; then
        dotfiles add "$file"
    fi
done

if ! dotfiles diff --cached --quiet; then
    dotfiles checkout -b "$GITHUB_BRANCH"
    dotfiles commit -m "update"
    dotfiles push "$GITHUB_REMOTE" "$GITHUB_BRANCH" || echo "Push failed"
fi
