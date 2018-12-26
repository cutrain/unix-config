#!/bin/bash

URL="https://10.108.255.249/include/auth_action.php"
username=18210240005
read -s -p "Enter password:" password
ip=10.141.2.231

curl $URL --insecure --data "action=login&username=$username&password=$password&ac_id=1&user_ip=$ip&nas_ip=&user_mac=&save_me=1&ajax=1"
