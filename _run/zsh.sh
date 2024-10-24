echo "Running zsh dotfile configuration"

sudo apt install gawk xclip
sudo snap install bw

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

ln -fs $PWD/zsh/.zshrc $HOME/.zshrc
ln -fs $PWD/zsh/.p10k.zsh $HOME/.p10k.zsh

if ! [ -x "$(command -v fzf)" ]; then
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
fi

sudo apt install bat -y
mkdir -p .local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat

# lsd
wget https://github.com/lsd-rs/lsd/releases/download/v1.1.5/lsd-musl_1.1.5_amd64.deb
sudo dpkg -i lsd-musl_1.1.5_amd64.deb
rm lsd-musl_1.1.5_amd64.deb
