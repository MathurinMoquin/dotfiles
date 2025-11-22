**My dotfiles**
----
* **Needs to be cloned in $HOME**
* **The dotfiles folder contains all the config that need to be call in .zshrc by :**
  ```zsh
  for FILE in $HOME/.configs/dotfiles/*.sh; do
    source $FILE
  done
  ```
