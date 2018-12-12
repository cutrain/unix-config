#!/bin/bash
ct() {
	echo -ne "\033[$1;1m"
	echo -n $2
	echo -e "\033[0m"
}
ef=`ct 32 Succeed`
er=`ct 31 Failed`
doo() {
	ct 33 "running '$*'"
	eval "$*" && echo $ef || echo $er
}
cmt() {
	ct 36 $*
}
doo 'pip install jupyter --user'
doo 'pip install https://github.com/ipython-contrib/jupyter_contrib_nbextensions/tarball/master --user'
doo 'jupyter contrib nbextension install --user'

doo 'mkdir -p $(jupyter --data-dir)/nbextensions'
doo 'git clone https://github.com/lambdalisue/jupyter-vim-binding $(jupyter --data-dir)/nextensions'
doo 'jupyter nbextension enable jupyter-vim-binding/vim_binding'
