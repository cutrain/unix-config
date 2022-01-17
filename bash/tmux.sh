#! /bin/bash
source ../tools/common.sh

doo 'wget https://github.com/tmux/tmux/releases/download/3.2/tmux-3.2.tar.gz'
doo 'wget https://github.com/libevent/libevent/releases/download/release-2.0.22-stable/libevent-2.0.22-stable.tar.gz'
doo 'wget http://ftp.gnu.org/gnu/ncurses/ncurses-6.0.tar.gz'

doo 'tar zxvf tmux-3.2.tar.gz'
doo 'tar zxvf libevent-2.0.22-stable.tar.gz'
doo 'tar zxvf ncurses-6.0.tar.gz'
doo 'cd libevent-2.0.22-stable'
doo './configure --prefix=$HOME/.local --disable-shared'
doo 'make -j7 && make install'
doo 'cd ..'
doo 'cd ncurses-6.0'
doo './configure --prefix=$HOME/.local'
doo 'make -j7 && make install'
doo 'cd ..'
doo 'cd tmux-3.2'
doo './configure CFLAGS="-I$HOME/.local/include -I$HOME/.local/include/ncurses" LDFLAGS="-L$HOME/.local/lib -L$HOME/.local/include/ncurses -L$HOME/.local/include" --prefix=$HOME/.local/'
doo 'make -j7 && make install'
doo 'cd ..'
doo 'echo "export PATH=$HOME/.local/bin:$PATH" >>> ~/.zshrc'
