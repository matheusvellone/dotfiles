echo "Running fish dotfile configuration"

sudo apt-get install -y fish

mkdir -p ~/.config/fish
echo "source $PWD/fish/main.fish" > $HOME/.config/fish/config.fish
