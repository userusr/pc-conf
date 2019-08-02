#!/bin/bash

# Compile VIM from sources
#
# See also:
#   - https://vi.stackexchange.com/questions/13564/why-is-vim-for-debian-compiled-without-clipboard
#   - https://gist.github.com/odiumediae/3b22d09b62e9acb7788baf6fdbb77cf8
#   - https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source
#
# Tested on:
#   - LinuxMint 18.3 (17.07.2018)
#   - LinuxMint 19.1 (02.08.2019)

vim_source_dir=~/.vim/vim_source

if [ -d $vim_source_dir ]; then
    echo Directory exists: $vim_source_dir:
    exit 1
fi

mkdir -p $vim_source_dir

# Clean 'vim-*' packages
sudo apt purge $(dpkg-query -f '${binary:Package}\n' -W | grep "^vim-.*") \
    && sudo apt autoremove

sudo apt install liblua5.1-0-dev luajit libluajit-5.1-dev python-dev ruby-dev \
    libperl-dev libncurses5-dev libatk1.0-dev libx11-dev libxpm-dev libxt-dev \
    python3-dev git libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev \
    libbonoboui2-dev libcairo2-dev

# Install the "checkinstall" tool so the "make install" step is
# wrapped and the result is a .deb file that can be removed later by
# your package manager rather than having to hunt down every file deployed
# by "make install", which might not be possible if it overwrites existing
# system files.
sudo apt install checkinstall

git clone https://github.com/vim/vim.git --depth=1 $vim_source_dir
cd $vim_source_dir

# Build quickly (8 parallel jobs, hope your system doesn't get overwhelmed)
make clean \
&& ./configure \
    --enable-multibyte \
    --enable-perlinterp=dynamic \
    --enable-rubyinterp=dynamic \
    --with-ruby-command=/usr/bin/ruby \
    --enable-pythoninterp=dynamic \
    --with-python-config-dir=/usr/lib/python2.7/config-$(uname -m)-linux-gnu \
    --enable-python3interp \
    --with-python3-config-dir=/usr/lib/python3.6/config-3.6m-$(uname -m)-linux-gnu \
    --enable-luainterp \
    --with-luajit \
    --enable-cscope \
    --with-features=huge \
    --with-x \
    --enable-gui \
    --enable-gui=gnome2 \
    --enable-fontset \
    --enable-largefile \
    --disable-netbeans \
    --with-compiledby="$(whoami)" \
    --enable-fail-if-missing \
&& make -j8 \
&& sudo checkinstall --default --nodoc

