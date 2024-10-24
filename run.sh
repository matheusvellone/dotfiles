#!/bin/bash

AVAILABLE_DOTFILES=( "vim" "vscode" "git" "tmux" "zsh" "generic docker")


if [ $# -eq 0 ]
then
    for element in ${AVAILABLE_DOTFILES[@]}
    do
        source ./run/$element.sh
    done
else
    SELECTED_TO_RUN=$1

    if [[ ! ${AVAILABLE_DOTFILES[@]} =~ $SELECTED_TO_RUN ]]; then
        echo "Not a correct dotfile config selected"
        exit 1
    fi

    source ./_run/$SELECTED_TO_RUN.sh
fi

echo "Finished running"
exit 0
