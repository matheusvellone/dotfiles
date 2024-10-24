echo "Running git dotfile configuration"

sudo apt-get install -y git

npm install -g git-split-diffs

ln -fs $PWD/git/.gitconfig $HOME/.gitconfig
