echo "Running fish dotfile configuration"

mkdir -p ~/.config/fish
echo "source $PWD/fish/main.fish" > $HOME/.config/fish/config.fish

