echo "Running generic dotfile configuration"

ln -fs $PWD/generic/.bash_profile $HOME/.bash_profile

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
