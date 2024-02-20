#!/bin/bash

cp -ar config ~/.config

if which yay &> /dev/null; then
    yay -Syu --needed $(awk '!/^#/{print $0}' packages-repository.txt)
else
    sudo pacman -Syu --needed $(awk '!/^#/{print $0}' packages-repository.txt)
fi

# Setup zsh as default shell.
mkdir -p ~/.cache/shell
if [ $(basename "$SHELL") != "zsh" ]; then
    chsh -s /bin/zsh
fi
echo "export ZDOTDIR=$HOME/.config/zsh" > ~/.zshenv


