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
echo -n "input your proxy password:"
read -s PASSWORD
echo ''
echo -n "input your proxy port:"
read PORT

doo 'pip install shadowsocks'
doo "(echo $PATH | grep "$HOME/.local/bin") || (mkdir -p $INSTALL_DIR && (echo 'export PATH=$HOME/.local/bin:$PATH' >> $BASH_FILE))"
doo "cp ../config/proxy/ss_server $INSTALL_DIR"
doo "cp ../config/proxy/gq_server $INSTALL_DIR"
doo "vim -c '%s/PORT=.*/PORT=$PORT' -c 'wq' $INSTALL_DIR/gq_server"

doo "cp ../config/proxy/.gq_server.json $HOME"

doo "cp ../config/proxy/.shadowsocks_server.json $HOME"
doo "vim -c '%s/\"password\":\\\".*\\\"/\"password\":\"$PASSWORD\"' -c 'wq' $HOME/.shadowsocks_server.json"
doo "vim -c '%s/\"server_port\":.*,/\"server_port\":$PORT,' -c 'wq' $HOME/.shadowsocks_server.json"

if [ ! -e $INSTALL_DIR/gq-server ] ;then
	cmt 'If you can`t use gq-server, please download from "https://github.com/cbeuw/GoQuiet/releases" for proper version, watching architecture by command "uname -m"'
	cmt 'Downloading gq-server'
	doo 'wget -c https://github.com/cbeuw/GoQuiet/releases/download/v1.2.2/gq-server-linux-386-1.2.2 -O gq-server'
	doo 'chmod +x gq-server'
	doo "mv gq-server $INSTALL_DIR"
fi