echo "Running tmux configuration"

TPM_DIR=~/.tmux/plugins/tpm

if [ ! -d "$TPM_DIR" ]; then
  echo "Cloning TPM plugin into $TPM_DIR"
  git clone --quiet https://github.com/tmux-plugins/tpm $TPM_DIR
fi

ln -fs $PWD/tmux/.tmux.conf /home/$USER/.tmux.conf
