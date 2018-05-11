echo "Running vscode dotfile configuration"

mkdir -p /home/$USER/.config/Code/User
ln -s $PWD/vscode/vscode.json /home/$USER/.config/Code/User/settings.json
