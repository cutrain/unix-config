#!/bin/bash
source ../tools/common.sh

doo 'git clone git://github.com/joelthelion/autojump.git'
doo 'cd autojump'
doo './install.py'
doo 'echo '"'"'[[ -s $HOME/.autojump/etc/profile.d/autojump.sh ]] && source $HOME/.autojump/etc/profile.d/autojump.sh'"'"' >> ~/.zshrc'
doo 'echo '"'"'autoload -U compinit && compinit -u'"'"' >> ~/.zshrc'
doo 'source ~/.zshrc'
