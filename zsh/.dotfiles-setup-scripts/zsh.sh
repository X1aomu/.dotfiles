#!/bin/bash

if ! `which fzf > /dev/null`; then
    git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
    ~/.fzf/install
fi

git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.zsh/zsh-autosuggestions
