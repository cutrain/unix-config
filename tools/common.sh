colorText() {
	echo -ne "$1"
	echo -n $2
	echo -e "$OFF"
}
OFF='\033[0m'
Black='\033[1;30m' 
Red='\033[1;31m'   
Green='\033[1;32m' 
Yellow='\033[1;33m'
Blue='\033[1;34m'  
Purple='\033[1;35m'
Cyan='\033[1;36m'  
White='\033[1;37m' 

success() {
	colorText $Green "[✔]$*"
}
fail() {
	colorText $Red "[✘]$*"
}
info() {
	colorText $Yellow "[➭]$*"
}
doo() {
	info "$*"
	eval "$*" && success "Succeed" || fail "Failed"
}
cmt() {
	colorText $Cyan "$*"
}
