#!/bin/bash
source ../tools/common.sh

OLLAMA_MODEL_PATH=

if [ -z "$OLLAMA_MODEL_PATH" ]; then
	echo "Error: please manually specify OLLAMA_MODEL_PATH before run this script"
	exit 1
fi

doo "sudo sed -i '/^\[Service\]/a Environment=\"OLLAMA_MODELS=$OLLAMA_MODEL_PATH\"' /etc/systemd/system/ollama.service"
doo 'sudo systemctl daemon-reload'
doo 'sudo systemctl restart ollama'
