#! /bin/bash
source ./tools/common.sh

cmt 'Copy config files'
doo 'cp ./config/tmux/.tmux.conf ~'
doo 'cp ./config/vim/.vimrc ~'
doo 'cp -r ./config/pip/.pip ~'

cmt 'config git'
doo 'cp ./config/git/.gitconfig ~'
doo 'cp ./config/git/.gitmessage ~'

cmt 'Downloading zsh config'
doo 'sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" <<< exit'

cmt 'setting zsh'
doo 'cp ./config/zsh/.zshrc ~/.zshrc'
doo 'cp ./config/zsh/.zprofile ~/.zprofile'

cmt 'Config vim plugins'
doo 'git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim'
doo 'vim -c BundleInstall -c qa ~/.vimrc'

