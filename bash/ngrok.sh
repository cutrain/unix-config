#!/bin/bash
ct() {
	echo -ne "\033[$1;1m"
	echo -n $2
	echo -e "\033[0m"
}
ef=`ct 32 Succeed`
er=`ct 31 Failed`
doo() {
	ct 33 "running '$*'"
	eval "$*" && echo $ef || echo $er
}
cmt() {
	ct 36 $*
}
# NOTE: should use >= go-1.7.0
doo 'sudo apt-get install -y git build-essential golang-1.10 mercurial'
doo 'export GOROOT=/usr/lib/go-1.10'
doo 'sudo rm -f /usr/bin/go'
doo 'sudo ln -s /usr/lib/go-1.10/bin/go /usr/bin/go'

doo 'git clone https://github.com/inconshreveable/ngrok.git ngrok'
doo 'cd ngrok'

# NOTE: change the domain
doo 'NGROK_DOMAIN="ngrok.cutrain.top"'

doo 'openssl genrsa -out base.key 2048'
doo 'openssl req -new -x509 -nodes -key base.key -days 10000 -subj "/CN=$NGROK_DOMAIN" -out base.pem'
doo 'openssl genrsa -out server.key 2048'
doo 'openssl req -new -key server.key -subj "/CN=$NGROK_DOMAIN" -out server.csr'
doo 'openssl x509 -req -in server.csr -CA base.pem -CAkey base.key -CAcreateserial -days 10000 -out server.crt'

doo 'cp base.pem assets/client/tls/ngrokroot.crt'

doo 'make release-server release-client'
doo 'sudo cp bin/ngrokd /usr/local/bin/ngrokd'
doo 'sudo cp bin/ngrok /usr/local/bin/ngrok'
doo 'mkdir -p ~/.ngrok'
doo 'cp server.key ~/.ngrok'
doo 'cp server.crt ~/.ngrok'

doo 'touch start_ngrok'
doo 'echo "sudo /usr/local/bin/ngrokd -tlsKey=$HOME/.ngrok/server.key -tlsCrt=$HOME/.ngrok/server.crt -domain=$NGROK_DOMAIN -httpAddr=\":8081\" -httpsAddr=\":8082\""'


echo "Please copy '/usr/local/bin/ngrok' into your client"
echo "ngrok client config file exists in this file 'unix-config/config/ngrok/.ngrok'"


