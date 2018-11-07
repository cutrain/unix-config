#!/bin/bash
git clone git://github.com/joelthelion/autojump.git
cd autojump
./install.sh
echo '[[ -s $HOME/.autojump/etc/profile.d/autojump.sh ]] && source $HOME/.autojump/etc/profile.d/autojump.sh' >> ~/.zshrc
echo 'autoload -U compinit && compinit -u' >> ~/.zshrc

