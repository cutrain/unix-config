# unix-config
### This config will install the following tools & config them.
- git
- tmux
- vim
- python & python-pip

### RUN
```bash
./config.sh
```

### NOTE
	most bashes need to change parameters

## Q&A (unix problem)
#### pip3.6 require TLS/SSL?
- use http pip source(user)
- install necessary software(root)

#### how to install software when I don't have root authority?
- apt-get source <software name>
- tar zxvf <software zip bag> (or any other command)
- cd <software dir>
- ./config --prefix /path/to/your/dir (there may be some other params)
- make && make install
