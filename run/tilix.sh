echo "Running tilix dotfile configuration"

sudo apt-get install -y tilix

mkdir -p ~/.local/share/fonts
curl -fLo ~/.local/share/fonts/Hack.ttf https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf

dconf load /com/gexperts/Tilix/ < $PWD/tilix/tilix.dconf