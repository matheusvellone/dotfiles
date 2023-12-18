echo "Running zsh dotfile configuration"

sudo apt install gawk xclip
sudo snap install bw

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

ln -fs $PWD/zsh/.zshrc $HOME/.zshrc
ln -fs $PWD/zsh/.p10k.zsh $HOME/.p10k.zsh

if ! [ -x "$(command -v fzf)" ]; then
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
fi