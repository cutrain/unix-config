#! /bin/sh
sudo apt-get install git build-essential golang mercurial

git clone https://github.com/inconshreveable/ngrok.git ngrok
cd ngrok

# NOTE: change the domain
NGROK_DOMAIN="ngrok.cutrain.top"

openssl genrsa -out base.key 2048
openssl req -new -x509 -nodes -key base.key -days 10000 -subj "/CN=$NGROK_DOMAIN" -out base.pem
openssl genrsa -out server.key 2048
openssl req -new -key server.key -subj "/CN=$NGROK_DOMAIN" -out server.csr
openssl x509 -req -in server.csr -CA base.pem -CAkey base.key -CAcreateserial -days 10000 -out server.crt

cp base.pem assets/client/tls/ngrokroot.crt

sudo make release-server release-client
sudo cp bin/ngrokd /usr/local/bin/ngrokd
sudo cp bin/ngrok /usr/local/bin/ngrok
mkdir ~/.ngrok
cp server.key ~/.ngrok
cp server.crt ~/.ngrok

touch start_ngrok
echo "sudo /usr/local/bin/ngrokd -tlsKey=$HOME/.ngrok/server.key -tlsCrt=$HOME/.ngrok/server.crt -domain=$NGROK_DOMAIN -httpAddr=\":8081\" -httpsAddr=\":8082\""


echo -e "Please copy '/usr/local/bin/ngrok' into your client"
echo -e "ngrok client config file exists in this file '.ngrok'"


