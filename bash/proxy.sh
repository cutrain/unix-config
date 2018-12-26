#! /bin/bash
source ../tools/common/sh

sudo colorText $Yellow "start"
doo "sudo apt-get install -y python-setuptools m2crypto"
doo "export LC_ALL=C"
doo "pip install shadowsocks"
doo "cp ../config/proxy/ss_server ~"
doo "cp ../config/proxy/ss_client ~"
doo "cp ../config/proxy/.shadowsocks.json /etc"
