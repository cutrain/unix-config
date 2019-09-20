#! /bin/bash
source ../tools/common.sh

INSTALL_DIR=$HOME/.local/bin
BASH_FILE=$HOME/.zshrc
cmt 'If you do not use zsh, please change the bash config file before you execute'

sudo colorText $Yellow "start"
doo 'sudo apt-get install -y python-setuptools m2crypto'
doo 'export LC_ALL=C'
doo 'pip install shadowsocks'
doo "(echo $PATH | grep "$HOME/.local/bin") || (mkdir -p $INSTALL_DIR && (echo 'export PATH=$HOME/.local/bin:$PATH' >> $BASH_FILE))"
doo "cp ../config/proxy/ss_server $INSTALL_DIR"
doo "cp ../config/proxy/.shadowsocks_server.json $HOME"
doo "cp ../config/proxy/.gq_server.json $HOME"

cmt 'If you can`t use gq-server, please download from "https://github.com/cbeuw/GoQuiet/releases" for proper version, watching architecture by command "uname -m"'
doo 'wget -c https://github.com/cbeuw/GoQuiet/releases/download/v1.2.2/gq-server-linux-386-1.2.2 -O gq-server'
doo "mv gq-server $INSTALL_DIR"
