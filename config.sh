#! /bin/bash
ct() {
	echo -ne "\033[$1;1m"
	echo -n $2
	echo -e "\033[0m"
}
ef="ct 32 Finish"

ct 36 "Copy config files"
cp .tmux.conf ~
cp .vimrc ~
$ef
ct 36 "Install workenv tools"
sudo apt-get install -y vim git tmux zsh curl build-essential cmake python-dev python3-dev python-pip python3-pip
$ef
ct 36 "Downloading zsh config"
sudo sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp .zshrc ~/.zshrc
$ef
ct 36 "Config vim plugins"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim -c BundleInstall -c qa ~/.vimrc
$ef

# The following is installing the plugin YouCompleteMe, it will spend a lot of time, if you don't have enough time, delete it in .vimrc
ct 33 "It's going to config YouCompleteMe, it will spend lots of time, you can stop it using Ctrl+C"
ct 36 "Configing YouCompleteMe..."
cp .ycm_extra_conf.py ~/.vim/bundle/YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe/
./install.py --clang-completer
$ef
