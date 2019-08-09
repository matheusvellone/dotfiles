echo "Running tmux configuration"

sudo apt-get install -y tmux

TPM_DIR=~/.tmux/plugins/tpm

if [ ! -d "$TPM_DIR" ]; then
  echo "Cloning TPM plugin into $TPM_DIR"
  git clone --quiet https://github.com/tmux-plugins/tpm $TPM_DIR
fi

ln -fs $PWD/tmux/.tmux.conf $HOME/.tmux.conf
