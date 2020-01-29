echo "Running fish dotfile configuration"

if ! [ -x "$(command -v fish)" ]; then
  sudo apt-get install -y fish
  mkdir -p ~/.config/fish
  echo "source $PWD/fish/main.fish" > $HOME/.config/fish/config.fish
fi

if ! [ -x "$(command -v fzf)" ]; then
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
fi

curl -L https://get.oh-my.fish | fish
