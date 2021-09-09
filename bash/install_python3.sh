#!/bin/bash
source ../tools/common.sh
doo 'wget https://www.python.org/ftp/python/3.9.7/Python-3.9.7.tar.xz'
doo 'tar xvf Python-3.9.7.tar.xz'
doo 'cd Python-3.9.7'
doo './configure --enable-optimizations --prefix=$HOME/.local/python3.8'
doo 'make -j 7'
doo 'make install'
