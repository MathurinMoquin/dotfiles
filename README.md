**My dotfiles**
----
* **Needs to be cloned in $HOME**
* **The zshrc folder contains all the config that need to be call in .zshrc by :**
  ```zsh
  for FILE in $HOME/zshrc/*.sh; do
    source $FILE
  done
  ```
