echo "Running zsh dotfile configuration"

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

npm install -g typewritten

ln -fs $PWD/zsh/.zshrc $HOME/.zshrc