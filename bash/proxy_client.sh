#! /bin/bash
source ../tools/common.sh

INSTALL_DIR=$HOME/.local/bin
if [[ "$(echo $SHELL | grep 'zsh')" != "" ]]
then
	cmt 'using zsh'
	BASH_FILE=$HOME/.zshrc
elif [[ $(echo $SHELL | grep 'bash') != "" ]]
then
	cmt 'using bash'
	BASH_FILE=$HOME/.bashrc
fi

#sudo colorText $Yellow "start"
#doo 'sudo apt-get install -y python-setuptools m2crypto'
#doo 'export LC_ALL=C'
echo -n "input your proxy address:"
read ADDRESS
echo -n "input your proxy password:"
read -s PASSWORD
echo ''
echo -n "input your proxy port:"
read PORT


doo 'pip install shadowsocks'
doo "(echo $PATH | grep "$HOME/.local/bin") || (mkdir -p $INSTALL_DIR && (echo 'export PATH=$HOME/.local/bin:$PATH' >> $BASH_FILE))"
doo "cp ../config/proxy/ss_client $INSTALL_DIR"
doo "cp ../config/proxy/gq_client $INSTALL_DIR"
doo "vim -c '%s/ADDRESS=.*/ADDRESS=$ADDRESS' -c 'wq' $INSTALL_DIR/gq_client"
doo "vim -c '%s/PORT=.*/PORT=$PORT' -c 'wq' $INSTALL_DIR/gq_client"

doo "cp ../config/proxy/.shadowsocks_client.json $HOME"
doo "vim -c '%s/\"server\":\\\".*\\\"/\"server\":\"$ADDRESS\"' -c 'wq' $HOME/.shadowsocks_client.json"
doo "vim -c '%s/\"password\":\\\".*\\\"/\"password\":\"$PASSWORD\"' -c 'wq' $HOME/.shadowsocks_client.json"
doo "vim -c '%s/\"server_port\":.*,/\"server_port\":$PORT,' -c 'wq' $HOME/.shadowsocks_client.json"

doo "cp ../config/proxy/.gq_client.json $HOME"

if [ ! -e $INSTALL_DIR/gq-client ] ;then
	cmt 'If you can`t use gq-client, please download from "https://github.com/cbeuw/GoQuiet/releases" for proper version, watching architecture by command "uname -m"'
	cmt 'Downloading gq-client'
	doo 'wget -c https://github.com/cbeuw/GoQuiet/releases/download/v1.2.2/gq-client-linux-386-1.2.2 -O gq-client'
	doo 'chmod +x gq-client'
	doo "mv gq-client $INSTALL_DIR"
fi
