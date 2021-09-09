#!/bin/bash
source ../tools/common.sh
doo 'git clone https://github.com/vim/vim.git'
doo 'cd vim'
doo './configure --with-features=huge --enable-python3interp --with-python3-config-dir=/usr/local/python3.8.10/lib/python3.8/config-3.8-x86_64-linux-gnu --enable-rubyinterp --enable-luainterp --enable-perlinterp --enable-fontset --enable-multibyte --enable-cscope --prefix=$HOME/.local/vim'
doo 'make -j 7'
doo 'make install'
