#!/bin/bash
source ../tools/common.sh

doo 'pip install jupyter --user'
doo 'pip install https://github.com/ipython-contrib/jupyter_contrib_nbextensions/tarball/master --user'
doo 'jupyter contrib nbextension install --user'

doo 'mkdir -p $(jupyter --data-dir)/nbextensions'
doo 'git clone https://github.com/lambdalisue/jupyter-vim-binding $(jupyter --data-dir)/nextensions'
doo 'jupyter nbextension enable jupyter-vim-binding/vim_binding'
