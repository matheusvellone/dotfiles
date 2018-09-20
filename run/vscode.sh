echo "Running vscode dotfile configuration"

mkdir -p /home/$USER/.config/Code/User
ln -fs $PWD/vscode/vscode.json /home/$USER/.config/Code/User/settings.json
