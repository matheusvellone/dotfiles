#!/bin/sh

mkdir -p ~/.config/fish
echo "source $PWD/fish/main.fish" > /home/$USER/.config/fish/config.fish

mkdir -p /home/$USER/.config/nvim
ln -s $PWD/vim/init.vim /home/$USER/.config/nvim/init.vim

mkdir -p /home/$USER/.config/Code/User
ln -s $PWD/vscode/vscode.json /home/$USER/.config/Code/User/settings.json
