#! /bin/bash
source ../tools/common/sh

sudo ct 32 "start"
doo "sudo apt-get install -y python-setuptools m2crypto"
doo "export LC_ALL=C"
doo "pip install shadowsocks"
doo "cp server_vpn.sh ~"
doo "cp client_vpn.sh ~"
doo "cp shadowsocks.json /etc"
