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
