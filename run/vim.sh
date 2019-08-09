echo "Running vim dotfile configuration"

sudo apt-get install -y neovim

mkdir -p $HOME/.config/nvim
ln -fs $PWD/vim/init.vim $HOME/.config/nvim/init.vim
