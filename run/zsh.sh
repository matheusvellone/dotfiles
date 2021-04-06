echo "Running zsh dotfile configuration"

sudo apt install gawk

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

ln -fs $PWD/zsh/.zshrc $HOME/.zshrc
ln -fs $PWD/zsh/.p10k.zsh $HOME/.p10k.zsh