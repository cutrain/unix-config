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

doo 'git clone git://github.com/joelthelion/autojump.git'
doo 'cd autojump'
doo './install.py'
doo 'echo '"'"'[[ -s $HOME/.autojump/etc/profile.d/autojump.sh ]] && source $HOME/.autojump/etc/profile.d/autojump.sh'"'"' >> ~/.zshrc'
doo 'echo '"'"'autoload -U compinit && compinit -u'"'"' >> ~/.zshrc'
doo 'source ~/.zshrc'
