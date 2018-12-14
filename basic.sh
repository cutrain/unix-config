#! /bin/bash
source ./tools/common.sh

cmt 'Install basic tools'
doo 'sudo apt-get update'
doo 'sudo apt-get install -y vim git tmux zsh curl build-essential cmake python-dev python3-dev python-pip python3-pip autojump openssh-server'
