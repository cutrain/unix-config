export PATH=$HOME/.local/bin:$PATH
export LD_LIBRARY_PATH=$HOME/.local/lib:$LD_LIBRARY_PATH
export LIBRARY_PATH=$HOME/.local/lib:$LIBRARY_PATH
export CPPFLAGS="-I$HOME/.local/include"
export LDFLAGS="-L$HOME/.local/lib"
export SHELL=`which zsh`
exec `which zsh` -l
