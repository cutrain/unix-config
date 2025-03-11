#!/bin/bash
source ../tools/common.sh

NAS_MOUNT_PATH=
NAS_REMOTE_ADDR= # e.g 192.168.1.100:/data
AUTO_MOUNT=1 # mount nfs when power on, set 0 to mount only this time
ENABLE_FSCACHE=1 # set 0 to disable fscache
FSCACHE_PATH=

if [ -z "$NAS_MOUNT_PATH" ]; then
	echo "Error: please manually specify NAS_REMOTE_ADDR and NAS_MOUNT_PATH before run this script"
	exit 1
fi

if [ -z "$NAS_REMOTE_ADDR" ]; then
	echo "Error: please manually specify NAS_REMOTE_ADDR and NAS_MOUNT_PATH before run this script"
	exit 1
fi

if [ "$ENABLE_FSCACHE" -eq 1 ]; then
	if [ -z "$FSCACHE_PATH" ]; then
		echo "Error: please manually specify FSCACHE_PATH before run this script"
		exit 1
	fi
fi

doo 'sudo apt-get install nfs-common'
doo "sudo mkdir $NAS_MOUNT_PATH"

if [ "$ENABLE_FSCACHE" -eq 1 ]; then
	doo 'sudo apt install cachefilesd'
	doo "sudo sed -i 's|dir /var/cache/fscache|dir $FSCACHE_PATH|' /etc/cachefilesd.conf"
	doo 'sudo systemctl enable --now cachefilesd'
	if [ "$AUTO_MOUNT" -eq 1 ]; then
		doo "echo \"$NAS_REMOTE_ADDR $NAS_MOUNT_PATH nfs defaults,fsc 0 0\" | sudo tee -a /etc/fstab"
	fi
else
	if [ "$AUTO_MOUNT" -eq 1 ]; then
		doo "echo \"$NAS_REMOTE_ADDR $NAS_MOUNT_PATH nfs defaults 0 0\" | sudo tee -a /etc/fstab"
	fi
fi
doo 'sudo mount -a'
