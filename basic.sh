#! /bin/bash
source ./tools/common.sh

cmt 'Install basic tools'
doo 'sudo apt-get update'
doo 'sudo apt-get install -y vim git tmux zsh curl build-essential cmake autojump openssh-server'

cmt 'install conda to manage python'
doo 'sh ./download/miniconda.sh'
doo 'sh miniconda.sh'
