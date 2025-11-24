#!/bin/zsh

# Alias

alias cl='clear'
alias nv='nvim'
alias v='vim'
alias py='python3'
alias b='sudo ~/.script/startBluetooth'
#alias b='sudo service bluetooth start'
alias code='code-oss'
alias runr='cargo run'
# alias up='sudo apt update && sudo apt upgrade'
alias e='exit'
alias :q='exit'
alias rustr='cargo build --release'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias jeu='wine ~/Documents/EchoesOfTheFallen/Echoes\ of\ the\ Fallen.exe'
alias sail='./vendor/bin/sail'
# alias vimz='vim ~/.zshrc'
# alias bn='sudo ~/.script/brightness'

# Hyprland

alias sb='source ~/.bashrc'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias hw='hyprctl clients -j | jq'
alias grepr="grep -r --exclude-dir=node_modules"
#alias vim='nvim'

# Projets
alias nd='cd $HOME/Programs/School/Multiplateforme/notdiscordAll'
alias ndp='cd $HOME/Programs/School/Multiplateforme/notdiscordAll/notdiscordPhoenixApi'
alias nde='cd $HOME/Programs/School/Multiplateforme/notdiscordAll/notdiscordElectron'
alias m2='cd $HOME/Programs/School/Mobile2/exo1pp/src'
alias ps='cd $HOME/Programs/School'

# Object C
alias idf='. $HOME/esp/esp-idf/export.sh'

# Multi
alias notdiscord='export TERM=xterm;ssh root@wproulx09.dev'

# Connect ethernet
alias eth='sudo ip link set enp0s20f0u2u1 up && sudo dhclient enp0s20f0u2u1'
