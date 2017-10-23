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
cmt "Copy config files"
doo "cp .tmux.conf ~"
doo "cp .vimrc ~"
cmt "Install workenv tools"
doo "sudo apt-get install -y vim git tmux zsh curl build-essential cmake python-dev python3-dev python-pip python3-pip"
cmt "Downloading zsh config"
doo 'sudo sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"'
doo 'cp .zshrc ~/.zshrc'
cmt "Config vim plugins"
doo 'git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim'
doo 'vim -c BundleInstall -c qa ~/.vimrc'

# The following is installing the plugin YouCompleteMe, it will spend a lot of time, if you don't have enough time, delete it in .vimrc
ct 33 "It's going to config YouCompleteMe, it will spend lots of time, you can stop it using Ctrl+C"
cmt "Configing YouCompleteMe..."
doo 'cp .ycm_extra_conf.py ~/.vim/bundle/YouCompleteMe'
doo 'cd ~/.vim/bundle/YouCompleteMe/'
doo './install.py --clang-completer'
doo 'pip install jedi'
