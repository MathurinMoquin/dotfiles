#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='\[\e[0;32m\]\u@\h \[\e[0;34m\]\W \$\[\e[0m\] '

for FILE in $HOME/.config/zshrc/*.sh; do
    source $FILE
done

# reboot in windows: grub-reboot Windows (not tryed yet)

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


[ -f "/home/math/.ghcup/env" ] && . "/home/math/.ghcup/env" # ghcup-env

alias docker='sudo docker'

export GUARDIAN_SECRET_KEY=_qFGLqNFaberiUQmJyw60EEK5mqaizbu_9ji1Vb0CghGmbKoh8fN3HUIIrA7NYLv
