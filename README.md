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
### system
#### how to install software when I don't have root authority?
- apt-get source <software name>
- tar zxvf <software zip bag> (or any other command)
- cd <software dir>
- ./config --prefix /path/to/your/dir (there may be some other params)
- make && make install

#### how to set system library enviroment?
- export LD_LIBRARY_PATH=/path/you/want:$LD_LIBRARY_PATH

### python
#### pip3.6 require TLS/SSL?
- use http pip source(user)
- install necessary software(root)

#### how to install python package if I'm not root?
- pip install <package> --user
