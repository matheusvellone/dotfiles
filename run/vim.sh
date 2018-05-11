echo "Running vim dotfile configuration"

mkdir -p /home/$USER/.config/nvim
ln -s $PWD/vim/init.vim /home/$USER/.config/nvim/init.vim
