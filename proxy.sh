#! /bin/bash
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
sudo ct 32 "start"
doo "sudo apt-get install python-setuptools m2crypto"
doo "pip install shadowsocks"
doo "cp server_vpn.sh ~"
doo "cp client_vpn.sh ~"
doo "cp shadowsocks.json /etc"
