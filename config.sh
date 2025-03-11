#! /bin/bash
source ./tools/common.sh

cmt 'Copy config files'
doo 'cp ./config/tmux/.tmux.conf ~'
doo 'cp ./config/vim/.vimrc ~'
doo 'cp -r ./config/pip/.pip ~'

cmt 'config git'
doo 'cp ./config/git/.gitconfig ~'
doo 'cp ./config/git/.gitmessage ~'
cmt 'remember to change your github email & username by {git config --global user.email="YourEmail@gmail.com"} & {git config --global user.user="YourUserName"}'

cmt 'Installing zsh'
if [ ! -e ~/.oh-my-zsh ] ;then
	cmt 'Downloading oh-my-zsh config'
	doo 'sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" <<< exit'
fi


cmt 'Setting up zsh'
doo 'cp ./config/zsh/.zshrc ~/.zshrc'
doo 'cp ./config/zsh/.zprofile ~/.zprofile'

cmt 'Config vim plugins'
if [ ! -e ~/.vim/bundle/Vundle.vim ] ;then
	cmt 'Cloning Vundle'
	doo 'git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim'
fi
doo 'vim -c BundleInstall -c qa ~/.vimrc'

cmt 'install ollama'
doo 'curl -fsSL https://ollama.com/install.sh | sh'

cmt 'install shell-gpt, using local ollama/llama3.1(8b)'
doo 'pip install "shell-gpt[litellm]"'
doo 'cp ./config/shell_gpt/.sgptrc ~/.config/shell_gpt/.sgptrc'
doo "sed -i \"s|\\\$HOME|$HOME|g\" ~/.config/shell_gpt/.sgptrc"

cmt 'download llama3.1 for ollama'
doo 'ollama pull llama3.1'
