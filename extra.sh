#!/bin/bash
ct() {
	echo -ne "\033[$1;1m"
	echo -n $2
	echo -e "\033[0m"
}
ef="ct 32 Succeed"
er="ct 31 Failed"
doo() {
	ct 33 "running '$*'"
	eval "$*" && $ef || $er
}
cmt() {
	ct 36 $*
}

cmt 'Config vim plugin : YouCompleteMe'
doo 'vim -c %s/vundle#begin()/vundle#begin()\rBundle '"'"'Valloric\/YouCompleteMe'"'"' -c wq ~/.vimrc'
doo 'vim -c BundleInstall -c qa'
doo 'cp ./config/vim/.ycm_extra_conf.py ~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
doo 'cd ~/.vim/bundle/YouCompleteMe/'
doo 'python3 install.py --clang-completer'
doo 'pip3 install jedi'


cmt 'Config shadowsocks client'
doo 'pip3 install shadowsocks'
doo 'mkdir -p ~/local/bin'
doo 'cp ./config/proxy/server_vpn.sh ./config/proxy/client_vpn.sh ~/local/bin'
doo 'cp ./config/proxy/shadowsocks.json ~/.shadowsocks.json'


