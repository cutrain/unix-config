#! /bin/bash
ct() {
	echo -ne "\033[$1;1m"
	echo -n $2
	echo -e "\033[0m"
}
doo() {
	ct 33 "running '$*'"
	eval "$*" && $ef || $er
}
cmt() {
	ct 36 $*
}
cmt 'Install basic tools'
doo 'sudo apt-get update'
doo 'sudo apt-get install -y vim git tmux zsh curl build-essential cmake python-dev python3-dev python-pip python3-pip autojump openssh-server'
