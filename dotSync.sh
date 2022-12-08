#! /bin/bash

echo " "
echo "=========Updating Installed.md from zsh_history========="
echo " "
# grep the zsh_history file for install keyword and put it in Dotfiles/installed.md
cat .zsh_history | grep -e 'install' -e 'git clone' -e 'wget' > Dotfiles/installed.md

echo " "
echo "=========Syncing .zshrc file========="
echo " "

#rsync .zshrc
rsync -avP ~/.zshrc ~/Dotfiles

echo " "
echo "=========Syncing .zsh_history========="
echo " "

#rsync .zsh_history
rsync -avP ~/.zsh_history ~/Dotfiles

echo " "
echo "=========Syncing .themes========="
echo " "

#rsync .themes
rsync -avP ~/.themes/ ~/Dotfiles/.themes

echo " "
echo "=========Syncing .icons========="
echo " "

#rsync .icons
rsync -avP ~/.icons/  ~/Dotfiles/.icons

echo " "
echo "=========Updating NalaHistory.txt========="
echo " "

# Put nala history into file
nala history > ~/Dotfiles/NalaHistory.txt

echo " "
echo "=========Updating Neovim init.vim========="
echo " "

#rsync init.vim file
rsync -avP ~/.config/nvim/init.vim ~/Dotfiles

echo " "
echo "=========Updating Kitty config========="
echo " "

#rsync kitty config file
rsync -avP ~/.config/kitty  ~/Dotfiles/kitty

echo " "
echo "=========Updating git repository========="
echo " "

# Push the Dotfiles folder
cd ~/Dotfiles
git add .
read -p "Enter a Commit: " commit
git commit -m "$commit"
git push
