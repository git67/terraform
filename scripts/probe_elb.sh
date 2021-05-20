#!/bin/bash

ELB=${1:-"NONE"}

if [ ${ELB} = "NONE" ]; then
	exit 1
fi

while true
do
	wget -q ${ELB}
	grep eth0 index.html
	rm index.html*
done
