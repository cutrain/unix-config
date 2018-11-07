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


cmt 'Copy config files'
doo 'cp ./config/tmux/.tmux.conf ~'
doo 'cp ./config/vim/.vimrc ~'
doo 'cp -r ./config/pip/.pip ~'

cmt 'config git'
doo 'git config --global user.email "454615501@qq.com"'
doo 'git config --global user.name "cutrain"'
doo 'git config --global core.editor vim'
doo 'git config --global push.default simple'

cmt 'Downloading zsh config'
doo 'sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" <<< exit'

cmt 'setting zsh'
doo 'cp ./config/zsh/.zshrc ~/.zshrc'
doo 'cp ./config/zsh/.zprofile ~/.zprofile'

cmt 'Config vim plugins'
doo 'git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim'
doo 'vim -c BundleInstall -c qa ~/.vimrc'

