echo "Running fish dotfile configuration"

mkdir -p ~/.config/fish
echo "source $PWD/fish/main.fish" > /home/$USER/.config/fish/config.fish

