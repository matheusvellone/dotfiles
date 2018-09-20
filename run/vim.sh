echo "Running vim dotfile configuration"

mkdir -p /home/$USER/.config/nvim
ln -fs $PWD/vim/init.vim /home/$USER/.config/nvim/init.vim
