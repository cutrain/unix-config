#! /bin/bash
sslocal -c ~/.shadowsocks.json
# or
# sslocal -s $server_ip -k "password" -p 25 -l 1080 -t 300 -m aes-256-cfb --fast-open
