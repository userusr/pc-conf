#!/bin/sh

vim_bundle=$HOME/.vim/bundle

[ -d $vim_bundle ] && exit

mkdir -p $vim_bundle \
    && cd $vim_bundle \
    && git clone --depth 1 https://github.com/VundleVim/Vundle.vim.git $vim_bundle/Vundle.vim \
    && git clone --depth 1 https://github.com/altercation/vim-colors-solarized.git $vim_bundle/vim-colors-solarized
    && vim +PluginInstall +qall

