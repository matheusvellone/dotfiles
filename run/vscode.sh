echo "Running vscode dotfile configuration"

sudo apt install fonts-firacode

mkdir -p $HOME/.config/Code/User
ln -fs $PWD/vscode/vscode.json $HOME/.config/Code/User/settings.json
ln -fs $PWD/vscode/keybindings.json $HOME/.config/Code/User/keybindings.json

rm -rf $HOME/.config/Code/User/snippets
ln -fsd $PWD/vscode/snippets $HOME/.config/Code/User
