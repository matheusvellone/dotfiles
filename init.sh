#!/bin/sh

mkdir -p /home/$USER/.config/nvim
ln -s $PWD/init.vim /home/$USER/.config/nvim/init.vim

mkdir -p /home/$USER/.config/Code/User
ln -s $PWD/vscode.json /home/$USER/.config/Code/User/settings.json
