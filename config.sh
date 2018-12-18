#! /bin/bash
source ./tools/common.sh

cmt 'Copy config files'
doo 'cp ./config/tmux/.tmux.conf ~'
doo 'cp ./config/vim/.vimrc ~'
doo 'cp -r ./config/pip/.pip ~'

cmt 'config git'
doo 'cp ./config/git/.gitconfig ~'
doo 'cp ./config/git/.gitmessage ~'

cmt 'Installing zsh'
if [ -z '~/.oh-my-zsh' ] ;then
	cmt 'Downloading oh-my-zsh config'
	doo 'sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" <<< exit'
else
	cmt 'NOTE: You have already installed oh-my-zsh, if you want reinstall it, remove "~/.oh-my-zsh"'
fi


cmt 'Setting up zsh'
doo 'cp ./config/zsh/.zshrc ~/.zshrc'
doo 'cp ./config/zsh/.zprofile ~/.zprofile'

cmt 'Config vim plugins'
if [ -z '~/.vim/bundle/Vundle.vim' ] ;then
	cmt 'Cloning Vundle'
	doo 'git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim'
fi
doo 'vim -c BundleInstall -c qa ~/.vimrc'

