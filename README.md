# unix-config
### Dependency
Install some software by command "apt-get"
```bash
./basic.sh # you need sudo authority
```

### Start configure tmux/vim/zsh/git
```bash
./config.sh
```
remember to change your github email & username
```
git config --global user.email="YourEmail@gmail.com"
git config --global user.user="YourUserName"
```

### Install YouCompleteMe & shadowsock
```bash
./extra.sh
sudo apt-get install g++-7 # if failed, try g++-5 and change ./config/vim/.ycm_extra_conf.py where "c++/7" -> "c++/5", also change "-std=c++17" -> "-std=c++11"
```

### Go Completer
copy config/vim/.go_vimrc to ~/.vimrc

install vim>=8 with python3&timers enable

### Shadowsocks usage
#### For server
```bash
./bash/proxy_server.sh
# After installation
gq_server
ss_server
```
#### For client
```bash
./bash/proxy_client.sh
# After installation
gq_client
ss_client
```
#### While running 'ss_client' or 'ss_server': "undefined symbol: EVP_CIPHER_CTX_cleanup" ?
Running fix bash
```bash
./bash/shadowsocks_fix.sh
```

## Q&A (unix problem)
### system
#### how to set default bash?
- chsh -s /bin/zsh
#### how to install software when I don't have root authority?
- apt-get source <software name>
- tar zxvf <software zip bag> (or any other command)
- cd <software dir>
- ./configure --prefix /path/to/your/dir (there may be some other params)
- make && make install

#### how to set system library enviroment?
- export LD_LIBRARY_PATH=/path/you/want:$LD_LIBRARY_PATH

### python
#### pip3.6 require TLS/SSL?
- use http pip source(user)
- install necessary software(root)

#### how to install python package if I'm not root?
- pip install <package> --user

#### shadowsocks Error: undefined symbol: EVP_CIPHER_CTX_cleanup?
- find python\*/site-packages/shadowsocks/crypto/openssl.py
- change libcrypto.EVP_CIPHER_CTX_*cleanup* -> libcrypto.EVP__CIPHER_CTX_*reset*

#### build python3
```bash
./configure --enable-shared --enable-optimizations --prefix=/usr/local/python3
make -j 4 && sudo make install
```

### vim
#### build vim8
```
./configure --with-features=huge --enable-python3interp --with-python3-config-dir=$(python3-config --configdir) --enable-rubyinterp --enable-luainterp --enable-perlinterp --enable-fontset --enable-multibyte --enable-cscope --prefix=/usr/local/vim
make -j 4 && sudo make install
```
