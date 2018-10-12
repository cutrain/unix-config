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
cmt 'Install basic tools'
doo 'sudo apt-get install -y vim git tmux zsh curl build-essential cmake python-dev python3-dev python-pip python3-pip autojump g++-7'

cmt 'Copy config files'
doo 'cp tmux/.tmux.conf ~'
doo 'cp vim/.vimrc ~'
doo 'cp -r pip/.pip ~'

cmt 'config git'
doo 'git config --global user.email "454615501@qq.com"'
doo 'git config --global user.name "cutrain"'
doo 'git config --global core.editor vim'
doo 'git config --global push.default simple'

cmt 'Downloading zsh config'
doo 'sudo sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"'

cmt 'setting zsh'
doo 'cp zsh/.zshrc ~/.zshrc'
doo 'cp zsh/.zprofile ~/.zprofile'
doo 'chsh -s /bin/zsh'

cmt 'Config vim plugins'
doo 'git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim'
doo 'vim -c BundleInstall -c qa ~/.vimrc'

cmt 'Config node denpency'
doo 'wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.6/install.sh | bash'

ct 33 'Install YouCompleteMe'
cmt 'Configing YouCompleteMe...'
doo 'cp .ycm_extra_conf.py ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
doo 'cd ~/.vim/bundle/YouCompleteMe/'
doo 'python3 install.py --clang-completer'
doo 'pip3 install jedi'
