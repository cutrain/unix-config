#! /bin/bash
source ../tools/common.sh

cmt 'download ncurses'
doo 'wget ftp://ftp.invisible-island.net/ncurses/ncurses.tar.gz'
doo 'mkdir ncurses'
doo 'tar -zxvf ncurses.tar.gz -C ncurses --strip-components 1'
doo 'cd ncurses'
doo 'export CXXFLAGS='"'"' -fPIC'"'"
doo 'export CFLAGS='"'"' -fPIC'"'"
doo './configure --prefix=$HOME/.local --enable-shared'
doo 'make'
doo 'cd ..'
doo 'make install'
doo 'cd ..'
doo 'export PATH=$HOME/.local/bin:$PATH'
doo 'export LD_LIBRARY_PATH=$HOME/.local/lib:$LD_LIBRARY_PATH'
doo 'export CFLAGS=-I$HOME/.local/include'
doo 'export CPPFLAGS="-I$HOME/.local/include" LDFLAGS="-L$HOME/.local/lib"'
doo 'git clone git://github.com/zsh-users/zsh.git'
doo 'cd zsh'
doo 'autoheader'
doo 'autoconf'
doo './configure --prefix=$HOME/.local --enable-shared'
doo 'make'
doo 'make install'



