echo "Running vscode dotfile configuration"

mkdir -p $HOME/.config/Code/User
ln -fs $PWD/vscode/vscode.json $HOME/.config/Code/User/settings.json
ln -fsd $PWD/vscode/snippets $HOME/.config/Code/User
