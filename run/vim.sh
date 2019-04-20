echo "Running vim dotfile configuration"

mkdir -p $HOME/.config/nvim
ln -fs $PWD/vim/init.vim $HOME/.config/nvim/init.vim
