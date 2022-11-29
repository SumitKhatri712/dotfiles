#! /bin/bash

# grep the zsh_history file for install keyword and put it in Dotfiles/installed.md
cat .zsh_history | grep 'install' > Dotfiles/installed.md

#rsync .zshrc
rsync -avP ~/.zshrc ~/Dotfiles

#rsync .zsh_history
rsync -avP ~/.zsh_history ~/Dotfiles

#rsync .themes
rsync -avP ~/.themes/ ~/Dotfiles/.themes

#rsync .icons
rsync -avP ~/.icons/  ~/Dotfiles/.icons

# Put nala history into file
nala history > ~/Dotfiles/NalaHistory.txt

# Push the Dotfiles folder
cd ~/Dotfiles
git add .
read -p "Enter a Commit: " commit
git commit -m "$commit"
git push
