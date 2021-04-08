#!/usr/bin/bash

PRIV_KEY=${1:-"NONE"}

if [ ${PRIV_KEY} != "NONE" ]; then
	chmod 600 ${PRIV_KEY}
	echo "eval 'ssh-agent -s'" >> ~/.bashrc
	echo "ssh-add ${PRIV_KEY}"
fi
