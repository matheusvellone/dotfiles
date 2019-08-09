echo "Running git dotfile configuration"

sudo apt-get install -y git

ln -fs $PWD/git/.gitconfig $HOME/.gitconfig
