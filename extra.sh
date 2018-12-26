#!/bin/bash
source ./tools/common.sh

cmt 'Config vim plugin : YouCompleteMe'
doo 'vim -c '"'"'%s/vundle#begin()/vundle#begin()\rPlugin\ '"'"'"'"'"'"'"'"'Valloric\/YouCompleteMe\'"'"'"'"'"'" -c wq ~/.vimrc'
doo 'vim -c BundleInstall -c qa'
doo 'cp ./config/vim/.ycm_extra_conf.py ~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
doo 'cd ~/.vim/bundle/YouCompleteMe/'
doo 'python3 install.py --clang-completer'
doo 'pip3 install jedi'
doo 'cd -'


cmt 'Config shadowsocks client'
doo 'pip3 install shadowsocks'
doo 'mkdir -p ~/.local/bin'
doo 'cp ./config/proxy/ss_client ./config/proxy/ss_server ~/.local/bin'
doo 'cp ./config/proxy/.shadowsocks.json ~/.shadowsocks.json'
